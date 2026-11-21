return {
    name = "pcsc-lite",
    description = "Talk to smart cards through the PC/SC interface",
    homepage = "https://pcsclite.apdu.fr/",
    recipe_maintainers = { "tale" },
    default_license = "BSD-3-Clause",
    upstream = {
        github = "LudovicRousseau/PCSC",
        repository_id = 33737168,
    },
    source = {
        url = "https://pcsclite.apdu.fr/files/pcsc-lite-{version}.tar.xz",
        archive = "tar.xz",
        strip_prefix = "pcsc-lite-{version}",
    },
    build = {
        backend = "custom",
        dependencies = {
            { package = "meson", kind = "build" },
            { package = "ninja", kind = "build" },
            { package = "flex", kind = "build" },
            { package = "pkgconf", kind = "build" },
            {
                -- libudev-zero lets pcscd notice readers without udevd or systemd.
                package = "libudev-zero",
                kind = "link",
            },
        },
        -- Static only, since the client talks to whichever pcscd the host runs
        -- and builds that link it need no run-path.
        libraries = { "lib/libpcsclite.a" },
        steps = {
            configure = {
                {
                    "meson",
                    "setup",
                    "build",
                    "--prefix={prefix}",
                    "--libdir=lib",
                    "--buildtype=release",
                    "--default-library=static",
                    "--wrap-mode=nodownload",
                    "-Dlibsystemd=false",
                    "-Dpolkit=false",
                    "-Dlibudev=true",
                },
            },
            build = {
                { "meson", "compile", "-C", "build", "-j", "{jobs}" },
            },
            install = {
                { "meson", "install", "-C", "build" },
            },
        },
    },
    outputs = {},
    platforms = {
        ["aarch64-linux"] = {
            default_version = "2.5.4",
        },
        ["x86_64-linux"] = {
            default_version = "2.5.4",
        },
    },
    versions = {
        ["2.5.4"] = {
            digests = {
                ["aarch64-linux"] = "23b1c644ab4f13269d3a9ff26734f473f622deff6ed60492171a9a25f603f078",
                ["x86_64-linux"] = "23b1c644ab4f13269d3a9ff26734f473f622deff6ed60492171a9a25f603f078",
            },
        },
    },
}
