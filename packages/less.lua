return {
    name = "less",
    description = "Page through text one screen at a time",
    homepage = "https://www.greenwoodsoftware.com/less/",
    recipe_maintainers = { "tale" },
    default_license = "GPL-3.0-or-later OR BSD-2-Clause",
    upstream = {
        github = "gwsw/less",
        tag = "v{version}-rel",
    },
    source = {
        url = "https://www.greenwoodsoftware.com/less/less-{version}.tar.gz",
        archive = "tar.gz",
        strip_prefix = "less-{version}",
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
                    "--with-regex=posix",
                    "--with-editor=vi",
                    -- less runs lessecho and less-osc8-open from a compiled-in libexec path that
                    -- doesn't exist in the store; installing them as commands and dropping the
                    -- path makes less find them on PATH.
                    "--libexecdir=/bin",
                    "CPPFLAGS=-ULIBEXECDIR",
                },
            },
            build = {
                { "make", "-j{jobs}" },
            },
            -- Upstream's lesstest suite drives less through a terminal emulator and needs a TTY,
            -- so the check pages a file through the built binaries instead.
            check = {
                {
                    "sh",
                    "-ec",
                    "./less -V; ./less README | cmp - README; ./lessecho 'a b' | grep -qx 'a b'",
                },
            },
            install = {
                { "make", "DESTDIR={prefix}", "install" },
            },
        },
    },
    outputs = {
        bins = { "less", "lessecho", "less-osc8-open" },
        checks = {
            { "less", "-V" },
            { "lessecho", "hello", "world" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "710",
        },
        ["aarch64-macos"] = {
            default_version = "710",
        },
        ["x86_64-linux"] = {
            default_version = "710",
        },
    },
    versions = {
        ["710"] = {
            digests = {
                ["aarch64-linux"] = "d1008fb78dcae1323ddab664bcb352a61f022b1b131bd8018548e021d975ec7a",
                ["aarch64-macos"] = "d1008fb78dcae1323ddab664bcb352a61f022b1b131bd8018548e021d975ec7a",
                ["x86_64-linux"] = "d1008fb78dcae1323ddab664bcb352a61f022b1b131bd8018548e021d975ec7a",
            },
        },
    },
}
