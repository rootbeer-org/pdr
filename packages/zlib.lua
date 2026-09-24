return {
    name = "zlib",
    description = "Deflate compression library",
    homepage = "https://zlib.net/",
    recipe_maintainers = { "tale" },
    default_license = "Zlib",
    upstream = {
        github = "madler/zlib",
        repository_id = 2359378,
        tag = "v{version}",
    },
    source = {
        url = "https://github.com/madler/zlib/releases/download/{tag}/zlib-{version}.tar.gz",
        git = {
            github = "madler/zlib",
        },
        archive = "tar.gz",
        strip_prefix = "zlib-{version}",
    },
    build = {
        backend = "custom",
        libraries = { "lib/libz.a" },
        steps = {
            configure = {
                { "/bin/sh", "./configure", "--prefix=/", "--static" },
            },
            build = {
                { "make", "-j{jobs}" },
            },
            check = {
                { "make", "test" },
            },
            install = {
                { "make", "DESTDIR={prefix}", "install" },
            },
        },
    },
    outputs = {},
    platforms = {
        ["aarch64-linux"] = {
            default_version = "1.3.2",
        },
        ["aarch64-macos"] = {
            default_version = "1.3.2",
        },
        ["x86_64-linux"] = {
            default_version = "1.3.2",
        },
    },
    versions = {
        ["1.3.2"] = {
            digests = {
                ["aarch64-linux"] = "bb329a0a2cd0274d05519d61c667c062e06990d72e125ee2dfa8de64f0119d16",
                ["aarch64-macos"] = "bb329a0a2cd0274d05519d61c667c062e06990d72e125ee2dfa8de64f0119d16",
                ["x86_64-linux"] = "bb329a0a2cd0274d05519d61c667c062e06990d72e125ee2dfa8de64f0119d16",
            },
            revision = 2,
        },
    },
}
