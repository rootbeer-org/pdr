return {
    name = "vim",
    description = "Vi IMproved text editor",
    homepage = "https://www.vim.org",
    recipe_maintainers = { "tale" },
    default_license = "Vim",
    upstream = {
        github = "vim/vim",
        repository_id = 40997482,
        tag = "v{version}",
        -- Vim tags every patch, several a day.
        interval_days = 14,
    },
    source = {
        url = "https://codeload.github.com/vim/vim/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "vim-{version}",
    },
    build = {
        backend = "custom",
        dependencies = {
            {
                package = "ncurses",
                kind = "link_runtime",
            },
        },
        steps = {
            configure = {
                {
                    "sh",
                    "./configure",
                    "--prefix={prefix}",
                    "--with-features=huge",
                    "--enable-multibyte",
                    "--with-tlib=ncurses",
                    "--enable-gui=no",
                    "--without-x",
                    "--disable-nls",
                    -- Pinned off so no host interpreter links in or loads from the host.
                    "--disable-perlinterp",
                    "--disable-pythoninterp",
                    "--disable-python3interp",
                    "--disable-rubyinterp",
                    "--disable-luainterp",
                    "--disable-tclinterp",
                },
            },
            build = {
                { "make", "-j{jobs}" },
            },
            install = {
                { "make", "install" },
                -- Developer scripts with /usr/bin interpreter lines, which the store scan rejects.
                {
                    "sh",
                    "-c",
                    'rm -rf "$1"/share/vim/vim*/tools',
                    "sh",
                    "{prefix}",
                },
            },
        },
    },
    outputs = {
        bins = { "vim", "ex", "view", "rvim", "rview", "vimdiff", "vimtutor", "xxd" },
        checks = {
            { "vim", "--version" },
            {
                "sh",
                "-c",
                [[set -e
d=$(mktemp -d)
f="$d/x.txt"
printf 'a\n' > "$f"
vim -es -u NONE -i NONE -n -c 'call setline(1, "rootbeer")' -c wq "$f"
grep -qx rootbeer "$f"
rm -rf "$d"
printf '%s\n' ok]],
            },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "9.2.1383",
        },
        ["aarch64-macos"] = {
            default_version = "9.2.1383",
        },
        ["x86_64-linux"] = {
            default_version = "9.2.1383",
        },
    },
    versions = {
        ["9.2.1300"] = {
            digests = {
                ["aarch64-linux"] = "8494427f66fae88d4b7c6dec845e40eeadfb11de6adad9bbe14085e38059427e",
                ["aarch64-macos"] = "8494427f66fae88d4b7c6dec845e40eeadfb11de6adad9bbe14085e38059427e",
                ["x86_64-linux"] = "8494427f66fae88d4b7c6dec845e40eeadfb11de6adad9bbe14085e38059427e",
            },
        },
        ["9.2.1383"] = {
            digests = {
                ["aarch64-linux"] = "a7ade7beee8ef658020b48164f1d963ad84efb26fae114c7312040ede1d7208f",
                ["aarch64-macos"] = "a7ade7beee8ef658020b48164f1d963ad84efb26fae114c7312040ede1d7208f",
                ["x86_64-linux"] = "a7ade7beee8ef658020b48164f1d963ad84efb26fae114c7312040ede1d7208f",
            },
        },
    },
}
