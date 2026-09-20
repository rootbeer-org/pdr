return {
    schema = 2,
    name = "age",
    description = "File encryption with explicit recipients",
    default_version = "1.3.2",
    homepage = "https://age-encryption.org/",
    systems = { "aarch64-macos", "aarch64-linux", "x86_64-linux" },
    upstream = {
        github = "FiloSottile/age",
        repository_id = 187403699,
        tag_prefix = "v",
    },
    inputs = {
        source = {
            url = "https://codeload.github.com/FiloSottile/age/tar.gz/refs/tags/{tag}",
            archive = "tar.gz",
            strip_prefix = "age-{version}",
        },
    },
    build = {
        backend = "go",
        go = {
            binaries = { age = "./cmd/age", ["age-keygen"] = "./cmd/age-keygen" },
            variables = { ["main.Version"] = "v{version}" },
        },
    },
    outputs = {
        bins = { "age", "age-keygen" },
        checks = { { "age", "--version" }, { "age-keygen", "--version" } },
    },
    versions = {
        ["1.3.1"] = {
            revision = 4,
            inputs = {
                source = {
                    sha256 = "396007bc0bc53de253391493bda1252757ba63af1a19db86cfb60a35cb9d290a",
                },
            },
            systems = { "aarch64-macos", "aarch64-linux", "x86_64-linux" },
        },
        ["1.3.2"] = {
            revision = 3,
            inputs = {
                source = {
                    sha256 = "b07c28c6c4bdafa272073a310b75bc22c49da8904585a89c30e5ca4233e63843",
                },
            },
        },
    },
}
