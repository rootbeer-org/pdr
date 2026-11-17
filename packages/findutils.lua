return {
    name = "findutils",
    description = "GNU find, xargs, locate, and updatedb",
    homepage = "https://www.gnu.org/software/findutils/",
    recipe_maintainers = { "tale" },
    default_license = "GPL-3.0-or-later",
    upstream = {
        git = "https://git.savannah.gnu.org/git/findutils.git",
        tag = "v{version}",
    },
    source = {
        url = "https://ftp.gnu.org/gnu/findutils/findutils-{version}.tar.xz",
        archive = "tar.xz",
        strip_prefix = "findutils-{version}",
    },
    build = {
        backend = "custom",
        steps = {
            configure = {
                {
                    "sh",
                    "./configure",
                    "--prefix={prefix}",
                    "--disable-nls",
                    -- The store is read-only, so updatedb's default database goes under /var.
                    "--localstatedir=/var",
                },
            },
            build = {
                { "make", "-j{jobs}" },
            },
            -- Upstream's make check has gnulib threading failures on macOS, so the outputs run instead.
            install = {
                -- Install creates the database directory, which can't be /var from a build.
                { "make", "install", "localstatedir={prefix}/var" },
                { "rmdir", "{prefix}/var" },
            },
        },
    },
    outputs = {
        bins = { "find", "xargs", "locate", "updatedb" },
        checks = {
            { "find", "--version" },
            { "xargs", "--version" },
            {
                "sh",
                "-c",
                "printf 'a\\nb\\n' | xargs -n1 printf '%s\\n' | grep -qx b && printf '%s\\n' ok",
            },
            {
                "sh",
                "-c",
                [[set -e
d=$(mktemp -d)
touch "$d/x.txt"
find "$d" -name '*.txt' | grep -q x.txt
rm -rf "$d"
printf '%s\n' ok]],
            },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "4.11.0",
        },
        ["aarch64-macos"] = {
            default_version = "4.11.0",
        },
        ["x86_64-linux"] = {
            default_version = "4.11.0",
        },
    },
    versions = {
        ["4.11.0"] = {
            digests = {
                ["aarch64-linux"] = "bfd19cb06cc71f3352d567e90284d8cdac02ac89774bbeadf0b533b0c11432fd",
                ["aarch64-macos"] = "bfd19cb06cc71f3352d567e90284d8cdac02ac89774bbeadf0b533b0c11432fd",
                ["x86_64-linux"] = "bfd19cb06cc71f3352d567e90284d8cdac02ac89774bbeadf0b533b0c11432fd",
            },
        },
    },
}
