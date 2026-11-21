return {
    name = "gawk",
    description = "GNU implementation of the AWK programming language",
    homepage = "https://www.gnu.org/software/gawk/",
    recipe_maintainers = { "tale" },
    default_license = "GPL-3.0-or-later",
    upstream = {
        git = "https://git.savannah.gnu.org/git/gawk.git",
        tag = "gawk-{version}",
    },
    source = {
        url = "https://ftp.gnu.org/gnu/gawk/gawk-{version}.tar.xz",
        archive = "tar.xz",
        strip_prefix = "gawk-{version}",
    },
    build = {
        backend = "custom",
        dependencies = {
            {
                package = "readline",
                kind = "link_runtime",
            },
        },
        steps = {
            configure = {
                {
                    "sh",
                    "./configure",
                    "--prefix={prefix}",
                    "--disable-nls",
                    "--disable-mpfr",
                },
            },
            build = {
                { "make", "-j{jobs}" },
            },
            -- The autotools default runs make check, whose pty tests hang without a terminal.
            install = {
                { "make", "install" },
            },
        },
    },
    outputs = {
        bins = { "gawk", "awk", "gawkbug" },
        checks = {
            { "gawk", "--version" },
            { "awk", "--version" },
            {
                "sh",
                "-c",
                [[printf 'a 1\nb 2\nc 3\n' |
    awk '{ s += $2; out = out $1 } END { print out, s }' |
    grep -qx 'abc 6']],
            },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "5.4.2",
        },
        ["aarch64-macos"] = {
            default_version = "5.4.2",
        },
        ["x86_64-linux"] = {
            default_version = "5.4.2",
        },
    },
    versions = {
        ["5.4.1"] = {
            digests = {
                ["aarch64-linux"] = "07f6f7342b7febe4313fc2c2542ad93d64fe20ad8717200109f105a826f5fd37",
                ["aarch64-macos"] = "07f6f7342b7febe4313fc2c2542ad93d64fe20ad8717200109f105a826f5fd37",
                ["x86_64-linux"] = "07f6f7342b7febe4313fc2c2542ad93d64fe20ad8717200109f105a826f5fd37",
            },
        },
        ["5.4.2"] = {
            digests = {
                ["aarch64-linux"] = "b95e4909533b5f988c6b5e5539b3b3ddf76e7d7df02ca2e5b5b7d6f62db78e6a",
                ["aarch64-macos"] = "b95e4909533b5f988c6b5e5539b3b3ddf76e7d7df02ca2e5b5b7d6f62db78e6a",
                ["x86_64-linux"] = "b95e4909533b5f988c6b5e5539b3b3ddf76e7d7df02ca2e5b5b7d6f62db78e6a",
            },
        },
    },
}
