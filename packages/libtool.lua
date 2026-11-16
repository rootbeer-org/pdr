return {
    name = "libtool",
    description = "GNU generic library support script",
    homepage = "https://www.gnu.org/software/libtool/",
    recipe_maintainers = { "tale" },
    default_license = "GPL-2.0-or-later",
    upstream = {
        git = "https://git.savannah.gnu.org/git/libtool.git",
        tag = "v{version}",
    },
    source = {
        url = "https://ftp.gnu.org/gnu/libtool/libtool-{version}.tar.xz",
        archive = "tar.xz",
        strip_prefix = "libtool-{version}",
    },
    build = {
        backend = "custom",
        -- libtoolize finds m4 on PATH.
        dependencies = {
            {
                package = "m4",
                kind = "build",
            },
            {
                package = "m4",
                kind = "runtime",
            },
        },
        libraries = { "lib/libltdl.a", "lib/libltdl.{shared_extension}" },
        steps = {
            configure = {
                { "/bin/sh", "./configure", "--prefix={prefix}" },
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
        bins = { "libtool", "libtoolize" },
        checks = {
            { "libtoolize", "--version" },
            {
                "sh",
                "-ec",
                [[
d=$(mktemp -d)
cd "$d"
printf 'AC_INIT([demo], [1.0])\nLT_INIT\n' > configure.ac
libtoolize --copy
test -f ltmain.sh
]],
            },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "2.6.2",
        },
        ["aarch64-macos"] = {
            default_version = "2.6.2",
        },
        ["x86_64-linux"] = {
            default_version = "2.6.2",
        },
    },
    versions = {
        ["2.6.2"] = {
            digests = {
                ["aarch64-linux"] = "2ef1067c16c97db930fd740cc9bc3d3ba9a583804ae5ac42cc3e8719e49e191e",
                ["aarch64-macos"] = "2ef1067c16c97db930fd740cc9bc3d3ba9a583804ae5ac42cc3e8719e49e191e",
                ["x86_64-linux"] = "2ef1067c16c97db930fd740cc9bc3d3ba9a583804ae5ac42cc3e8719e49e191e",
            },
        },
    },
}
