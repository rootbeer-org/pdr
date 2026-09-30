return {
    name = "ncurses",
    description = "Terminal handling and terminfo library",
    homepage = "https://invisible-island.net/ncurses/",
    recipe_maintainers = { "tale" },
    default_license = "X11-distribute-modifications-variant",
    source = {
        url = "https://ftp.gnu.org/gnu/ncurses/ncurses-{version}.tar.gz",
        archive = "tar.gz",
        strip_prefix = "ncurses-{version}",
    },
    build = {
        backend = "custom",
        libraries = {
            "lib/libncursesw.a",
            "lib/libformw.a",
            "lib/libmenuw.a",
            "lib/libpanelw.a",
            "lib/libncurses.a",
            "lib/libform.a",
            "lib/libmenu.a",
            "lib/libpanel.a",
        },
        steps = {
            configure = {
                {
                    "sh",
                    "./configure",
                    "--prefix=/",
                    "--without-shared",
                    "--with-normal",
                    "--without-debug",
                    "--without-ada",
                    "--without-cxx",
                    "--enable-widec",
                    "--without-manpages",
                    "--enable-pc-files",
                    "--with-pkg-config-libdir=/lib/pkgconfig",
                    "--with-terminfo-dirs=/etc/terminfo:/lib/terminfo:/usr/share/terminfo",
                },
            },
            build = {
                { "make", "-j{jobs}" },
            },
            check = {
                { "make", "-C", "include", "check" },
                { "make", "-C", "test", "check" },
                { "progs/tic", "-x", "-o", "test-terminfo", "misc/terminfo.src" },
                { "progs/infocmp", "-A", "test-terminfo", "xterm-256color" },
            },
            install = {
                { "make", "DESTDIR={prefix}", "install" },
                -- Wide only, as Arch builds it: libncursesw is a superset of the narrow library,
                -- so the narrow names alias it and existing dependents link it unchanged.
                {
                    "sh",
                    "-ec",
                    "cd \"$1\"; for lib in ncurses form menu panel; do ln -s lib${lib}w.a lib/lib${lib}.a; ln -s ${lib}w.pc lib/pkgconfig/${lib}.pc; done; mkdir include/ncurses; for header in include/ncursesw/*; do ln -s ../ncursesw/${header##*/} include/ncurses/; done",
                    "sh",
                    "{prefix}",
                },
            },
        },
    },
    outputs = {
        bins = { "tic", "infocmp", "tput" },
        checks = {
            { "tic", "-V" },
            { "infocmp", "-V" },
            { "tput", "-V" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "6.6",
        },
        ["aarch64-macos"] = {
            default_version = "6.6",
        },
        ["x86_64-linux"] = {
            default_version = "6.6",
        },
    },
    versions = {
        ["6.6"] = {
            digests = {
                ["aarch64-linux"] = "355b4cbbed880b0381a04c46617b7656e362585d52e9cf84a67e2009b749ff11",
                ["aarch64-macos"] = "355b4cbbed880b0381a04c46617b7656e362585d52e9cf84a67e2009b749ff11",
                ["x86_64-linux"] = "355b4cbbed880b0381a04c46617b7656e362585d52e9cf84a67e2009b749ff11",
            },
            revision = 2,
        },
    },
}
