return {
    name = "pkgconf",
    aliases = { "pkg-config" },
    description = "Resolve compiler and linker flags for library dependencies",
    homepage = "https://github.com/pkgconf/pkgconf",
    recipe_maintainers = { "tale" },
    default_license = "pkgconf",
    upstream = {
        github = "pkgconf/pkgconf",
        repository_id = 4180110,
        tag = "pkgconf-{version}",
    },
    source = {
        url = "https://distfiles.ariadne.space/pkgconf/pkgconf-{version}.tar.xz",
        archive = "tar.xz",
        strip_prefix = "pkgconf-{version}",
    },
    build = {
        backend = "custom",
        steps = {
            configure = {
                {
                    "/bin/sh",
                    "./configure",
                    "--prefix={prefix}",
                    "--disable-shared",
                    "--enable-static",
                    "--with-pkg-config-dir=/usr/local/lib/pkgconfig:/usr/local/share/pkgconfig:/usr/lib/pkgconfig:/usr/share/pkgconfig",
                },
            },
            build = {
                { "make", "-j{jobs}" },
            },
            check = {
                {
                    "/usr/bin/env",
                    "-u",
                    "PKG_CONFIG_SYSROOT_DIR",
                    "-u",
                    "PKG_CONFIG_PATH",
                    "PKG_CONFIG_LIBDIR=.",
                    "/bin/sh",
                    "-c",
                    "exec make check",
                },
            },
            install = {
                { "make", "install" },
                { "/bin/ln", "-s", "pkgconf", "{prefix}/bin/pkg-config" },
            },
        },
    },
    outputs = {
        bins = { "pkgconf", "pkg-config" },
        checks = {
            { "pkgconf", "--version" },
            { "pkg-config", "--version" },
            { "pkg-config", "--atleast-pkgconfig-version={version}" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "3.0.11",
        },
        ["aarch64-macos"] = {
            default_version = "3.0.11",
        },
        ["x86_64-linux"] = {
            default_version = "3.0.11",
        },
    },
    versions = {
        ["3.0.10"] = {
            digests = {
                ["aarch64-linux"] = "9371b2f6372da574d4c6dc96fe9b1463037bcf6afcb6671c1555afde7b17e2de",
                ["aarch64-macos"] = "9371b2f6372da574d4c6dc96fe9b1463037bcf6afcb6671c1555afde7b17e2de",
                ["x86_64-linux"] = "9371b2f6372da574d4c6dc96fe9b1463037bcf6afcb6671c1555afde7b17e2de",
            },
        },
        ["3.0.11"] = {
            digests = {
                ["aarch64-linux"] = "d0cd841bc8e55b9da888106c00dc256d05b7d1d8e5a46f4be4eb4c5125bd2dc4",
                ["aarch64-macos"] = "d0cd841bc8e55b9da888106c00dc256d05b7d1d8e5a46f4be4eb4c5125bd2dc4",
                ["x86_64-linux"] = "d0cd841bc8e55b9da888106c00dc256d05b7d1d8e5a46f4be4eb4c5125bd2dc4",
            },
        },
    },
}
