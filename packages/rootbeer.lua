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
            default_version = "0.1.0-main+51990cf50e5f",
        },
        ["aarch64-macos"] = {
            default_version = "0.1.0-main+51990cf50e5f",
        },
        ["x86_64-linux"] = {
            default_version = "0.1.0-main+51990cf50e5f",
        },
    },
    versions = {
        ["0.1.0-main+24bde1ac8631"] = {
            digests = {
                ["aarch64-linux"] = "8c56a73d3b3447d9eeea51a2a07464cb14259140ca7b06a69304a42cc1b821ce",
                ["aarch64-macos"] = "8c56a73d3b3447d9eeea51a2a07464cb14259140ca7b06a69304a42cc1b821ce",
                ["x86_64-linux"] = "8c56a73d3b3447d9eeea51a2a07464cb14259140ca7b06a69304a42cc1b821ce",
            },
            source = {
                url = "https://codeload.github.com/tale/rootbeer/tar.gz/24bde1ac86316f969750bbceffd9553e8f4f8f6f",
                git = {
                    github = "tale/rootbeer",
                    branch = "main",
                },
                archive = "tar.gz",
                strip_prefix = "rootbeer-24bde1ac86316f969750bbceffd9553e8f4f8f6f",
            },
            build = {
                backend = "rust",
                rust = {
                    packages = { "rootbeer-cli", "rootbeer-forge" },
                    environment = {
                        RB_BUILD_TIMESTAMP = "2026-09-24 22:01 UTC",
                        ROOTBEER_PDR_PUBLIC_KEY = "028c5b185fb63ea61128a0bf6fb0decc8b700020561db08d82a998c7d0493bc0",
                        ROOTBEER_PDR_URL = "https://pdr.rbpkg.com/v3/current.json",
                    },
                },
            },
        },
        ["0.1.0-main+267d73893532"] = {
            digests = {
                ["aarch64-linux"] = "a2815e92a51de046e0c38c9c134614713a7f409c9595e872d480bcaac0b90165",
                ["aarch64-macos"] = "a2815e92a51de046e0c38c9c134614713a7f409c9595e872d480bcaac0b90165",
                ["x86_64-linux"] = "a2815e92a51de046e0c38c9c134614713a7f409c9595e872d480bcaac0b90165",
            },
        },
        ["0.1.0-main+51990cf50e5f"] = {
            digests = {
                ["aarch64-linux"] = "e451f1b21eecb54dfb5f5d4abb5e997a6e6aca1ab7f6c2a68d6ae5354c65de3c",
                ["aarch64-macos"] = "e451f1b21eecb54dfb5f5d4abb5e997a6e6aca1ab7f6c2a68d6ae5354c65de3c",
                ["x86_64-linux"] = "e451f1b21eecb54dfb5f5d4abb5e997a6e6aca1ab7f6c2a68d6ae5354c65de3c",
            },
            source = {
                url = "https://codeload.github.com/rootbeer-org/rootbeer/tar.gz/51990cf50e5f2d43391996177fc3dd974ea781db",
                git = {
                    github = "rootbeer-org/rootbeer",
                    branch = "main",
                },
                archive = "tar.gz",
                strip_prefix = "rootbeer-51990cf50e5f2d43391996177fc3dd974ea781db",
            },
            build = {
                backend = "rust",
                rust = {
                    packages = { "rootbeer-cli", "rootbeer-forge" },
                    environment = {
                        RB_BUILD_TIMESTAMP = "2026-09-25 18:24 UTC",
                        ROOTBEER_PDR_PUBLIC_KEY = "028c5b185fb63ea61128a0bf6fb0decc8b700020561db08d82a998c7d0493bc0",
                        ROOTBEER_PDR_URL = "https://pdr.rbpkg.com/v3/current.json",
                    },
                },
            },
        },
    },
}
