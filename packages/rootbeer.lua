return {
    schema = 2,
    name = "rootbeer",
    description = "Declarative system configuration and package tooling in Lua",
    default_version = "0.1.0-main+5e2153485889",
    homepage = "https://rootbeer.tale.me",
    systems = { "aarch64-macos", "aarch64-linux", "x86_64-linux" },
    build = {
        backend = "rust",
        rust = {
            packages = { "rootbeer-cli", "rootbeer-forge" },
            environment = {
                ROOTBEER_INDEX_URL = "https://tale.github.io/rootbeer-index/current.json",
                ROOTBEER_INDEX_PUBLIC_KEY = "028c5b185fb63ea61128a0bf6fb0decc8b700020561db08d82a998c7d0493bc0",
                RB_BUILD_TIMESTAMP = "2026-09-17 01:36 UTC",
            },
        },
    },
    inputs = {
        source = {
            url = "https://codeload.github.com/tale/rootbeer/tar.gz/323434417bc302fa0fc180430d1ce74e595ba254",
            archive = "tar.gz",
            strip_prefix = "rootbeer-323434417bc302fa0fc180430d1ce74e595ba254",
            git = { github = "tale/rootbeer", branch = "main" },
        },
    },
    outputs = {
        bins = { "rb", "rootbeer-forge" },
        checks = { { "rb", "--version" }, { "rb", "--help" }, { "rootbeer-forge", "--help" } },
    },
    versions = {
        ["0.1.0-main+5e2153485889"] = {
            revision = 2,
            inputs = { source = {
                url = "https://codeload.github.com/tale/rootbeer/tar.gz/5e21534858896917f6d703d4ff3c9cffbfefd989",
                archive = "tar.gz",
                strip_prefix = "rootbeer-5e21534858896917f6d703d4ff3c9cffbfefd989",
                sha256 = "5d5591c8b7eec23c5f976ad26bfc65e72af82a4a0251fa9b9e449c6bbf01670b",
            } },
            build = { ["backend"] = "rust", ["configure"] = {  }, ["dependencies"] = {  }, ["rust"] = { ["environment"] = { ["RB_BUILD_TIMESTAMP"] = "2026-09-20 10:29 UTC", ["ROOTBEER_INDEX_PUBLIC_KEY"] = "028c5b185fb63ea61128a0bf6fb0decc8b700020561db08d82a998c7d0493bc0", ["ROOTBEER_INDEX_URL"] = "https://pdr.rbpkg.com/current.json" }, ["features"] = {  }, ["no_default_features"] = false, ["packages"] = { "rootbeer-cli", "rootbeer-forge" } } },
        },
        ["0.1.0-main+7e6f55977be8"] = {
            inputs = { source = {
                url = "https://codeload.github.com/tale/rootbeer/tar.gz/7e6f55977be8609efd37db42f4cd1b0628e53307",
                archive = "tar.gz",
                strip_prefix = "rootbeer-7e6f55977be8609efd37db42f4cd1b0628e53307",
                sha256 = "a6539590f1958a021d897c014c1fbcf6887e3bd237694c99028f74b761fd7fcc",
            } },
            build = { ["backend"] = "rust", ["configure"] = {  }, ["dependencies"] = {  }, ["rust"] = { ["environment"] = { ["RB_BUILD_TIMESTAMP"] = "2026-09-20 05:15 UTC", ["ROOTBEER_INDEX_PUBLIC_KEY"] = "028c5b185fb63ea61128a0bf6fb0decc8b700020561db08d82a998c7d0493bc0", ["ROOTBEER_INDEX_URL"] = "https://tale.github.io/rootbeer-index/current.json" }, ["features"] = {  }, ["no_default_features"] = false, ["packages"] = { "rootbeer-cli", "rootbeer-forge" } } },
        },
        ["0.1.0-main+0e9c7425918c"] = {
            inputs = { source = {
                url = "https://codeload.github.com/tale/rootbeer/tar.gz/0e9c7425918cbb68c88a61d418c0275a3aec76d4",
                archive = "tar.gz",
                strip_prefix = "rootbeer-0e9c7425918cbb68c88a61d418c0275a3aec76d4",
                sha256 = "643581adec3bef09f3a98377e15c2e28f816e043649490dac136a990ffc6b2d2",
            } },
            build = { ["backend"] = "rust", ["configure"] = {  }, ["dependencies"] = {  }, ["rust"] = { ["environment"] = { ["RB_BUILD_TIMESTAMP"] = "2026-09-19 19:11 UTC", ["ROOTBEER_INDEX_PUBLIC_KEY"] = "028c5b185fb63ea61128a0bf6fb0decc8b700020561db08d82a998c7d0493bc0", ["ROOTBEER_INDEX_URL"] = "https://tale.github.io/rootbeer-index/current.json" }, ["features"] = {  }, ["no_default_features"] = false, ["packages"] = { "rootbeer-cli", "rootbeer-forge" } } },
        },
        ["0.1.0-main+acdc3c816323"] = {
            inputs = { source = {
                url = "https://codeload.github.com/tale/rootbeer/tar.gz/acdc3c816323b541609abbf52b338c76e0e47260",
                archive = "tar.gz",
                strip_prefix = "rootbeer-acdc3c816323b541609abbf52b338c76e0e47260",
                sha256 = "b87b432597f8065d08403234eca56224b527267eb2dbc59d50bcac44bcc611f1",
            } },
            build = { ["backend"] = "rust", ["configure"] = {  }, ["dependencies"] = {  }, ["rust"] = { ["environment"] = { ["RB_BUILD_TIMESTAMP"] = "2026-09-18 23:09 UTC", ["ROOTBEER_INDEX_PUBLIC_KEY"] = "028c5b185fb63ea61128a0bf6fb0decc8b700020561db08d82a998c7d0493bc0", ["ROOTBEER_INDEX_URL"] = "https://tale.github.io/rootbeer-index/current.json" }, ["features"] = {  }, ["no_default_features"] = false, ["packages"] = { "rootbeer-cli", "rootbeer-forge" } } },
        },
        ["0.1.0-main+64c18d5414f4"] = {
            inputs = { source = {
                url = "https://codeload.github.com/tale/rootbeer/tar.gz/64c18d5414f4268ae254c9db008664b62efab093",
                archive = "tar.gz",
                strip_prefix = "rootbeer-64c18d5414f4268ae254c9db008664b62efab093",
                sha256 = "ecd4684166f31a9c95f7e3632bfff033f48e289ca9cb0476d2e8b136adeb1b99",
            } },
            build = { ["backend"] = "rust", ["configure"] = {  }, ["dependencies"] = {  }, ["rust"] = { ["environment"] = { ["RB_BUILD_TIMESTAMP"] = "2026-09-18 17:32 UTC", ["ROOTBEER_INDEX_PUBLIC_KEY"] = "028c5b185fb63ea61128a0bf6fb0decc8b700020561db08d82a998c7d0493bc0", ["ROOTBEER_INDEX_URL"] = "https://tale.github.io/rootbeer-index/current.json" }, ["features"] = {  }, ["no_default_features"] = false, ["packages"] = { "rootbeer-cli", "rootbeer-forge" } } },
        },
        ["0.1.0-main+323434417bc3"] = {
            inputs = {
                source = {
                    sha256 = "414ed0e96cce96fe468db879710434e5a511dd228aa8bf031dc7bfe1cd059823",
                },
            },
        },
    },
}
