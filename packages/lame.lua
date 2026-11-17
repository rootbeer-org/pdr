return {
    name = "lame",
    description = "MP3 encoder library and command-line tool",
    homepage = "https://lame.sourceforge.io/",
    recipe_maintainers = { "tale" },
    default_license = "LGPL-2.0-or-later",
    -- Upstream is SVN on SourceForge with no tags to follow, so versions are bumped by hand.
    source = {
        url = "https://downloads.sourceforge.net/project/lame/lame/{version}/lame-{version}.tar.gz",
        archive = "tar.gz",
        strip_prefix = "lame-{version}",
    },
    build = {
        backend = "autotools",
        dependencies = {
            {
                package = "pkgconf",
                kind = "build",
            },
        },
        configure = {
            "--enable-shared",
            "--enable-static",
            "--with-pic",
            "--disable-gtktest",
            "--disable-debug",
            -- The mpg123 decoder is only for decode-on-the-fly and replaygain; encoding needs none.
            "--disable-decoder",
            -- Keep the progress display off the system curses, which would link a host library.
            "ac_cv_lib_termcap_initscr=no",
            "ac_cv_lib_curses_initscr=no",
            "ac_cv_lib_ncurses_initscr=no",
        },
        libraries = { "lib/libmp3lame.a", "lib/libmp3lame.{shared_extension}" },
        steps = {
            -- frontend/parse.c calls setlocale without locale.h unless iconv works.
            prepare = {
                {
                    "/bin/sh",
                    "-c",
                    "sed 's/^#include <math.h>$/#include <math.h>\\n#include <locale.h>/' frontend/parse.c > frontend/parse.c.new && mv frontend/parse.c.new frontend/parse.c",
                },
            },
        },
    },
    outputs = {
        bins = { "lame" },
        checks = {
            { "lame", "--version" },
            {
                "sh",
                "-c",
                [[set -e
d=$(mktemp -d)
head -c 176400 /dev/zero > $d/in.raw
lame -r -s 44.1 --bitwidth 16 $d/in.raw $d/out.mp3 >/dev/null 2>&1
test -s $d/out.mp3
echo ok]],
            },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "4.0",
        },
        ["aarch64-macos"] = {
            default_version = "4.0",
        },
        ["x86_64-linux"] = {
            default_version = "4.0",
        },
    },
    versions = {
        ["4.0"] = {
            digests = {
                ["aarch64-linux"] = "3df5124d5ad3a98312ffd7ba6a9b36230e4f8a3e66d3ce0f425e336c32d216eb",
                ["aarch64-macos"] = "3df5124d5ad3a98312ffd7ba6a9b36230e4f8a3e66d3ce0f425e336c32d216eb",
                ["x86_64-linux"] = "3df5124d5ad3a98312ffd7ba6a9b36230e4f8a3e66d3ce0f425e336c32d216eb",
            },
        },
    },
}
