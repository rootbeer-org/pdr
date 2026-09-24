return {
    name = "rootbeer",
    aliases = { "rb" },
    description = "Declarative system configuration and package tooling in Lua",
    homepage = "https://rbpkg.com",
    recipe_maintainers = { "tale" },
    default_license = "MIT",
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
            default_version = "0.1.0-main+3922db0645de",
        },
        ["aarch64-macos"] = {
            default_version = "0.1.0-main+3922db0645de",
        },
        ["x86_64-linux"] = {
            default_version = "0.1.0-main+3922db0645de",
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
        ["0.1.0-main+3922db0645de"] = {
            digests = {
                ["aarch64-linux"] = "bcd6f76f94581f4d5daf9bbe0ccc8c039d5f748fe37a4ff08f360f0b36afa65b",
                ["aarch64-macos"] = "bcd6f76f94581f4d5daf9bbe0ccc8c039d5f748fe37a4ff08f360f0b36afa65b",
                ["x86_64-linux"] = "bcd6f76f94581f4d5daf9bbe0ccc8c039d5f748fe37a4ff08f360f0b36afa65b",
            },
            source = {
                url = "https://codeload.github.com/tale/rootbeer/tar.gz/3922db0645de5f8623f4fb348266d0f5293a00e1",
                git = {
                    github = "tale/rootbeer",
                    branch = "main",
                },
                archive = "tar.gz",
                strip_prefix = "rootbeer-3922db0645de5f8623f4fb348266d0f5293a00e1",
            },
            build = {
                backend = "rust",
                rust = {
                    packages = { "rootbeer-cli", "rootbeer-forge" },
                    environment = {
                        RB_BUILD_TIMESTAMP = "2026-09-24 20:10 UTC",
                        ROOTBEER_PDR_PUBLIC_KEY = "028c5b185fb63ea61128a0bf6fb0decc8b700020561db08d82a998c7d0493bc0",
                        ROOTBEER_PDR_URL = "https://pdr.rbpkg.com/v3/current.json",
                    },
                },
            },
        },
    },
}
