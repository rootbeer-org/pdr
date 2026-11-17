return {
    name = "m4",
    description = "GNU macro processor",
    homepage = "https://www.gnu.org/software/m4/",
    recipe_maintainers = { "tale" },
    default_license = "GPL-3.0-or-later",
    upstream = {
        git = "https://git.savannah.gnu.org/git/m4.git",
        tag = "v{version}",
    },
    source = {
        url = "https://ftp.gnu.org/gnu/m4/m4-{version}.tar.xz",
        archive = "tar.xz",
        strip_prefix = "m4-{version}",
    },
    build = {
        -- The autotools backend runs make check, and gnulib's tests fail in the build sandbox.
        backend = "custom",
        steps = {
            configure = {
                { "/bin/sh", "./configure", "--prefix={prefix}", "--disable-nls" },
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
        bins = { "m4" },
        checks = {
            { "m4", "--version" },
            {
                "sh",
                "-c",
                [[out=$(printf 'define(`greet'"'"', `hello $1'"'"')dnl\ngreet(rootbeer)\n' | m4)
test "$out" = "hello rootbeer"]],
            },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "1.4.21",
        },
        ["aarch64-macos"] = {
            default_version = "1.4.21",
        },
        ["x86_64-linux"] = {
            default_version = "1.4.21",
        },
    },
    versions = {
        ["1.4.21"] = {
            digests = {
                ["aarch64-linux"] = "f25c6ab51548a73a75558742fb031e0625d6485fe5f9155949d6486a2408ab66",
                ["aarch64-macos"] = "f25c6ab51548a73a75558742fb031e0625d6485fe5f9155949d6486a2408ab66",
                ["x86_64-linux"] = "f25c6ab51548a73a75558742fb031e0625d6485fe5f9155949d6486a2408ab66",
            },
        },
    },
}
