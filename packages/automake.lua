return {
    name = "automake",
    description = "GNU Makefile.in generator",
    homepage = "https://www.gnu.org/software/automake/",
    recipe_maintainers = { "tale" },
    default_license = "GPL-3.0-or-later",
    upstream = {
        git = "https://git.savannah.gnu.org/git/automake.git",
        tag = "v{version}",
    },
    source = {
        url = "https://ftp.gnu.org/gnu/automake/automake-{version}.tar.xz",
        archive = "tar.xz",
        strip_prefix = "automake-{version}",
    },
    build = {
        backend = "custom",
        -- automake and aclocal run autoconf's tools from PATH.
        dependencies = {
            {
                package = "autoconf",
                kind = "build",
            },
            {
                package = "autoconf",
                kind = "runtime",
            },
            {
                package = "perl",
                kind = "build",
            },
            {
                package = "perl",
                kind = "runtime",
            },
        },
        steps = {
            configure = {
                {
                    "/bin/sh",
                    "./configure",
                    "--prefix={prefix}",
                    "PERL={dependencies.perl}/bin/perl",
                },
            },
            build = {
                { "make", "-j{jobs}" },
            },
            install = {
                { "make", "install" },
            },
        },
    },
    outputs = {
        bins = { "automake", "aclocal" },
        checks = {
            { "automake", "--version" },
            { "aclocal", "--version" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "1.20",
        },
        ["aarch64-macos"] = {
            default_version = "1.20",
        },
        ["x86_64-linux"] = {
            default_version = "1.20",
        },
    },
    versions = {
        ["1.20"] = {
            digests = {
                ["aarch64-linux"] = "f6f34dad4cbe395715762b0710f7c511e39bd5cf777e6b95818ccbecf7714248",
                ["aarch64-macos"] = "f6f34dad4cbe395715762b0710f7c511e39bd5cf777e6b95818ccbecf7714248",
                ["x86_64-linux"] = "f6f34dad4cbe395715762b0710f7c511e39bd5cf777e6b95818ccbecf7714248",
            },
        },
    },
}
