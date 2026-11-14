return {
    name = "readline",
    description = "Line editing and history library",
    homepage = "https://tiswww.case.edu/php/chet/readline/rltop.html",
    recipe_maintainers = { "tale" },
    default_license = "GPL-3.0-or-later",
    upstream = {
        git = "https://git.savannah.gnu.org/git/readline.git",
        tag = "readline-{version}",
        exclude_tags = { "*-alpha*", "*-beta*", "*-rc*" },
    },
    source = {
        url = "https://ftp.gnu.org/gnu/readline/readline-{version}.tar.gz",
        archive = "tar.gz",
        strip_prefix = "readline-{version}",
    },
    build = {
        backend = "custom",
        dependencies = {
            {
                package = "ncurses",
                kind = "link",
            },
        },
        libraries = {
            "lib/libreadline.a",
            "lib/libreadline.{shared_extension}",
            "lib/libhistory.a",
            "lib/libhistory.{shared_extension}",
        },
        steps = {
            configure = {
                {
                    "sh",
                    "./configure",
                    "--prefix={prefix}",
                    "--enable-static",
                    "--enable-shared",
                    "--with-curses",
                    "--disable-install-examples",
                },
            },
            build = {
                -- A dylib can't leave termcap symbols undefined, so macOS links curses in. Linux leaves
                -- them to whatever links readline, since the static ncurses isn't position-independent.
                {
                    "/bin/sh",
                    "-c",
                    'case "$(uname -s)" in Darwin) libs=-lncursesw ;; *) libs= ;; esac; make -j"$1" SHLIB_LIBS="$libs"',
                    "sh",
                    "{jobs}",
                },
            },
            install = {
                { "make", "install" },
            },
        },
    },
    outputs = {},
    platforms = {
        ["aarch64-linux"] = {
            default_version = "8.3",
        },
        ["aarch64-macos"] = {
            default_version = "8.3",
        },
        ["x86_64-linux"] = {
            default_version = "8.3",
        },
    },
    versions = {
        ["8.3"] = {
            digests = {
                ["aarch64-linux"] = "fe5383204467828cd495ee8d1d3c037a7eba1389c22bc6a041f627976f9061cc",
                ["aarch64-macos"] = "fe5383204467828cd495ee8d1d3c037a7eba1389c22bc6a041f627976f9061cc",
                ["x86_64-linux"] = "fe5383204467828cd495ee8d1d3c037a7eba1389c22bc6a041f627976f9061cc",
            },
        },
    },
}
