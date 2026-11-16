return {
    name = "gmp",
    description = "GNU multiple precision arithmetic library",
    homepage = "https://gmplib.org",
    recipe_maintainers = { "tale" },
    default_license = "LGPL-3.0-or-later OR GPL-2.0-or-later",
    upstream = {
        listing = "https://ftp.gnu.org/gnu/gmp/",
        tag = "gmp-{version}.tar.xz",
    },
    source = {
        url = "https://ftp.gnu.org/gnu/gmp/gmp-{version}.tar.xz",
        archive = "tar.xz",
        strip_prefix = "gmp-{version}",
    },
    build = {
        backend = "custom",
        dependencies = {
            {
                package = "m4",
                kind = "build",
            },
        },
        libraries = {
            "lib/libgmp.a",
            "lib/libgmp.{shared_extension}",
            "lib/libgmpxx.a",
            "lib/libgmpxx.{shared_extension}",
        },
        steps = {
            configure = {
                -- config.guess names the build machine's exact CPU and gmp tunes its assembly to
                -- it, so the generic triple keeps the library working on older CPUs.
                {
                    "sh",
                    "-c",
                    [[exec ./configure --build="$(./configfsf.guess)" "$@"]],
                    "sh",
                    "--prefix={prefix}",
                    "--enable-cxx",
                },
            },
            build = {
                { "make", "-j{jobs}" },
            },
            check = {
                { "make", "-j{jobs}", "check" },
            },
            install = {
                { "make", "install" },
            },
        },
    },
    outputs = {},
    platforms = {
        ["aarch64-linux"] = {
            default_version = "6.3.0",
        },
        ["aarch64-macos"] = {
            default_version = "6.3.0",
        },
        ["x86_64-linux"] = {
            default_version = "6.3.0",
        },
    },
    versions = {
        ["6.3.0"] = {
            digests = {
                ["aarch64-linux"] = "a3c2b80201b89e68616f4ad30bc66aee4927c3ce50e33929ca819d5c43538898",
                ["aarch64-macos"] = "a3c2b80201b89e68616f4ad30bc66aee4927c3ce50e33929ca819d5c43538898",
                ["x86_64-linux"] = "a3c2b80201b89e68616f4ad30bc66aee4927c3ce50e33929ca819d5c43538898",
            },
        },
    },
}
