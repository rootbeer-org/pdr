return {
    name = "libffi",
    description = "Portable foreign function interface library",
    homepage = "https://sourceware.org/libffi/",
    recipe_maintainers = { "tale" },
    default_license = "MIT",
    upstream = {
        github = "libffi/libffi",
        repository_id = 321154,
        tag = "v{version}",
    },
    source = {
        url = "https://github.com/libffi/libffi/releases/download/v{version}/libffi-{version}.tar.gz",
        archive = "tar.gz",
        strip_prefix = "libffi-{version}",
    },
    build = {
        backend = "autotools",
        configure = {
            "--enable-static",
            "--enable-shared",
            "--disable-docs",
            "--disable-multi-os-directory",
        },
        libraries = { "lib/libffi.a", "lib/libffi.{shared_extension}" },
    },
    outputs = {},
    platforms = {
        ["aarch64-linux"] = {
            default_version = "3.8.0",
        },
        ["aarch64-macos"] = {
            default_version = "3.8.0",
        },
        ["x86_64-linux"] = {
            default_version = "3.8.0",
        },
    },
    versions = {
        ["3.8.0"] = {
            digests = {
                ["aarch64-linux"] = "7da3e2d9a171eb0a038f592ecad3ff2bb2550f3496d87b3b29ad0cf4430c0db4",
                ["aarch64-macos"] = "7da3e2d9a171eb0a038f592ecad3ff2bb2550f3496d87b3b29ad0cf4430c0db4",
                ["x86_64-linux"] = "7da3e2d9a171eb0a038f592ecad3ff2bb2550f3496d87b3b29ad0cf4430c0db4",
            },
        },
    },
}
