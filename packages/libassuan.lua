return {
    name = "libassuan",
    description = "IPC library used by GnuPG and related projects",
    homepage = "https://gnupg.org/software/libassuan/",
    recipe_maintainers = { "tale" },
    default_license = "LGPL-2.1-or-later",
    upstream = {
        listing = "https://www.gnupg.org/ftp/gcrypt/libassuan/",
        tag = "libassuan-{version}.tar.bz2",
    },
    source = {
        url = "https://www.gnupg.org/ftp/gcrypt/libassuan/{tag}",
        archive = "tar.bz2",
        strip_prefix = "libassuan-{version}",
    },
    build = {
        backend = "custom",
        -- The tests pass file descriptors over a unix socket in the build directory.
        allow = { "local-network" },
        dependencies = {
            {
                package = "rb-unpack",
                kind = "build",
            },
            {
                package = "libgpg-error",
                kind = "link_runtime",
            },
        },
        libraries = { "lib/libassuan.{shared_extension}" },
        steps = {
            configure = {
                {
                    "/bin/sh",
                    "./configure",
                    "--prefix={prefix}",
                    "--disable-doc",
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
    outputs = {},
    platforms = {
        ["aarch64-linux"] = {
            default_version = "3.0.2",
        },
        ["aarch64-macos"] = {
            default_version = "3.0.2",
        },
        ["x86_64-linux"] = {
            default_version = "3.0.2",
        },
    },
    versions = {
        ["3.0.2"] = {
            digests = {
                ["aarch64-linux"] = "d2931cdad266e633510f9970e1a2f346055e351bb19f9b78912475b8074c36f6",
                ["aarch64-macos"] = "d2931cdad266e633510f9970e1a2f346055e351bb19f9b78912475b8074c36f6",
                ["x86_64-linux"] = "d2931cdad266e633510f9970e1a2f346055e351bb19f9b78912475b8074c36f6",
            },
        },
    },
}
