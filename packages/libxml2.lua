return {
    name = "libxml2",
    description = "GNOME XML parser and toolkit",
    homepage = "https://gitlab.gnome.org/GNOME/libxml2",
    recipe_maintainers = { "tale" },
    default_license = "MIT",
    upstream = {
        git = "https://gitlab.gnome.org/GNOME/libxml2.git",
        tag = "v{version}",
    },
    source = {
        url = "https://download.gnome.org/sources/libxml2/{major}.{minor}/libxml2-{version}.tar.xz",
        archive = "tar.xz",
        strip_prefix = "libxml2-{version}",
    },
    build = {
        backend = "autotools",
        configure = {
            "--enable-shared",
            "--enable-static",
            "--without-python",
            "--without-icu",
            "--without-zlib",
            "--without-readline",
            "--with-history=no",
        },
        dependencies = {
            {
                package = "pkgconf",
                kind = "build",
            },
        },
        libraries = { "lib/libxml2.a", "lib/libxml2.{shared_extension}" },
    },
    outputs = {
        bins = { "xmllint", "xmlcatalog" },
        checks = {
            { "xmllint", "--version" },
            { "xmlcatalog", "--noout", "--create", "/dev/null" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "2.15.4",
        },
        ["aarch64-macos"] = {
            default_version = "2.15.4",
        },
        ["x86_64-linux"] = {
            default_version = "2.15.4",
        },
    },
    versions = {
        ["2.15.4"] = {
            digests = {
                ["aarch64-linux"] = "98087fd181d9070724f3fbc65c7377db03038eb92bd882374daff44940138821",
                ["aarch64-macos"] = "98087fd181d9070724f3fbc65c7377db03038eb92bd882374daff44940138821",
                ["x86_64-linux"] = "98087fd181d9070724f3fbc65c7377db03038eb92bd882374daff44940138821",
            },
        },
    },
}
