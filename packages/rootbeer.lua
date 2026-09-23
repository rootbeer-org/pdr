return {
    name = "rootbeer",
    description = "Declarative system configuration and package tooling in Lua",
    homepage = "https://rootbeer.tale.me",
    default_license = "NOASSERTION",
    source = {
        url = "https://codeload.github.com/tale/rootbeer/tar.gz/267d73893532e5eaed607cef600382b5632aad3a",
        git = {
            github = "tale/rootbeer",
            branch = "main",
        },
        archive = "tar.gz",
        strip_prefix = "rootbeer-267d73893532e5eaed607cef600382b5632aad3a",
    },
    build = {
        backend = "rust",
        rust = {
            packages = { "rootbeer-cli", "rootbeer-forge" },
            environment = {
                RB_BUILD_TIMESTAMP = "2026-09-23 18:39 UTC",
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
            default_version = "0.1.0-main+267d73893532",
        },
        ["aarch64-macos"] = {
            default_version = "0.1.0-main+267d73893532",
        },
        ["x86_64-linux"] = {
            default_version = "0.1.0-main+267d73893532",
        },
    },
    versions = {
        ["0.1.0-main+267d73893532"] = {
            digests = {
                ["aarch64-linux"] = "a2815e92a51de046e0c38c9c134614713a7f409c9595e872d480bcaac0b90165",
                ["aarch64-macos"] = "a2815e92a51de046e0c38c9c134614713a7f409c9595e872d480bcaac0b90165",
                ["x86_64-linux"] = "a2815e92a51de046e0c38c9c134614713a7f409c9595e872d480bcaac0b90165",
            },
        },
    },
}
