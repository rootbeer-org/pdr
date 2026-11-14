return {
    name = "libogg",
    description = "Ogg container format library",
    homepage = "https://xiph.org/ogg/",
    recipe_maintainers = { "tale" },
    default_license = "BSD-3-Clause",
    upstream = {
        github = "xiph/ogg",
        repository_id = 33956205,
        tag = "v{version}",
    },
    source = {
        url = "https://downloads.xiph.org/releases/ogg/libogg-{version}.tar.xz",
        archive = "tar.xz",
        strip_prefix = "libogg-{version}",
    },
    build = {
        backend = "autotools",
        configure = {
            "--enable-shared",
            "--enable-static",
            "--with-pic",
        },
        libraries = { "lib/libogg.a", "lib/libogg.{shared_extension}" },
    },
    outputs = {},
    platforms = {
        ["aarch64-linux"] = {
            default_version = "1.3.6",
        },
        ["aarch64-macos"] = {
            default_version = "1.3.6",
        },
        ["x86_64-linux"] = {
            default_version = "1.3.6",
        },
    },
    versions = {
        ["1.3.6"] = {
            digests = {
                ["aarch64-linux"] = "5c8253428e181840cd20d41f3ca16557a9cc04bad4a3d04cce84808677fa1061",
                ["aarch64-macos"] = "5c8253428e181840cd20d41f3ca16557a9cc04bad4a3d04cce84808677fa1061",
                ["x86_64-linux"] = "5c8253428e181840cd20d41f3ca16557a9cc04bad4a3d04cce84808677fa1061",
            },
        },
    },
}
