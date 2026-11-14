return {
    name = "lcms2",
    description = "Little CMS color management engine",
    homepage = "https://www.littlecms.com/",
    recipe_maintainers = { "tale" },
    default_license = "MIT",
    upstream = {
        github = "mm2/Little-CMS",
        repository_id = 507969,
        tag = "lcms{version}",
    },
    source = {
        url = "https://github.com/mm2/Little-CMS/releases/download/lcms{version}/lcms2-{version}.tar.gz",
        archive = "tar.gz",
        strip_prefix = "lcms2-{version}",
    },
    build = {
        backend = "autotools",
        configure = {
            "--enable-shared",
            "--enable-static",
            "--without-jpeg",
            "--without-tiff",
        },
        libraries = { "lib/liblcms2.a", "lib/liblcms2.{shared_extension}" },
    },
    outputs = {
        bins = { "linkicc", "psicc", "transicc" },
        checks = {
            { "transicc", "-i*sRGB", "-o*Lab" },
            { "linkicc", "-x", "-o", "/dev/null", "*sRGB", "*Lab" },
            { "psicc" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "2.20",
        },
        ["aarch64-macos"] = {
            default_version = "2.20",
        },
        ["x86_64-linux"] = {
            default_version = "2.20",
        },
    },
    versions = {
        ["2.20"] = {
            digests = {
                ["aarch64-linux"] = "18ff5504fa9cc8a2b1f3591180d90ead16c8a2ea78e530523b46eab70e1ca6b9",
                ["aarch64-macos"] = "18ff5504fa9cc8a2b1f3591180d90ead16c8a2ea78e530523b46eab70e1ca6b9",
                ["x86_64-linux"] = "18ff5504fa9cc8a2b1f3591180d90ead16c8a2ea78e530523b46eab70e1ca6b9",
            },
        },
    },
}
