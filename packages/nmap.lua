return {
    name = "nmap",
    description = "Network discovery and security auditing",
    homepage = "https://nmap.org",
    recipe_maintainers = { "tale" },
    default_license = "LicenseRef-NPSL-0.95",
    -- Nmap's GitHub tags lag its dist tarballs.
    upstream = {
        listing = "https://nmap.org/dist/",
        tag = "nmap-{version}.tgz",
    },
    source = {
        url = "https://nmap.org/dist/{tag}",
        archive = "tar.gz",
        strip_prefix = "nmap-{version}",
    },
    build = {
        backend = "custom",
        dependencies = {
            {
                package = "libpcap",
                kind = "link_runtime",
            },
            -- Nmap's scripting engine is written against the Lua 5.4 API.
            {
                package = "lua",
                version = "5.4.9",
                kind = "link",
            },
            {
                package = "libssh2",
                kind = "link",
            },
            {
                package = "openssl",
                kind = "link_runtime",
            },
            {
                package = "pcre2",
                kind = "link_runtime",
            },
            {
                package = "zlib",
                kind = "link_runtime",
            },
        },
        steps = {
            configure = {
                {
                    "sh",
                    "./configure",
                    "--prefix={prefix}",
                    -- Both are Python programs, and this build doesn't depend on Python.
                    "--without-ndiff",
                    "--without-zenmap",
                    "--with-openssl={dependencies.openssl}",
                    "--with-libpcap={dependencies.libpcap}",
                    "--with-libpcre={dependencies.pcre2}",
                    "--with-libz={dependencies.zlib}",
                    "--with-libssh2={dependencies.libssh2}",
                    "--with-liblua={dependencies.lua}",
                    -- The static liblua needs libm, which ncat's link line leaves out on Linux.
                    "LIBS=-lm",
                    -- The catalog has neither library.
                    "--with-libdnet=included",
                    "--with-liblinear=included",
                },
            },
            build = {
                { "make", "-j{jobs}" },
            },
            install = {
                { "make", "install" },
            },
        },
    },
    outputs = {
        bins = { "nmap", "ncat", "nping" },
        checks = {
            { "nmap", "--version" },
            { "nmap", "-sL", "-n", "127.0.0.1" },
            { "nmap", "--script-help", "default" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "7.993",
        },
        ["aarch64-macos"] = {
            default_version = "7.993",
        },
        ["x86_64-linux"] = {
            default_version = "7.993",
        },
    },
    versions = {
        ["7.993"] = {
            digests = {
                ["aarch64-linux"] = "b9477f6208cd67f6de6d0b58cecd61284947f9728b9b3d446bfa6030da088027",
                ["aarch64-macos"] = "b9477f6208cd67f6de6d0b58cecd61284947f9728b9b3d446bfa6030da088027",
                ["x86_64-linux"] = "b9477f6208cd67f6de6d0b58cecd61284947f9728b9b3d446bfa6030da088027",
            },
        },
    },
}
