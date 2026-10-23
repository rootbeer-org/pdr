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
            default_version = "3.0.10",
        },
        ["aarch64-macos"] = {
            default_version = "3.0.10",
        },
        ["x86_64-linux"] = {
            default_version = "3.0.10",
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
        ["3.0.7"] = {
            digests = {
                ["aarch64-linux"] = "c926ff491cbd9a331a589160811bd97ab1749b4d5198a519338f2cdfabe6940a",
                ["aarch64-macos"] = "c926ff491cbd9a331a589160811bd97ab1749b4d5198a519338f2cdfabe6940a",
                ["x86_64-linux"] = "c926ff491cbd9a331a589160811bd97ab1749b4d5198a519338f2cdfabe6940a",
            },
        },
    },
}
