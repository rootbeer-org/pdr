return {
    name = "rootbeer",
    description = "Declarative system configuration and package tooling in Lua",
    homepage = "https://rootbeer.tale.me",
    default_license = "NOASSERTION",
    source = {
        url = "https://codeload.github.com/tale/rootbeer/tar.gz/0d9c017b92b19415e28bb2785e86f21e0d30c44e",
        git = {
            github = "tale/rootbeer",
            branch = "main",
        },
        archive = "tar.gz",
        strip_prefix = "rootbeer-0d9c017b92b19415e28bb2785e86f21e0d30c44e",
    },
    build = {
        backend = "rust",
        rust = {
            packages = { "rootbeer-cli", "rootbeer-forge" },
            environment = {
                RB_BUILD_TIMESTAMP = "2026-09-23 17:32 UTC",
                ROOTBEER_PDR_PUBLIC_KEY = "028c5b185fb63ea61128a0bf6fb0decc8b700020561db08d82a998c7d0493bc0",
                ROOTBEER_PDR_URL = "https://pdr.rbpkg.com/v3/current.json",
            },
        },
    },
    outputs = {
        bins = { "rb", "rootbeer-forge" },
        checks = {
            { "rb", "--version" },
            { "rb", "--help" },
            { "rootbeer-forge", "--help" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "0.1.0-main+0d9c017b92b1",
        },
        ["aarch64-macos"] = {
            default_version = "0.1.0-main+0d9c017b92b1",
        },
        ["x86_64-linux"] = {
            default_version = "0.1.0-main+0d9c017b92b1",
        },
    },
    versions = {
        ["0.1.0-main+0d9c017b92b1"] = {
            digests = {
                ["aarch64-linux"] = "cee64fc1a39060383c229cdf501c9eaf93c57ad45a71ec6475ca1bc96e8e720a",
                ["aarch64-macos"] = "cee64fc1a39060383c229cdf501c9eaf93c57ad45a71ec6475ca1bc96e8e720a",
                ["x86_64-linux"] = "cee64fc1a39060383c229cdf501c9eaf93c57ad45a71ec6475ca1bc96e8e720a",
            },
        },
    },
}
