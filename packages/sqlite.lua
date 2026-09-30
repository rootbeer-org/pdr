return {
    name = "sqlite",
    aliases = { "sqlite3" },
    description = "Embedded SQL database engine and shell",
    homepage = "https://sqlite.org",
    recipe_maintainers = { "tale" },
    default_license = "blessing",
    build = {
        backend = "custom",
        dependencies = {
            {
                package = "libedit",
                version = "20260512-3.1",
                kind = "link",
            },
            {
                package = "ncurses",
                version = "6.6",
                kind = "link",
            },
        },
        libraries = { "lib/libsqlite3.a" },
        steps = {
            configure = {
                {
                    "sh",
                    "./configure",
                    "--prefix=/",
                    "--disable-shared",
                    "--enable-static",
                    "--fts4",
                    "--fts5",
                    "--rtree",
                    "--session",
                    "--dbstat",
                    "--disable-rpath",
                    -- Pins line editing to the catalog libedit instead of whatever the host offers.
                    -- Configure only selects <editline/readline.h> when its own search of host
                    -- prefixes finds it, so the flags switch the shell to that header directly.
                    "--editline",
                    "--with-readline-cflags=-I{dependencies}/include -UHAVE_READLINE -DHAVE_EDITLINE=1",
                    "--with-readline-ldflags=-ledit -lncurses",
                },
            },
            build = {
                { "make", "-j{jobs}" },
            },
            -- The amalgamation release omits upstream's test suite, which needs the full source
            -- tree and Tcl, so the check drives the built shell.
            check = {
                {
                    "./sqlite3",
                    ":memory:",
                    "create virtual table t using fts5(body); insert into t values ('hello world'); select count(*) from t where t match 'hello'; select json_extract('{\"a\":[1,2]}', '$.a[1]');",
                },
            },
            install = {
                { "make", "DESTDIR={prefix}", "install" },
            },
        },
    },
    outputs = {
        bins = { "sqlite3" },
        checks = {
            { "sqlite3", "--version" },
            {
                "sqlite3",
                ":memory:",
                "create table t(x); insert into t values (1), (2); select sum(x), sqlite_version() from t;",
            },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "3.53.4",
        },
        ["aarch64-macos"] = {
            default_version = "3.53.4",
        },
        ["x86_64-linux"] = {
            default_version = "3.53.4",
        },
    },
    versions = {
        ["3.53.4"] = {
            digests = {
                ["aarch64-linux"] = "0e9483900e92cd5de8fd48d16bf9200145a61f7fd5be542a5ac81d8a9516eb9c",
                ["aarch64-macos"] = "0e9483900e92cd5de8fd48d16bf9200145a61f7fd5be542a5ac81d8a9516eb9c",
                ["x86_64-linux"] = "0e9483900e92cd5de8fd48d16bf9200145a61f7fd5be542a5ac81d8a9516eb9c",
            },
            -- Released only on sqlite.org, so versions are updated by hand. Download paths
            -- encode the release year and a padded version number, so each version names its own.
            source = {
                url = "https://sqlite.org/2026/sqlite-autoconf-3530400.tar.gz",
                archive = "tar.gz",
                strip_prefix = "sqlite-autoconf-3530400",
            },
        },
    },
}
