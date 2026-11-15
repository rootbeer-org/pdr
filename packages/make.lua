return {
    name = "make",
    description = "Build targets from makefiles",
    homepage = "https://www.gnu.org/software/make/",
    recipe_maintainers = { "tale" },
    default_license = "GPL-3.0-or-later",
    upstream = {
        git = "https://https.git.savannah.gnu.org/git/make.git",
    },
    source = {
        url = "https://ftp.gnu.org/gnu/make/make-{version}.tar.gz",
        archive = "tar.gz",
        strip_prefix = "make-{version}",
        patches = {
            "tests-archives-ar.patch",
            "tests-ignore-xcrun-cache.patch",
        },
    },
    build = {
        backend = "autotools",
        configure = { "--disable-nls", "--without-guile" },
    },
    outputs = {
        bins = { "make" },
        checks = {
            { "make", "--version" },
            {
                "make",
                "--no-builtin-rules",
                "--file=/dev/null",
                "--eval=all:;@test '$(MAKE_VERSION)' = {version}",
                "all",
            },
            {
                "make",
                "--no-builtin-rules",
                "--file=/dev/null",
                '--eval=all:; +@set -eu; unset MAKEFLAGS MFLAGS; directory=$$(mktemp -d); trap \'rm -rf "$$directory"\' EXIT; cd "$$directory"; printf \'%s\\n\' \'all: first second\' \'first second &: input; @cp input first; cp input second\' \'input:; @printf "%s\\n" rootbeer-make-ok > input\' > Makefile; "$(MAKE)" --no-print-directory -j2; "$(MAKE)" --no-print-directory -q; test "$$(cat first)" = rootbeer-make-ok; test "$$(cat second)" = rootbeer-make-ok; printf \'%s\\n\' changed > input; "$(MAKE)" --no-print-directory -W input; test "$$(cat first)" = changed; test "$$(cat second)" = changed',
                "all",
            },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "4.4.1",
        },
        ["aarch64-macos"] = {
            default_version = "4.4.1",
        },
        ["x86_64-linux"] = {
            default_version = "4.4.1",
        },
    },
    versions = {
        ["4.4.1"] = {
            digests = {
                ["aarch64-linux"] = "dd16fb1d67bfab79a72f5e8390735c49e3e8e70b4945a15ab1f81ddb78658fb3",
                ["aarch64-macos"] = "dd16fb1d67bfab79a72f5e8390735c49e3e8e70b4945a15ab1f81ddb78658fb3",
                ["x86_64-linux"] = "dd16fb1d67bfab79a72f5e8390735c49e3e8e70b4945a15ab1f81ddb78658fb3",
            },
        },
    },
}
