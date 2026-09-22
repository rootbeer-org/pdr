return {
    name = "mkcert",
    description = "Create locally trusted development certificates",
    homepage = "https://github.com/FiloSottile/mkcert",
    default_license = "BSD-3-Clause",
    source = {
        url = "https://codeload.github.com/FiloSottile/mkcert/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "mkcert-{version}",
    },
    build = {
        backend = "go",
        go = { binaries = { mkcert = "." }, variables = { ["main.Version"] = "v{version}" } },
    },
    outputs = { bins = { "mkcert" }, checks = { { "mkcert", "--version" } } },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "1.4.4",
            upstream = {
                github = "FiloSottile/mkcert",
                repository_id = 138547797,
                tag_prefix = "v",
            },
        },
        ["aarch64-macos"] = {
            default_version = "1.4.4",
            upstream = {
                github = "FiloSottile/mkcert",
                repository_id = 138547797,
                tag_prefix = "v",
            },
        },
        ["x86_64-linux"] = {
            default_version = "1.4.4",
            upstream = {
                github = "FiloSottile/mkcert",
                repository_id = 138547797,
                tag_prefix = "v",
            },
        },
    },
    versions = {
        ["1.4.4"] = {
            digests = {
                ["aarch64-linux"] = "32bd5519581bf0b03f53e5b22721692b99f39ab5b161dc27532c51eafa512ca9",
                ["aarch64-macos"] = "32bd5519581bf0b03f53e5b22721692b99f39ab5b161dc27532c51eafa512ca9",
                ["x86_64-linux"] = "32bd5519581bf0b03f53e5b22721692b99f39ab5b161dc27532c51eafa512ca9",
            },
            revision = 3,
        },
    },
}
