return {
    name = "libedit",
    description = "BSD line editing and history library",
    homepage = "https://www.thrysoee.dk/editline/",
    recipe_maintainers = { "tale" },
    default_license = "BSD-3-Clause",
    -- No upstream repository publishes release tags, so versions are updated by hand.
    source = {
        url = "https://www.thrysoee.dk/editline/libedit-{version}.tar.gz",
        archive = "tar.gz",
        strip_prefix = "libedit-{version}",
    },
    build = {
        backend = "custom",
        dependencies = {
            {
                package = "ncurses",
                version = "6.6",
                kind = "link",
            },
        },
        libraries = { "lib/libedit.a" },
        steps = {
            configure = {
                {
                    "sh",
                    "./configure",
                    "--prefix=/",
                    "--disable-shared",
                    "--enable-static",
                    "--disable-examples",
                    -- Our ncurses installs its headers under include/ncurses, and libedit's configure
                    -- ignores pkg-config.
                    "CPPFLAGS=-I{dependencies.ncurses}/include/ncurses",
                },
            },
            build = {
                { "make", "-j{jobs}" },
            },
            check = {
                { "make", "check" },
            },
            install = {
                { "make", "DESTDIR={prefix}", "install" },
            },
        },
    },
    outputs = {},
    platforms = {
        ["aarch64-linux"] = {
            default_version = "20260512-3.1",
        },
        ["aarch64-macos"] = {
            default_version = "20260512-3.1",
        },
        ["x86_64-linux"] = {
            default_version = "20260512-3.1",
        },
    },
    versions = {
        ["20260512-3.1"] = {
            digests = {
                ["aarch64-linux"] = "432d5e7ea8b0116dd39f2eca7bc11d0eed77faa6b77ea526ace89907c23ea4a0",
                ["aarch64-macos"] = "432d5e7ea8b0116dd39f2eca7bc11d0eed77faa6b77ea526ace89907c23ea4a0",
                ["x86_64-linux"] = "432d5e7ea8b0116dd39f2eca7bc11d0eed77faa6b77ea526ace89907c23ea4a0",
            },
        },
    },
}
