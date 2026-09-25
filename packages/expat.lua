return {
    name = "expat",
    aliases = { "libexpat" },
    description = "Parse XML with a stream-oriented C library",
    homepage = "https://libexpat.github.io/",
    recipe_maintainers = { "tale" },
    default_license = "MIT",
    upstream = {
        github = "libexpat/libexpat",
        repository_id = 80314213,
        tag = "R_{version}",
        separator = "_",
    },
    source = {
        url = "https://github.com/libexpat/libexpat/releases/download/{tag}/expat-{version}.tar.xz",
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
            default_version = "2.8.5",
        },
        ["aarch64-macos"] = {
            default_version = "2.8.5",
        },
        ["x86_64-linux"] = {
            default_version = "2.8.5",
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
        ["2.8.5"] = {
            digests = {
                ["aarch64-linux"] = "1e727b8933ec51a77a9a9d9afcf8e688bce45d907c13e36ab7393fe36e703182",
                ["aarch64-macos"] = "1e727b8933ec51a77a9a9d9afcf8e688bce45d907c13e36ab7393fe36e703182",
                ["x86_64-linux"] = "1e727b8933ec51a77a9a9d9afcf8e688bce45d907c13e36ab7393fe36e703182",
            },
        },
    },
}
