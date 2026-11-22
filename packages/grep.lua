return {
    name = "grep",
    description = "GNU grep, print lines that match patterns",
    homepage = "https://www.gnu.org/software/grep/",
    recipe_maintainers = { "tale" },
    default_license = "GPL-3.0-or-later",
    upstream = {
        git = "https://git.savannah.gnu.org/git/grep.git",
        tag = "v{version}",
    },
    source = {
        url = "https://ftp.gnu.org/gnu/grep/grep-{version}.tar.xz",
        archive = "tar.xz",
        strip_prefix = "grep-{version}",
    },
    build = {
        -- Custom steps instead of autotools: its `make check` fails here on gnulib locale and pthread tests.
        backend = "custom",
        steps = {
            configure = {
                {
                    "sh",
                    "./configure",
                    "--prefix={prefix}",
                    "--disable-nls",
                    "--enable-perl-regexp",
                },
            },
            build = {
                { "make", "-j{jobs}" },
            },
            install = {
                { "make", "install" },
            },
        },
        dependencies = {
            {
                package = "pkgconf",
                kind = "build",
            },
            {
                package = "pcre2",
                kind = "link_runtime",
            },
        },
    },
    outputs = {
        bins = { "grep", "egrep", "fgrep" },
        checks = {
            { "grep", "--version" },
            {
                "sh",
                "-c",
                "test \"$(printf 'abc123\\n' | grep -oP 'abc\\K\\d+')\" = 123 && echo ok",
            },
            { "egrep", "--version" },
            { "fgrep", "--version" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "3.12",
        },
        ["aarch64-macos"] = {
            default_version = "3.12",
        },
        ["x86_64-linux"] = {
            default_version = "3.12",
        },
    },
    versions = {
        ["3.12"] = {
            digests = {
                ["aarch64-linux"] = "2649b27c0e90e632eadcd757be06c6e9a4f48d941de51e7c0f83ff76408a07b9",
                ["aarch64-macos"] = "2649b27c0e90e632eadcd757be06c6e9a4f48d941de51e7c0f83ff76408a07b9",
                ["x86_64-linux"] = "2649b27c0e90e632eadcd757be06c6e9a4f48d941de51e7c0f83ff76408a07b9",
            },
        },
    },
}
