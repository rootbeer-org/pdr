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
            default_version = "2.10.0",
        },
        ["aarch64-macos"] = {
            default_version = "2.10.0",
        },
        ["x86_64-linux"] = {
            default_version = "2.10.0",
        },
    },
    versions = {
        ["2.10.0"] = {
            digests = {
                ["aarch64-linux"] = "c624ba2998fc65df1163a49641ff3f9ab73138b11641d92c86bee0fb01b1bc7f",
                ["aarch64-macos"] = "c624ba2998fc65df1163a49641ff3f9ab73138b11641d92c86bee0fb01b1bc7f",
                ["x86_64-linux"] = "c624ba2998fc65df1163a49641ff3f9ab73138b11641d92c86bee0fb01b1bc7f",
            },
        },
        ["2.9.0"] = {
            digests = {
                ["aarch64-linux"] = "1e6371862cc31999b368c3b89b49994f0677e1bab5f1b2b85ae3741f5d803051",
                ["aarch64-macos"] = "1e6371862cc31999b368c3b89b49994f0677e1bab5f1b2b85ae3741f5d803051",
                ["x86_64-linux"] = "1e6371862cc31999b368c3b89b49994f0677e1bab5f1b2b85ae3741f5d803051",
            },
        },
    },
}
