return {
    name = "libxcrypt",
    description = "Extended crypt library for password hashing",
    homepage = "https://github.com/besser82/libxcrypt",
    recipe_maintainers = { "tale" },
    default_license = "LGPL-2.1-or-later",
    upstream = {
        github = "besser82/libxcrypt",
        repository_id = 35503965,
        tag = "v{version}",
    },
    source = {
        url = "https://github.com/besser82/libxcrypt/releases/download/v{version}/libxcrypt-{version}.tar.xz",
        archive = "tar.xz",
        strip_prefix = "libxcrypt-{version}",
    },
    build = {
        backend = "autotools",
        configure = {
            "--disable-shared",
            "--enable-static",
            "--enable-hashes=all",
            "--enable-obsolete-api=no",
            "--disable-failure-tokens",
            "--disable-werror",
        },
        dependencies = {
            {
                package = "perl@5.44.0",
                kind = "build",
            },
        },
        libraries = { "lib/libcrypt.a" },
    },
    outputs = {},
    platforms = {
        ["aarch64-linux"] = {
            default_version = "4.5.2",
        },
        ["x86_64-linux"] = {
            default_version = "4.5.2",
        },
    },
    versions = {
        ["4.5.2"] = {
            digests = {
                ["aarch64-linux"] = "71513a31c01a428bccd5367a32fd95f115d6dac50fb5b60c779d5c7942aec071",
                ["x86_64-linux"] = "71513a31c01a428bccd5367a32fd95f115d6dac50fb5b60c779d5c7942aec071",
            },
        },
    },
}
