return {
    name = "age",
    description = "File encryption with explicit recipients",
    homepage = "https://age-encryption.org/",
    default_license = "BSD-3-Clause",
    source = {
        url = "https://codeload.github.com/FiloSottile/age/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "age-{version}",
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
    platforms = {
        ["aarch64-linux"] = {
            default_version = "1.3.2",
            upstream = { github = "FiloSottile/age", repository_id = 187403699, tag_prefix = "v" },
        },
        ["aarch64-macos"] = {
            default_version = "1.3.2",
            upstream = { github = "FiloSottile/age", repository_id = 187403699, tag_prefix = "v" },
        },
        ["x86_64-linux"] = {
            default_version = "1.3.2",
            upstream = { github = "FiloSottile/age", repository_id = 187403699, tag_prefix = "v" },
        },
    },
    versions = {
        ["1.3.1"] = {
            digests = {
                ["aarch64-linux"] = "396007bc0bc53de253391493bda1252757ba63af1a19db86cfb60a35cb9d290a",
                ["aarch64-macos"] = "396007bc0bc53de253391493bda1252757ba63af1a19db86cfb60a35cb9d290a",
                ["x86_64-linux"] = "396007bc0bc53de253391493bda1252757ba63af1a19db86cfb60a35cb9d290a",
            },
            revision = 4,
        },
        ["1.3.2"] = {
            digests = {
                ["aarch64-linux"] = "b07c28c6c4bdafa272073a310b75bc22c49da8904585a89c30e5ca4233e63843",
                ["aarch64-macos"] = "b07c28c6c4bdafa272073a310b75bc22c49da8904585a89c30e5ca4233e63843",
                ["x86_64-linux"] = "b07c28c6c4bdafa272073a310b75bc22c49da8904585a89c30e5ca4233e63843",
            },
            revision = 3,
        },
    },
}
