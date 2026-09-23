return {
    name = "expat",
    description = "Parse XML with the Expat library",
    homepage = "https://libexpat.github.io/",
    default_license = "NOASSERTION",
    source = {
        url = "https://github.com/libexpat/libexpat/releases/download/R_2_8_4/expat-{version}.tar.xz",
        archive = "tar.xz",
        strip_prefix = "expat-{version}",
    },
    build = {
        backend = "autotools",
        configure = {
            "--disable-shared",
            "--enable-static",
            "--without-docbook",
            "--without-examples",
        },
        libraries = { "lib/libexpat.a" },
    },
    outputs = {
        bins = { "xmlwf" },
        checks = {
            { "xmlwf", "-v" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "2.8.4",
        },
        ["aarch64-macos"] = {
            default_version = "2.8.4",
        },
        ["x86_64-linux"] = {
            default_version = "2.8.4",
        },
    },
    versions = {
        ["2.8.4"] = {
            digests = {
                ["aarch64-linux"] = "656ae1cc8da3b4ea513bb4e254f33e6243938084c0ec6239da873376b09985a7",
                ["aarch64-macos"] = "656ae1cc8da3b4ea513bb4e254f33e6243938084c0ec6239da873376b09985a7",
                ["x86_64-linux"] = "656ae1cc8da3b4ea513bb4e254f33e6243938084c0ec6239da873376b09985a7",
            },
        },
    },
}
