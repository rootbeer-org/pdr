return {
    name = "postgresql",
    aliases = { "postgres" },
    description = "PostgreSQL server, client tools, and libpq",
    homepage = "https://www.postgresql.org/",
    recipe_maintainers = { "tale" },
    default_license = "PostgreSQL",
    upstream = {
        github = "postgres/postgres",
        repository_id = 927442,
        tag = "REL_{version}",
        separator = "_",
        lines = { by = "major", keep = 2 },
    },
    source = {
        url = "https://ftp.postgresql.org/pub/source/v{version}/postgresql-{version}.tar.gz",
        archive = "tar.gz",
        strip_prefix = "postgresql-{version}",
    },
    build = {
        backend = "custom",
        -- initdb starts a bootstrap server that creates a System V shared memory segment.
        allow = { "ipc" },
        dependencies = {
            -- Configure requires both even though the tarball ships generated parsers.
            {
                package = "bison",
                kind = "build",
            },
            {
                package = "flex",
                kind = "build",
            },
            {
                package = "icu4c",
                kind = "link_runtime",
            },
            {
                package = "lz4",
                kind = "link_runtime",
            },
            -- The catalog's libreadline leaves its termcap symbols to the program that links it.
            {
                package = "ncurses",
                kind = "link_runtime",
            },
            {
                package = "openssl",
                kind = "link_runtime",
            },
            {
                package = "pkgconf",
                kind = "build",
            },
            {
                package = "readline",
                kind = "link_runtime",
            },
            {
                package = "zlib",
                kind = "link_runtime",
            },
            {
                package = "zstd",
                kind = "link_runtime",
            },
        },
        libraries = {
            "lib/libpq.a",
            "lib/libpq.{shared_extension}",
            "lib/libecpg.a",
            "lib/libecpg.{shared_extension}",
            "lib/libecpg_compat.a",
            "lib/libecpg_compat.{shared_extension}",
            "lib/libpgtypes.a",
            "lib/libpgtypes.{shared_extension}",
            "lib/libpgcommon.a",
            "lib/libpgcommon_shlib.a",
            "lib/libpgfeutils.a",
            "lib/libpgport.a",
            "lib/libpgport_shlib.a",
        },
        steps = {
            configure = {
                {
                    "/bin/sh",
                    "./configure",
                    "--prefix={prefix}",
                    "--with-ssl=openssl",
                    "--with-icu",
                    "--with-lz4",
                    "--with-zstd",
                    "--with-readline",
                    "--with-zlib",
                    "--without-perl",
                    "--without-python",
                    "--without-tcl",
                    "--without-llvm",
                    "--without-gssapi",
                    "--without-ldap",
                    "--without-pam",
                    "--without-systemd",
                    "--without-libxml",
                    "--disable-nls",
                },
            },
            build = {
                { "make", "-j{jobs}" },
            },
            install = {
                { "make", "install" },
                -- initdb needs System V shared memory, which the build sandbox allows only through ipc.
                {
                    "sh",
                    "-c",
                    'dir=$(mktemp -d) && "$0" -D "$dir/data" -U postgres --auth=trust >"$dir/initdb.log" 2>&1; status=$?; if [ $status -ne 0 ]; then cat "$dir/initdb.log" >&2; fi; rm -rf "$dir"; exit $status',
                    "{prefix}/bin/initdb",
                },
            },
        },
    },
    outputs = {
        bins = {
            "clusterdb",
            "createdb",
            "createuser",
            "dropdb",
            "dropuser",
            "ecpg",
            "initdb",
            "pg_amcheck",
            "pg_archivecleanup",
            "pg_basebackup",
            "pg_combinebackup",
            "pg_createsubscriber",
            "pg_checksums",
            "pg_config",
            "pg_controldata",
            "pg_ctl",
            "pg_dump",
            "pg_dumpall",
            "pg_isready",
            "pg_receivewal",
            "pg_recvlogical",
            "pg_resetwal",
            "pg_restore",
            "pg_rewind",
            "pg_test_fsync",
            "pg_test_timing",
            "pg_upgrade",
            "pg_verifybackup",
            "pg_waldump",
            "pg_walsummary",
            "pgbench",
            "postgres",
            "psql",
            "reindexdb",
            "vacuumdb",
        },
        checks = {
            { "postgres", "--version" },
            { "psql", "--version" },
            { "pg_config", "--version" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "19.0",
        },
        ["aarch64-macos"] = {
            default_version = "19.0",
        },
        ["x86_64-linux"] = {
            default_version = "19.0",
        },
    },
    versions = {
        ["18.7"] = {
            digests = {
                ["aarch64-linux"] = "19c2dc7d8520e10532d082b43c36c4d2dcc6cd9e40506c6f598e7338f84bbde7",
                ["aarch64-macos"] = "19c2dc7d8520e10532d082b43c36c4d2dcc6cd9e40506c6f598e7338f84bbde7",
                ["x86_64-linux"] = "19c2dc7d8520e10532d082b43c36c4d2dcc6cd9e40506c6f598e7338f84bbde7",
            },
        },
        ["19.0"] = {
            digests = {
                ["aarch64-linux"] = "763a0da85d78278db309b7fdc63dc7f980b256507a97384f074a6c78dd6d926a",
                ["aarch64-macos"] = "763a0da85d78278db309b7fdc63dc7f980b256507a97384f074a6c78dd6d926a",
                ["x86_64-linux"] = "763a0da85d78278db309b7fdc63dc7f980b256507a97384f074a6c78dd6d926a",
            },
        },
    },
}
