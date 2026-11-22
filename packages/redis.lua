return {
    name = "redis",
    description = "In-memory data store and cache",
    homepage = "https://redis.io/",
    recipe_maintainers = { "tale" },
    -- Redis 8 is offered under RSALv2, SSPLv1, or AGPLv3 at the licensee's choice.
    default_license = "LicenseRef-RSALv2 OR SSPL-1.0 OR AGPL-3.0-only",
    upstream = {
        github = "redis/redis",
        repository_id = 156018,
        tag = "{version}",
    },
    source = {
        url = "https://download.redis.io/releases/redis-{version}.tar.gz",
        archive = "tar.gz",
        strip_prefix = "redis-{version}",
    },
    build = {
        backend = "custom",
        -- The check serves a Unix socket.
        allow = { "local-network" },
        dependencies = {
            {
                package = "openssl",
                kind = "link_runtime",
            },
        },
        steps = {
            -- `make all` also builds module test fixtures, which the macOS linker rejects.
            build = {
                {
                    "make",
                    "-C",
                    "src",
                    "-j{jobs}",
                    "BUILD_TLS=yes",
                    "OPENSSL_PREFIX={dependencies.openssl}",
                    "redis-server",
                    "redis-sentinel",
                    "redis-cli",
                    "redis-benchmark",
                    "redis-check-rdb",
                    "redis-check-aof",
                },
            },
            check = {
                {
                    "sh",
                    "-ec",
                    'd=$(mktemp -d "$TMPDIR/redis-check.XXXXXX"); s="$d/s"; ./src/redis-server --port 0 --unixsocket "$s" --dir "$d" --save \'\' --appendonly no & pid=$!; i=0; until ./src/redis-cli -s "$s" ping >/dev/null 2>&1; do i=$((i+1)); [ "$i" -lt 100 ] || exit 1; sleep 0.1; done; ./src/redis-cli -s "$s" set probe ok >/dev/null; ./src/redis-cli -s "$s" save >/dev/null; ./src/redis-cli -s "$s" shutdown nosave >/dev/null 2>&1 || true; wait "$pid"; ./src/redis-check-rdb "$d/dump.rdb"; rm -rf "$d"',
                },
            },
            install = {
                {
                    "sh",
                    "-ec",
                    [[
mkdir -p "{prefix}/bin"
install -m 0755 src/redis-server src/redis-cli src/redis-benchmark "{prefix}/bin/"
for link in redis-sentinel redis-check-rdb redis-check-aof; do
    ln -sf redis-server "{prefix}/bin/$link"
done
]],
                },
            },
        },
    },
    outputs = {
        bins = {
            "redis-server",
            "redis-cli",
            "redis-benchmark",
            "redis-check-aof",
            "redis-check-rdb",
            "redis-sentinel",
        },
        checks = {
            { "redis-server", "--version" },
            { "redis-cli", "--version" },
            { "redis-benchmark", "--version" },
            { "redis-sentinel", "--version" },
            { "redis-check-aof", "--version" },
            { "redis-check-rdb", "--version" },
            -- Checks get no sockets, so these read files. The build's check step runs a server.
            {
                "sh",
                "-ec",
                [[
d=$(mktemp -d "${TMPDIR:-/tmp}/redis-check.XXXXXX")
printf '*1\r\n$4\r\nPING\r\n' > "$d/appendonly.aof"
redis-check-aof "$d/appendonly.aof" | grep -q 'AOF analyzed'
printf 'REDIS0012\376\000\000\001k\001v\377\000\000\000\000\000\000\000\000' > "$d/dump.rdb"
redis-check-rdb "$d/dump.rdb" | grep -q 'RDB looks OK'
rm -rf "$d"
]],
            },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "8.12.0",
        },
        ["aarch64-macos"] = {
            default_version = "8.12.0",
        },
        ["x86_64-linux"] = {
            default_version = "8.12.0",
        },
    },
    versions = {
        ["8.10.3"] = {
            digests = {
                ["aarch64-linux"] = "edde778f6bdee7581e42fc139ca9e07e2822212092f7501f99989656e3629d02",
                ["aarch64-macos"] = "edde778f6bdee7581e42fc139ca9e07e2822212092f7501f99989656e3629d02",
                ["x86_64-linux"] = "edde778f6bdee7581e42fc139ca9e07e2822212092f7501f99989656e3629d02",
            },
        },
        ["8.12.0"] = {
            digests = {
                ["aarch64-linux"] = "b0100a879b2d45dc97d8fda941127609d648f8913008db1b65a2f72a8ae36c8b",
                ["aarch64-macos"] = "b0100a879b2d45dc97d8fda941127609d648f8913008db1b65a2f72a8ae36c8b",
                ["x86_64-linux"] = "b0100a879b2d45dc97d8fda941127609d648f8913008db1b65a2f72a8ae36c8b",
            },
        },
    },
}
