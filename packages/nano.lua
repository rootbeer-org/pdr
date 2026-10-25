return {
    name = "nano",
    description = "Small and friendly text editor",
    homepage = "https://www.nano-editor.org",
    recipe_maintainers = { "tale" },
    default_license = "GPL-3.0-or-later",
    upstream = {
        git = "https://https.git.savannah.gnu.org/git/nano.git",
        tag = "v{version}",
    },
    source = {
        url = "https://www.nano-editor.org/dist/v{major}/nano-{version}.tar.xz",
        archive = "tar.xz",
        strip_prefix = "nano-{version}",
    },
    build = {
        backend = "custom",
        dependencies = {
            {
                package = "pkgconf",
                kind = "build",
            },
            {
                package = "ncurses",
                kind = "link",
            },
        },
        steps = {
            configure = {
                {
                    "sh",
                    "./configure",
                    "--prefix={prefix}",
                    "--sysconfdir=/etc",
                    "--enable-utf8",
                    "--disable-nls",
                    -- Pinned off so a host libmagic never links in; file types still come from
                    -- syntax file names and headers.
                    "--disable-libmagic",
                },
            },
            build = {
                { "make", "-j{jobs}" },
            },
            check = {
                { "make", "check" },
                { "src/nano", "--version" },
            },
            install = {
                { "make", "install" },
            },
        },
    },
    -- nano edits only inside a terminal, so checks stop at its command line.
    outputs = {
        bins = { "nano", "rnano" },
        checks = {
            { "nano", "--version" },
            { "nano", "--help" },
            { "rnano", "--version" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "9.3",
        },
        ["aarch64-macos"] = {
            default_version = "9.3",
        },
        ["x86_64-linux"] = {
            default_version = "9.3",
        },
    },
    versions = {
        ["9.2"] = {
            digests = {
                ["aarch64-linux"] = "05ecb99247b782e8a5b3a25ed4101dd034b0236902f7449bc9795b717642f7e9",
                ["aarch64-macos"] = "05ecb99247b782e8a5b3a25ed4101dd034b0236902f7449bc9795b717642f7e9",
                ["x86_64-linux"] = "05ecb99247b782e8a5b3a25ed4101dd034b0236902f7449bc9795b717642f7e9",
            },
        },
        ["9.3"] = {
            digests = {
                ["aarch64-linux"] = "a9affc52c9596ee0682bcdd4ceb3c0b235eb221d83d733dfd9b0dff45897cb0d",
                ["aarch64-macos"] = "a9affc52c9596ee0682bcdd4ceb3c0b235eb221d83d733dfd9b0dff45897cb0d",
                ["x86_64-linux"] = "a9affc52c9596ee0682bcdd4ceb3c0b235eb221d83d733dfd9b0dff45897cb0d",
            },
        },
    },
}
