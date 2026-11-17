return {
    name = "npth",
    description = "New portable threads library",
    homepage = "https://gnupg.org/software/npth/",
    recipe_maintainers = { "tale" },
    default_license = "LGPL-2.1-or-later",
    upstream = {
        listing = "https://www.gnupg.org/ftp/gcrypt/npth/",
        tag = "npth-{version}.tar.bz2",
    },
    source = {
        url = "https://www.gnupg.org/ftp/gcrypt/npth/{tag}",
        archive = "tar.bz2",
        strip_prefix = "npth-{version}",
    },
    build = {
        backend = "custom",
        dependencies = {
            {
                package = "7zip",
                kind = "build",
            },
        },
        libraries = { "lib/libnpth.{shared_extension}" },
        steps = {
            configure = {
                { "/bin/sh", "./configure", "--prefix={prefix}" },
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
            default_version = "1.8",
        },
        ["aarch64-macos"] = {
            default_version = "1.8",
        },
        ["x86_64-linux"] = {
            default_version = "1.8",
        },
    },
    versions = {
        ["1.8"] = {
            digests = {
                ["aarch64-linux"] = "8bd24b4f23a3065d6e5b26e98aba9ce783ea4fd781069c1b35d149694e90ca3e",
                ["aarch64-macos"] = "8bd24b4f23a3065d6e5b26e98aba9ce783ea4fd781069c1b35d149694e90ca3e",
                ["x86_64-linux"] = "8bd24b4f23a3065d6e5b26e98aba9ce783ea4fd781069c1b35d149694e90ca3e",
            },
        },
    },
}
