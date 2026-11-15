local build = {
    backend = "custom",
    dependencies = {
        {
            package = "cmake",
            kind = "build",
        },
        {
            -- Header-only use (FMT_HEADER_ONLY), so no library is linked.
            package = "fmt",
            kind = "build",
        },
        {
            package = "openssl",
            kind = "link",
        },
        {
            package = "zlib",
            kind = "link_runtime",
        },
        {
            package = "pcre2",
            kind = "link_runtime",
        },
        {
            package = "ncurses",
            kind = "link",
        },
        {
            -- The macOS SDK editline header lacks the readline API the client uses.
            package = "libedit",
            kind = "link",
        },
    },
    libraries = {
        "lib/libmariadb.a",
        "lib/libmariadb.{shared_extension}",
        "lib/libmysqlclient.a",
        "lib/libmysqlclient.{shared_extension}",
        "lib/libmysqlservices.a",
    },
    steps = {
        configure = {
            {
                "cmake",
                "-S",
                ".",
                "-B",
                "build",
                "-DCMAKE_BUILD_TYPE=Release",
                "-DCMAKE_INSTALL_PREFIX={prefix}",
                "-DCMAKE_INSTALL_LIBDIR=lib",
                "-DCMAKE_INSTALL_INCLUDEDIR=include",
                "-DCMAKE_INSTALL_BINDIR=bin",
                "-DINSTALL_SCRIPTDIR=bin",
                "-DINSTALL_MYSQLTESTDIR=",
                "-DINSTALL_SQLBENCHDIR=",
                "-DWITH_UNIT_TESTS=OFF",
                "-DWITH_SSL=system",
                "-DOPENSSL_ROOT_DIR={dependencies.openssl}",
                "-DOPENSSL_USE_STATIC_LIBS=ON",
                "-DWITH_ZLIB=system",
                "-DZLIB_ROOT={dependencies.zlib}",
                "-DWITH_LIBFMT=system",
                "-DLIBFMT_INCLUDE_DIR={dependencies.fmt}/include",
                "-DWITH_PCRE=system",
                "-DWITH_READLINE=OFF",
                "-DCMAKE_POLICY_DEFAULT_CMP0074=NEW",
                "-DCURSES_ROOT={dependencies.ncurses}",
                "-DCURSES_NEED_NCURSESW=TRUE",
                -- ncurses installs its headers under include/ncurses, which the probes must see.
                "-DCURSES_INCLUDE_PATH={dependencies.ncurses}/include/ncurses",
                "-DCMAKE_C_FLAGS=-I{dependencies.ncurses}/include/ncurses",
                "-DCMAKE_CXX_FLAGS=-I{dependencies.ncurses}/include/ncurses",
                "-DCMAKE_DISABLE_FIND_PACKAGE_GSSAPI=TRUE",
                "-DCMAKE_DISABLE_FIND_PACKAGE_CURL=TRUE",
                "-DCMAKE_DISABLE_FIND_PACKAGE_BZip2=TRUE",
                "-DWITH_MARIABACKUP=OFF",
                "-DWITH_JEMALLOC=no",
                "-DWITH_NUMA=OFF",
                "-DWITH_SYSTEMD=no",
                "-DWITH_URING=OFF",
                "-DENABLE_DTRACE=OFF",
                "-DWITHOUT_TOKUDB=1",
                "-DPLUGIN_TOKUDB=NO",
                "-DPLUGIN_MROONGA=NO",
                "-DPLUGIN_SPIDER=NO",
                "-DPLUGIN_OQGRAPH=NO",
                "-DPLUGIN_ROCKSDB=NO",
                "-DPLUGIN_CONNECT=NO",
                "-DPLUGIN_AUTH_GSSAPI=NO",
                "-DPLUGIN_AUTH_PAM=NO",
                "-DPLUGIN_AWS_KEY_MANAGEMENT=NO",
                "-DPLUGIN_HASHICORP_KEY_MANAGEMENT=NO",
                "-DPLUGIN_CRACKLIB_PASSWORD_CHECK=NO",
                "-DPLUGIN_PROVIDER_LZ4=NO",
                "-DPLUGIN_PROVIDER_LZO=NO",
                "-DPLUGIN_PROVIDER_SNAPPY=NO",
                "-DPLUGIN_PROVIDER_LZMA=NO",
                "-DPLUGIN_PROVIDER_BZIP2=NO",
            },
        },
        build = {
            { "cmake", "--build", "build", "--parallel", "{jobs}" },
        },
        install = {
            { "cmake", "--install", "build" },
            -- Perl and shell helpers hardcode host interpreters, and the plugin config
            -- defaults to /usr/local; the scan rejects them and the server needs none.
            {
                "rm",
                "-f",
                "{prefix}/bin/mariadb-access",
                "{prefix}/bin/mariadb-convert-table-format",
                "{prefix}/bin/mariadb-dumpslow",
                "{prefix}/bin/mariadb-find-rows",
                "{prefix}/bin/mariadb-fix-extensions",
                "{prefix}/bin/mariadb-hotcopy",
                "{prefix}/bin/mariadb-setpermission",
                "{prefix}/bin/mariadbd-multi",
                "{prefix}/support-files/mini-benchmark",
                "{prefix}/bin/mysql_convert_table_format",
                "{prefix}/bin/mysql_find_rows",
                "{prefix}/bin/mysql_fix_extensions",
                "{prefix}/bin/mysql_setpermission",
                "{prefix}/bin/mysqlaccess",
                "{prefix}/bin/mysqld_multi",
                "{prefix}/bin/mysqldumpslow",
                "{prefix}/bin/mysqlhotcopy",
            },
            { "rm", "-rf", "{prefix}/share/cmake/mariadb-plugin" },
        },
    },
}

-- Linux crypt() for ENCRYPT() comes from the static libxcrypt; the host's libcrypt.so
-- fails the scan. macOS libSystem provides crypt(), and libxcrypt is Linux-only.
local linuxDependencies = { table.unpack(build.dependencies) }
table.insert(linuxDependencies, { package = "libxcrypt", kind = "link" })
local linuxBuild = {
    backend = build.backend,
    dependencies = linuxDependencies,
    libraries = build.libraries,
    steps = build.steps,
}

return {
    name = "mariadb",
    description = "MariaDB server and client",
    homepage = "https://mariadb.org/",
    recipe_maintainers = { "tale" },
    default_license = "GPL-2.0-only",
    upstream = {
        github = "MariaDB/server",
        repository_id = 19816070,
        tag = "mariadb-{version}",
        -- Follow the 12.3 long-term support line; 13.x and the 12.0-12.2 rolling releases are other lines.
        exclude_tags = { "mariadb-13.*", "mariadb-12.[0-2].*" },
    },
    source = {
        -- The mirror redirector, since archive.mariadb.org is too slow for CI to finish a fetch.
        url = "https://mirror.mariadb.org/mariadb-{version}/source/mariadb-{version}.tar.gz",
        archive = "tar.gz",
        strip_prefix = "mariadb-{version}",
    },
    build = build,
    outputs = {
        bins = {
            "mariadb",
            "mariadbd",
            "mariadb-admin",
            "mariadb-binlog",
            "mariadb-check",
            "mariadb-dump",
            "mariadb-import",
            "mariadb-install-db",
            "mariadb-secure-installation",
            "mariadb-show",
            "mariadb-upgrade",
        },
        checks = {
            { "mariadb", "--version" },
            { "mariadbd", "--version" },
            { "mariadb-admin", "--version" },
            { "mariadb-dump", "--version" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "12.3.4",
            build = linuxBuild,
        },
        ["aarch64-macos"] = {
            default_version = "12.3.4",
        },
        ["x86_64-linux"] = {
            default_version = "12.3.4",
            build = linuxBuild,
        },
    },
    versions = {
        ["12.3.4"] = {
            digests = {
                ["aarch64-linux"] = "75aae4d48df905734e24a85b955bbcdc43f4b122b450bc4ad2bc92f5d1ac578d",
                ["aarch64-macos"] = "75aae4d48df905734e24a85b955bbcdc43f4b122b450bc4ad2bc92f5d1ac578d",
                ["x86_64-linux"] = "75aae4d48df905734e24a85b955bbcdc43f4b122b450bc4ad2bc92f5d1ac578d",
            },
        },
    },
}
