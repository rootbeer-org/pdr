return {
    name = "tmux",
    description = "Terminal multiplexer",
    homepage = "https://github.com/tmux/tmux",
    recipe_maintainers = { "tale" },
    default_license = "ISC",
    -- Upstream suffixes patch releases with letters (3.7c), which discovery doesn't treat as
    -- versions, so versions are updated by hand.
    source = {
        url = "https://github.com/tmux/tmux/releases/download/{version}/tmux-{version}.tar.gz",
        archive = "tar.gz",
        strip_prefix = "tmux-{version}",
    },
    build = {
        backend = "custom",
        dependencies = {
            {
                package = "pkgconf@3.0.7",
                kind = "build",
            },
            {
                -- Configure requires yacc even though the release ships the generated parser.
                package = "byacc@20260126",
                kind = "build",
            },
            {
                package = "libevent@2.1.13",
                kind = "link",
            },
            {
                package = "ncurses@6.6",
                kind = "link",
            },
        },
        steps = {
            configure = {
                {
                    "sh",
                    "./configure",
                    "--prefix=/",
                    -- macOS would prefer utf8proc for character widths; it falls back to the
                    -- system wcwidth until the catalog packages utf8proc.
                    "--disable-utf8proc",
                    -- macOS would prefer jemalloc, which returns freed memory to the system sooner;
                    -- it uses the system allocator until the catalog packages jemalloc.
                    "--disable-jemalloc",
                },
            },
            build = {
                { "make", "-j{jobs}" },
            },
            -- Upstream's regress suite needs a TTY and a running server, so the check starts a
            -- detached server on a private socket instead, under /tmp because the build
            -- directory's path exceeds the socket path limit.
            check = {
                {
                    "sh",
                    "-ec",
                    "d=$(mktemp -d /tmp/tmux-check.XXXXXX); s=\"$d/s\"; ./tmux -S \"$s\" -f /dev/null new-session -d -x 80 -y 24 'printf \"\\342\\234\\223 ok\"; sleep 5'; sleep 1; ./tmux -S \"$s\" capture-pane -p | grep -q ok; ./tmux -S \"$s\" kill-server; rm -rf \"$d\"",
                },
            },
            install = {
                { "make", "DESTDIR={prefix}", "install" },
            },
        },
    },
    outputs = {
        bins = { "tmux" },
        checks = {
            { "tmux", "-V" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "3.7c",
        },
        ["aarch64-macos"] = {
            default_version = "3.7c",
        },
        ["x86_64-linux"] = {
            default_version = "3.7c",
        },
    },
    versions = {
        ["3.7c"] = {
            digests = {
                ["aarch64-linux"] = "7c60cae9a0e25288e2e24750aafc9e8800fc7fd4555e447e1b29ee4201cfb3bf",
                ["aarch64-macos"] = "7c60cae9a0e25288e2e24750aafc9e8800fc7fd4555e447e1b29ee4201cfb3bf",
                ["x86_64-linux"] = "7c60cae9a0e25288e2e24750aafc9e8800fc7fd4555e447e1b29ee4201cfb3bf",
            },
        },
    },
}
