return {
    name = "autoconf",
    description = "GNU configure script generator",
    homepage = "https://www.gnu.org/software/autoconf/",
    recipe_maintainers = { "tale" },
    default_license = "GPL-3.0-or-later",
    upstream = {
        git = "https://git.savannah.gnu.org/git/autoconf.git",
        tag = "v{version}",
    },
    source = {
        url = "https://ftp.gnu.org/gnu/autoconf/autoconf-{version}.tar.xz",
        archive = "tar.xz",
        strip_prefix = "autoconf-{version}",
    },
    build = {
        backend = "custom",
        dependencies = {
            {
                package = "m4",
                kind = "all",
            },
            {
                package = "perl",
                kind = "all",
            },
        },
        steps = {
            configure = {
                {
                    "/bin/sh",
                    "./configure",
                    "--prefix={prefix}",
                    -- The installed scripts run the catalog's tools, not the host's.
                    "M4={dependencies.m4}/bin/m4",
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
        bins = {
            "autoconf",
            "autoheader",
            "autoreconf",
            "autom4te",
            "autoscan",
            "autoupdate",
            "ifnames",
        },
        checks = {
            { "autoconf", "--version" },
            {
                "sh",
                "-ec",
                [[
d=$(mktemp -d)
cd "$d"
printf 'AC_INIT([demo], [1.0])\nAC_OUTPUT\n' > configure.ac
autoconf
./configure
]],
            },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "2.73",
        },
        ["aarch64-macos"] = {
            default_version = "2.73",
        },
        ["x86_64-linux"] = {
            default_version = "2.73",
        },
    },
    versions = {
        ["2.73"] = {
            digests = {
                ["aarch64-linux"] = "9fd672b1c8425fac2fa67fa0477b990987268b90ff36d5f016dae57be0d6b52e",
                ["aarch64-macos"] = "9fd672b1c8425fac2fa67fa0477b990987268b90ff36d5f016dae57be0d6b52e",
                ["x86_64-linux"] = "9fd672b1c8425fac2fa67fa0477b990987268b90ff36d5f016dae57be0d6b52e",
            },
        },
    },
}
