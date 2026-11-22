return {
    name = "pinentry",
    description = "Passphrase entry dialogs for GnuPG",
    homepage = "https://gnupg.org/software/pinentry/",
    recipe_maintainers = { "tale" },
    default_license = "GPL-2.0-or-later",
    upstream = {
        listing = "https://www.gnupg.org/ftp/gcrypt/pinentry/",
        tag = "pinentry-{version}.tar.bz2",
    },
    source = {
        url = "https://www.gnupg.org/ftp/gcrypt/pinentry/{tag}",
        archive = "tar.bz2",
        strip_prefix = "pinentry-{version}",
    },
    build = {
        backend = "custom",
        dependencies = {
            {
                package = "rb-unpack",
                kind = "build",
            },
            {
                package = "ncurses",
                kind = "link_runtime",
            },
            {
                package = "libassuan",
                kind = "link_runtime",
            },
            {
                package = "libgpg-error",
                kind = "link_runtime",
            },
        },
        steps = {
            configure = {
                -- macOS keeps iconv in a separate system library that configure does not link.
                {
                    "sh",
                    "-c",
                    [[if [ "$(uname)" = Darwin ]; then set -- "$@" LIBS=-liconv; fi; exec ./configure "$@"]],
                    "sh",
                    "--prefix={prefix}",
                    "--enable-pinentry-curses",
                    "--enable-pinentry-tty",
                    -- The graphical frontends and libsecret are probed from the host otherwise.
                    "--disable-pinentry-gtk2",
                    "--disable-pinentry-gnome3",
                    "--disable-pinentry-qt",
                    "--disable-pinentry-qt5",
                    "--disable-pinentry-fltk",
                    "--disable-pinentry-efl",
                    "--disable-pinentry-emacs",
                    "--disable-libsecret",
                    -- The wide-character headers sit in a subdirectory, and the system ones win otherwise.
                    "--with-ncurses-include-dir={dependencies.ncurses}/include/ncursesw",
                    -- Not every curses object gets the include directory above, and ncurses hides its
                    -- wide-character calls without _XOPEN_SOURCE_EXTENDED.
                    "CPPFLAGS=-I{dependencies.ncurses}/include/ncursesw -D_XOPEN_SOURCE_EXTENDED",
                },
            },
            build = {
                { "make", "-j{jobs}" },
            },
            check = {
                { "make", "check" },
            },
            install = {
                { "make", "install" },
            },
        },
    },
    outputs = {
        bins = { "pinentry", "pinentry-curses", "pinentry-tty" },
        checks = {
            { "pinentry-curses", "--version" },
            { "pinentry-tty", "--version" },
            -- Speak the Assuan protocol and ask which frontend answers.
            {
                "sh",
                "-c",
                [[printf 'SETDESC test\nGETINFO flavor\nBYE\n' | pinentry-tty | grep -q 'D tty']],
            },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "1.3.3",
        },
        ["aarch64-macos"] = {
            default_version = "1.3.3",
        },
        ["x86_64-linux"] = {
            default_version = "1.3.3",
        },
    },
    versions = {
        ["1.3.3"] = {
            digests = {
                ["aarch64-linux"] = "c2970f16d6afb66ecddfca767d743936c86239bff936eed7fd7597a678414b63",
                ["aarch64-macos"] = "c2970f16d6afb66ecddfca767d743936c86239bff936eed7fd7597a678414b63",
                ["x86_64-linux"] = "c2970f16d6afb66ecddfca767d743936c86239bff936eed7fd7597a678414b63",
            },
        },
    },
}
