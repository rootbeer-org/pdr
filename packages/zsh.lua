return {
    name = "zsh",
    description = "Extended Bourne shell with interactive features",
    homepage = "https://www.zsh.org",
    recipe_maintainers = { "tale" },
    default_license = "MIT-Modern-Variant",
    upstream = {
        git = "https://git.code.sf.net/p/zsh/code",
        tag = "zsh-{version}",
    },
    source = {
        url = "https://www.zsh.org/pub/zsh-{version}.tar.xz",
        archive = "tar.xz",
        strip_prefix = "zsh-{version}",
    },
    build = {
        backend = "custom",
        dependencies = {
            {
                package = "ncurses",
                version = "6.6",
                kind = "link",
            },
        },
        steps = {
            configure = {
                {
                    "sh",
                    "./configure",
                    "--prefix=/",
                    "--sysconfdir=/etc",
                    "--enable-etcdir=/etc",
                    "--enable-multibyte",
                    "--with-term-lib=ncursesw",
                    -- Configure otherwise probes tcsetpgrp on a controlling terminal, which CI lacks.
                    "--with-tcsetpgrp",
                },
                -- Modules load from a compiled-in absolute directory that doesn't exist in the
                -- store, so every module links into the binary instead. --disable-dynamic would
                -- drop most modules rather than link them.
                {
                    "perl",
                    "-pi",
                    "-e",
                    "s/link=dynamic/link=static/ unless m{name=zsh/example }",
                    "config.modules",
                },
            },
            build = {
                { "make", "-j{jobs}" },
            },
            check = {
                { "make", "check" },
            },
            install = {
                { "make", "DESTDIR={prefix}", "install.bin", "install.fns", "install.man" },
            },
        },
    },
    -- Shell functions such as compinit install under share/zsh, but zsh looks them up at the
    -- compiled-in /share/zsh; users add the store path to fpath until zsh can find them
    -- relative to its binary.
    outputs = {
        bins = { "zsh" },
        checks = {
            { "zsh", "--version" },
            {
                "zsh",
                "-fc",
                "zmodload zsh/datetime zsh/mathfunc zsh/stat zsh/curses; print -r -- ${(U)${:-ok}} $(( sqrt(16) ))",
            },
            {
                "zsh",
                "-fc",
                "setopt extendedglob; a=(${(s:,:)${:-b,a,c}}); print -r -- ${(o)a} ${#${:-λx}}",
            },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "5.9.2",
        },
        ["aarch64-macos"] = {
            default_version = "5.9.2",
        },
        ["x86_64-linux"] = {
            default_version = "5.9.2",
        },
    },
    versions = {
        ["5.9.2"] = {
            digests = {
                ["aarch64-linux"] = "36fa734374b44783582cec09bcd67822e2f992c779ec1624ab5596df078d2f81",
                ["aarch64-macos"] = "36fa734374b44783582cec09bcd67822e2f992c779ec1624ab5596df078d2f81",
                ["x86_64-linux"] = "36fa734374b44783582cec09bcd67822e2f992c779ec1624ab5596df078d2f81",
            },
        },
    },
}
