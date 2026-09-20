return {
    schema = 2,
    name = "mkcert",
    description = "Create locally trusted development certificates",
    default_version = "1.4.4",
    homepage = "https://github.com/FiloSottile/mkcert",
    systems = { "aarch64-macos", "aarch64-linux", "x86_64-linux" },
    upstream = {
        github = "FiloSottile/mkcert",
        repository_id = 138547797,
        tag_prefix = "v",
    },
    inputs = {
        source = {
            url = "https://codeload.github.com/FiloSottile/mkcert/tar.gz/refs/tags/{tag}",
            archive = "tar.gz",
            strip_prefix = "mkcert-{version}",
        },
    },
    build = {
        backend = "go",
        go = {
            binaries = { mkcert = "." },
            variables = { ["main.Version"] = "v{version}" },
        },
    },
    outputs = {
        bins = { "mkcert" },
        checks = { { "mkcert", "--version" } },
    },
    versions = {
        ["1.4.4"] = {
            revision = 3,
            inputs = {
                source = {
                    sha256 = "32bd5519581bf0b03f53e5b22721692b99f39ab5b161dc27532c51eafa512ca9",
                },
            },
        },
    },
}
