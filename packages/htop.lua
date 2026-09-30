return {
    name = "htop",
    description = "Interactive process viewer",
    homepage = "https://htop.dev",
    recipe_maintainers = { "tale" },
    default_license = "GPL-2.0-or-later",
    upstream = {
        github = "htop-dev/htop",
        repository_id = 288082909,
    },
    source = {
        url = "https://github.com/htop-dev/htop/releases/download/{tag}/htop-{version}.tar.xz",
        archive = "tar.xz",
        strip_prefix = "htop-{version}",
    },
    build = {
        backend = "custom",
        dependencies = {
            {
                package = "pkgconf@3.0.7",
                kind = "build",
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
                    "--enable-unicode",
                    "--with-curses=ncursesw",
                    -- Linux extras need libcap, libnl, libsensors, or hwloc, none of which the
                    -- catalog provides yet; pinned off so host headers never enable them.
                    "--disable-capabilities",
                    "--disable-delayacct",
                    "--disable-sensors",
                    "--disable-hwloc",
                    "--enable-demangling=no",
                },
            },
            build = {
                { "make", "-j{jobs}" },
            },
            check = {
                { "make", "check" },
                { "./htop", "--version" },
            },
            install = {
                { "make", "DESTDIR={prefix}", "install" },
            },
        },
    },
    -- htop only samples processes inside a terminal, so checks stop at its command line.
    outputs = {
        bins = { "htop" },
        checks = {
            { "htop", "--version" },
            { "htop", "--help" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "3.5.3",
        },
        ["aarch64-macos"] = {
            default_version = "3.5.3",
        },
        ["x86_64-linux"] = {
            default_version = "3.5.3",
        },
    },
    versions = {
        ["3.5.3"] = {
            digests = {
                ["aarch64-linux"] = "a8b164386494cb85bb255a415a3f5f80afe7a0c4491da5d113b3a0f951087e65",
                ["aarch64-macos"] = "a8b164386494cb85bb255a415a3f5f80afe7a0c4491da5d113b3a0f951087e65",
                ["x86_64-linux"] = "a8b164386494cb85bb255a415a3f5f80afe7a0c4491da5d113b3a0f951087e65",
            },
        },
    },
}
