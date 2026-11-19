return {
    name = "valkey",
    description = "In-memory data structure store, a Redis fork",
    homepage = "https://valkey.io/",
    recipe_maintainers = { "tale" },
    default_license = "BSD-3-Clause",
    upstream = {
        github = "valkey-io/valkey",
        repository_id = 775743011,
        tag = "{version}",
    },
    source = {
        url = "https://github.com/valkey-io/valkey/archive/refs/tags/{tag}.tar.gz",
        archive = "tar.gz",
        strip_prefix = "valkey-{version}",
    },
    build = {
        backend = "custom",
        -- The check serves a Unix socket on loopback.
        allow = { "local-network" },
        dependencies = {
            {
                package = "openssl",
                kind = "link_runtime",
            },
        },
        steps = {
            build = {
                {
                    "make",
                    "-j{jobs}",
                    "BUILD_TLS=yes",
                    "OPENSSL_PREFIX={dependencies.openssl}",
                    -- Linux has no default search path to libssl.so, so the binaries carry an rpath to it.
                    "OPENSSL_LDFLAGS=-L{dependencies.openssl}/lib -Wl,-rpath,{dependencies.openssl}/lib",
                    -- Upstream installs redis-* symlinks for compatibility; they would collide with a redis package.
                    "USE_REDIS_SYMLINKS=no",
                    -- OpenSSL 4 deprecates ASN1_STRING_length, which upstream's -Werror=deprecated-declarations turns into a build failure.
                    "WARN=-Wall -W -Wno-missing-field-initializers -Wno-deprecated-declarations -Wstrict-prototypes -Werror=undef",
                },
            },
            check = {
                {
                    "sh",
                    "-ec",
                    'd=$(mktemp -d "$TMPDIR/valkey-check.XXXXXX"); s="$d/s"; ./src/valkey-server --port 0 --unixsocket "$s" --dir "$d" --save \'\' --appendonly no & pid=$!; i=0; until ./src/valkey-cli -s "$s" ping >/dev/null 2>&1; do i=$((i+1)); [ "$i" -lt 100 ] || exit 1; sleep 0.1; done; ./src/valkey-cli -s "$s" set probe ok >/dev/null; ./src/valkey-cli -s "$s" save >/dev/null; ./src/valkey-cli -s "$s" shutdown nosave >/dev/null 2>&1 || true; wait "$pid"; ./src/valkey-check-rdb "$d/dump.rdb"; rm -rf "$d"',
                },
            },
            install = {
                {
                    "make",
                    "install",
                    "PREFIX={prefix}",
                    "BUILD_TLS=yes",
                    "OPENSSL_PREFIX={dependencies.openssl}",
                    "OPENSSL_LDFLAGS=-L{dependencies.openssl}/lib -Wl,-rpath,{dependencies.openssl}/lib",
                    "USE_REDIS_SYMLINKS=no",
                },
            },
        },
    },
    outputs = {
        bins = {
            "valkey-server",
            "valkey-cli",
            "valkey-benchmark",
            "valkey-check-aof",
            "valkey-check-rdb",
            "valkey-sentinel",
        },
        checks = {
            { "valkey-server", "--version" },
            { "valkey-cli", "--version" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "9.2.0",
        },
        ["aarch64-macos"] = {
            default_version = "9.2.0",
        },
        ["x86_64-linux"] = {
            default_version = "9.2.0",
        },
    },
    versions = {
        ["9.1.3"] = {
            digests = {
                ["aarch64-linux"] = "184e34ed2d9b51879b682b5b15205e2b9d677c60280e3cb453be8f520d04e293",
                ["aarch64-macos"] = "184e34ed2d9b51879b682b5b15205e2b9d677c60280e3cb453be8f520d04e293",
                ["x86_64-linux"] = "184e34ed2d9b51879b682b5b15205e2b9d677c60280e3cb453be8f520d04e293",
            },
        },
        ["9.2.0"] = {
            digests = {
                ["aarch64-linux"] = "a02cb44db1269b699629e419d4949e6e51e984b1f0e9a984e8ee1e1b3b7cc36f",
                ["aarch64-macos"] = "a02cb44db1269b699629e419d4949e6e51e984b1f0e9a984e8ee1e1b3b7cc36f",
                ["x86_64-linux"] = "a02cb44db1269b699629e419d4949e6e51e984b1f0e9a984e8ee1e1b3b7cc36f",
            },
        },
    },
}
