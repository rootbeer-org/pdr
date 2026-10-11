return {
    name = "rootbeer",
    aliases = { "rb" },
    description = "Declarative system configuration and package tooling in Lua",
    homepage = "https://rbpkg.com",
    recipe_maintainers = { "tale" },
    default_license = "MIT",
    source = {
        url = "https://codeload.github.com/rootbeer-org/rootbeer/tar.gz/{commit}",
        git = {
            github = "rootbeer-org/rootbeer",
            branch = "main",
        },
        archive = "tar.gz",
        strip_prefix = "rootbeer-{commit}",
    },
    build = {
        backend = "rust",
        rust = {
            packages = { "rootbeer-cli", "rootbeer-forge", "rootbeer-store" },
            environment = {
                RB_SOURCE_REVISION = "{commit}",
                ROOTBEER_PDR_PUBLIC_KEY = "028c5b185fb63ea61128a0bf6fb0decc8b700020561db08d82a998c7d0493bc0",
                ROOTBEER_PDR_URL = "https://pdr.rbpkg.com/v3/current.json",
            },
        },
    },
    outputs = {
        bins = { "rb", "rb-store", "rootbeer-forge" },
        checks = {
            { "rb", "--version" },
            { "rb", "--help" },
            { "rb-store", "version" },
            { "rootbeer-forge", "--help" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "0.1.0-main+e4cfb04e2e29",
        },
        ["aarch64-macos"] = {
            default_version = "0.1.0-main+e4cfb04e2e29",
        },
        ["x86_64-linux"] = {
            default_version = "0.1.0-main+e4cfb04e2e29",
        },
    },
    versions = {
        ["0.1.0-main+0159c58de5d4"] = {
            digests = {
                ["aarch64-linux"] = "8f22b4f989c35957ddf556913eeba004d57b4b18c8bcf11b7e4cbd3402cd22ad",
                ["aarch64-macos"] = "8f22b4f989c35957ddf556913eeba004d57b4b18c8bcf11b7e4cbd3402cd22ad",
                ["x86_64-linux"] = "8f22b4f989c35957ddf556913eeba004d57b4b18c8bcf11b7e4cbd3402cd22ad",
            },
            commit = "0159c58de5d4dfac86ca0e219e4d8679f831d8f6",
        },
        ["0.1.0-main+10b2269fc2f6"] = {
            digests = {
                ["aarch64-linux"] = "6a4ed57cd8b993082d287c4ee12f1a9a49dc970f3081bfac7ebbae3505f251f4",
                ["aarch64-macos"] = "6a4ed57cd8b993082d287c4ee12f1a9a49dc970f3081bfac7ebbae3505f251f4",
                ["x86_64-linux"] = "6a4ed57cd8b993082d287c4ee12f1a9a49dc970f3081bfac7ebbae3505f251f4",
            },
            commit = "10b2269fc2f681caa83b03fcdb778c4a14424912",
        },
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
            outputs = {
                bins = { "rb", "rootbeer-forge" },
                checks = {
                    { "rb", "--version" },
                    { "rb", "--help" },
                    { "rootbeer-forge", "--help" },
                },
            },
        },
        ["0.1.0-main+267d73893532"] = {
            digests = {
                ["aarch64-linux"] = "a2815e92a51de046e0c38c9c134614713a7f409c9595e872d480bcaac0b90165",
                ["aarch64-macos"] = "a2815e92a51de046e0c38c9c134614713a7f409c9595e872d480bcaac0b90165",
                ["x86_64-linux"] = "a2815e92a51de046e0c38c9c134614713a7f409c9595e872d480bcaac0b90165",
            },
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
        },
        ["0.1.0-main+26e09b92f111"] = {
            digests = {
                ["aarch64-linux"] = "347f73c72b28e65b97ac03b652f582ab03d62c1e25f7880d91cfcd5b600f2732",
                ["aarch64-macos"] = "347f73c72b28e65b97ac03b652f582ab03d62c1e25f7880d91cfcd5b600f2732",
                ["x86_64-linux"] = "347f73c72b28e65b97ac03b652f582ab03d62c1e25f7880d91cfcd5b600f2732",
            },
            commit = "26e09b92f111a5026545256562127c03ad5ebe95",
        },
        ["0.1.0-main+2881782a8c2a"] = {
            digests = {
                ["aarch64-linux"] = "1546abdf17b50f1aff78ff3443812758c64e5336ea85861be5838fb9b5e82357",
                ["aarch64-macos"] = "1546abdf17b50f1aff78ff3443812758c64e5336ea85861be5838fb9b5e82357",
                ["x86_64-linux"] = "1546abdf17b50f1aff78ff3443812758c64e5336ea85861be5838fb9b5e82357",
            },
            commit = "2881782a8c2a26dca0e2fa9be469afc39228767e",
        },
        ["0.1.0-main+31ba3baa9c5e"] = {
            digests = {
                ["aarch64-linux"] = "2007aeeb3812483e2e33e1937f21bff7c575eee10704b8971ddfc7bc422a0b74",
                ["aarch64-macos"] = "2007aeeb3812483e2e33e1937f21bff7c575eee10704b8971ddfc7bc422a0b74",
                ["x86_64-linux"] = "2007aeeb3812483e2e33e1937f21bff7c575eee10704b8971ddfc7bc422a0b74",
            },
            source = {
                url = "https://codeload.github.com/rootbeer-org/rootbeer/tar.gz/31ba3baa9c5e77f0e8bfef11ff353526fc039720",
                git = {
                    github = "rootbeer-org/rootbeer",
                    branch = "main",
                },
                archive = "tar.gz",
                strip_prefix = "rootbeer-31ba3baa9c5e77f0e8bfef11ff353526fc039720",
            },
            build = {
                backend = "rust",
                rust = {
                    packages = { "rootbeer-cli", "rootbeer-forge", "rootbeer-store" },
                    environment = {
                        RB_SOURCE_REVISION = "31ba3baa9c5e77f0e8bfef11ff353526fc039720",
                        ROOTBEER_PDR_PUBLIC_KEY = "028c5b185fb63ea61128a0bf6fb0decc8b700020561db08d82a998c7d0493bc0",
                        ROOTBEER_PDR_URL = "https://pdr.rbpkg.com/v3/current.json",
                    },
                },
            },
        },
        ["0.1.0-main+351ac8046b92"] = {
            digests = {
                ["aarch64-linux"] = "ac7c3aa6afebeb6e17117862d76fe7e8f2ad5e2f96382addf5ec197dd5e65c04",
                ["aarch64-macos"] = "ac7c3aa6afebeb6e17117862d76fe7e8f2ad5e2f96382addf5ec197dd5e65c04",
                ["x86_64-linux"] = "ac7c3aa6afebeb6e17117862d76fe7e8f2ad5e2f96382addf5ec197dd5e65c04",
            },
            commit = "351ac8046b92be582ff92e1d6d6b89a266138201",
        },
        ["0.1.0-main+376dcf8d5cc0"] = {
            digests = {
                ["aarch64-linux"] = "27d3e35ff17be14dc29f243d7809af0ba20f066271ecfcdc571d0074f0030d33",
                ["aarch64-macos"] = "27d3e35ff17be14dc29f243d7809af0ba20f066271ecfcdc571d0074f0030d33",
                ["x86_64-linux"] = "27d3e35ff17be14dc29f243d7809af0ba20f066271ecfcdc571d0074f0030d33",
            },
            commit = "376dcf8d5cc07d031a1973dfdc152d2187b7897e",
        },
        ["0.1.0-main+486a952cf43a"] = {
            digests = {
                ["aarch64-linux"] = "0f723179a1ef46e0c03cfff7a46087f8dcd0bbbde3db2e4cadf60a1268daab07",
                ["aarch64-macos"] = "0f723179a1ef46e0c03cfff7a46087f8dcd0bbbde3db2e4cadf60a1268daab07",
                ["x86_64-linux"] = "0f723179a1ef46e0c03cfff7a46087f8dcd0bbbde3db2e4cadf60a1268daab07",
            },
            source = {
                url = "https://codeload.github.com/rootbeer-org/rootbeer/tar.gz/486a952cf43a3f8183b95f064bb4914c3a05ff5e",
                git = {
                    github = "rootbeer-org/rootbeer",
                    branch = "main",
                },
                archive = "tar.gz",
                strip_prefix = "rootbeer-486a952cf43a3f8183b95f064bb4914c3a05ff5e",
            },
            build = {
                backend = "rust",
                rust = {
                    packages = { "rootbeer-cli", "rootbeer-forge", "rootbeer-store" },
                    environment = {
                        RB_BUILD_TIMESTAMP = "2026-09-26 02:41 UTC",
                        ROOTBEER_PDR_PUBLIC_KEY = "028c5b185fb63ea61128a0bf6fb0decc8b700020561db08d82a998c7d0493bc0",
                        ROOTBEER_PDR_URL = "https://pdr.rbpkg.com/v3/current.json",
                    },
                },
            },
        },
        ["0.1.0-main+4f95f671df00"] = {
            digests = {
                ["aarch64-linux"] = "adc6bc120550008accc22603e9df1e3b05af3860f79ba9a133a9ed942d8c044d",
                ["aarch64-macos"] = "adc6bc120550008accc22603e9df1e3b05af3860f79ba9a133a9ed942d8c044d",
                ["x86_64-linux"] = "adc6bc120550008accc22603e9df1e3b05af3860f79ba9a133a9ed942d8c044d",
            },
            commit = "4f95f671df001af40a7861e1b2faa2541a5dc34c",
        },
        ["0.1.0-main+4fa02918d4e3"] = {
            digests = {
                ["aarch64-linux"] = "ff1630352088cdc0a4716b59d6ddc16aadd754f67c027ec7718322248af2e53f",
                ["aarch64-macos"] = "ff1630352088cdc0a4716b59d6ddc16aadd754f67c027ec7718322248af2e53f",
                ["x86_64-linux"] = "ff1630352088cdc0a4716b59d6ddc16aadd754f67c027ec7718322248af2e53f",
            },
            commit = "4fa02918d4e36694e625c60c582a2c588015b362",
        },
        ["0.1.0-main+54e26834aae0"] = {
            digests = {
                ["aarch64-linux"] = "e8185a7c4b0623ca2023b87344ffeea30c33c21c3efc4cf2e61c3d46814da23a",
                ["aarch64-macos"] = "e8185a7c4b0623ca2023b87344ffeea30c33c21c3efc4cf2e61c3d46814da23a",
                ["x86_64-linux"] = "e8185a7c4b0623ca2023b87344ffeea30c33c21c3efc4cf2e61c3d46814da23a",
            },
            source = {
                url = "https://codeload.github.com/rootbeer-org/rootbeer/tar.gz/54e26834aae0d8dd4d6d42c43b3178708e1a3732",
                git = {
                    github = "rootbeer-org/rootbeer",
                    branch = "main",
                },
                archive = "tar.gz",
                strip_prefix = "rootbeer-54e26834aae0d8dd4d6d42c43b3178708e1a3732",
            },
            build = {
                backend = "rust",
                rust = {
                    packages = { "rootbeer-cli", "rootbeer-forge", "rootbeer-store" },
                    environment = {
                        RB_SOURCE_REVISION = "54e26834aae0d8dd4d6d42c43b3178708e1a3732",
                        ROOTBEER_PDR_PUBLIC_KEY = "028c5b185fb63ea61128a0bf6fb0decc8b700020561db08d82a998c7d0493bc0",
                        ROOTBEER_PDR_URL = "https://pdr.rbpkg.com/v3/current.json",
                    },
                },
            },
        },
        ["0.1.0-main+56884cb5aad3"] = {
            digests = {
                ["aarch64-linux"] = "06a5e0857b55dc7516b7d4f379642f6050585ce69b17b30d40309288150aaa2f",
                ["aarch64-macos"] = "06a5e0857b55dc7516b7d4f379642f6050585ce69b17b30d40309288150aaa2f",
                ["x86_64-linux"] = "06a5e0857b55dc7516b7d4f379642f6050585ce69b17b30d40309288150aaa2f",
            },
            source = {
                url = "https://codeload.github.com/rootbeer-org/rootbeer/tar.gz/56884cb5aad35e80ec02b2050a18f35257b9d0bc",
                git = {
                    github = "rootbeer-org/rootbeer",
                    branch = "main",
                },
                archive = "tar.gz",
                strip_prefix = "rootbeer-56884cb5aad35e80ec02b2050a18f35257b9d0bc",
            },
            build = {
                backend = "rust",
                rust = {
                    packages = { "rootbeer-cli", "rootbeer-forge", "rootbeer-store" },
                    environment = {
                        RB_SOURCE_REVISION = "56884cb5aad35e80ec02b2050a18f35257b9d0bc",
                        ROOTBEER_PDR_PUBLIC_KEY = "028c5b185fb63ea61128a0bf6fb0decc8b700020561db08d82a998c7d0493bc0",
                        ROOTBEER_PDR_URL = "https://pdr.rbpkg.com/v3/current.json",
                    },
                },
            },
        },
        ["0.1.0-main+579e2416b9f9"] = {
            digests = {
                ["aarch64-linux"] = "de96878b4146c1e0e26505c67580d09f1a44c30853e4d3e51e1bfd45b02c1e2f",
                ["aarch64-macos"] = "de96878b4146c1e0e26505c67580d09f1a44c30853e4d3e51e1bfd45b02c1e2f",
                ["x86_64-linux"] = "de96878b4146c1e0e26505c67580d09f1a44c30853e4d3e51e1bfd45b02c1e2f",
            },
            source = {
                url = "https://codeload.github.com/rootbeer-org/rootbeer/tar.gz/579e2416b9f991d1a8ce15ac1c6e38316dd86f62",
                git = {
                    github = "rootbeer-org/rootbeer",
                    branch = "main",
                },
                archive = "tar.gz",
                strip_prefix = "rootbeer-579e2416b9f991d1a8ce15ac1c6e38316dd86f62",
            },
            build = {
                backend = "rust",
                rust = {
                    packages = { "rootbeer-cli", "rootbeer-forge", "rootbeer-store" },
                    environment = {
                        RB_SOURCE_REVISION = "579e2416b9f991d1a8ce15ac1c6e38316dd86f62",
                        ROOTBEER_PDR_PUBLIC_KEY = "028c5b185fb63ea61128a0bf6fb0decc8b700020561db08d82a998c7d0493bc0",
                        ROOTBEER_PDR_URL = "https://pdr.rbpkg.com/v3/current.json",
                    },
                },
            },
        },
        ["0.1.0-main+5c86208223c3"] = {
            digests = {
                ["aarch64-linux"] = "4218cdb7305ebfbf202dd6c8c2c64f3f55d8352f212be435fa625a349eb1b876",
                ["aarch64-macos"] = "4218cdb7305ebfbf202dd6c8c2c64f3f55d8352f212be435fa625a349eb1b876",
                ["x86_64-linux"] = "4218cdb7305ebfbf202dd6c8c2c64f3f55d8352f212be435fa625a349eb1b876",
            },
            commit = "5c86208223c377ea87a6e182f0d61dc8c667e23b",
        },
        ["0.1.0-main+5cc722f96c75"] = {
            digests = {
                ["aarch64-linux"] = "0ad877df9e476e40b96edda65eaca502d41dcb2f31acb42659fee6da18ba3b40",
                ["aarch64-macos"] = "0ad877df9e476e40b96edda65eaca502d41dcb2f31acb42659fee6da18ba3b40",
                ["x86_64-linux"] = "0ad877df9e476e40b96edda65eaca502d41dcb2f31acb42659fee6da18ba3b40",
            },
            commit = "5cc722f96c7593e5ea1ce2f115eaf84a4c07c8d6",
        },
        ["0.1.0-main+5fb19e89fce4"] = {
            digests = {
                ["aarch64-linux"] = "19835154be6096cbe7a1adf6fcab71748ffab54c8dfc5f0ec7a58ccec48b1e04",
                ["aarch64-macos"] = "19835154be6096cbe7a1adf6fcab71748ffab54c8dfc5f0ec7a58ccec48b1e04",
                ["x86_64-linux"] = "19835154be6096cbe7a1adf6fcab71748ffab54c8dfc5f0ec7a58ccec48b1e04",
            },
            commit = "5fb19e89fce4b2b3228eaf1efb66a516a5ab280f",
        },
        ["0.1.0-main+5feb04139f85"] = {
            digests = {
                ["aarch64-linux"] = "840a0b0e99b4f501f7cad15cafb6d15b8476616480123aa7405cd4e12e4572af",
                ["aarch64-macos"] = "840a0b0e99b4f501f7cad15cafb6d15b8476616480123aa7405cd4e12e4572af",
                ["x86_64-linux"] = "840a0b0e99b4f501f7cad15cafb6d15b8476616480123aa7405cd4e12e4572af",
            },
            commit = "5feb04139f85922ffa7db2231585706aebf2e48b",
        },
        ["0.1.0-main+67f529a9d532"] = {
            digests = {
                ["aarch64-linux"] = "0bb474efc78d32aa38728bf2dbe4bb625d34de8b19defe0f5a1dbc899750d306",
                ["aarch64-macos"] = "0bb474efc78d32aa38728bf2dbe4bb625d34de8b19defe0f5a1dbc899750d306",
                ["x86_64-linux"] = "0bb474efc78d32aa38728bf2dbe4bb625d34de8b19defe0f5a1dbc899750d306",
            },
            commit = "67f529a9d5323ed115035724faa3fb1836435040",
        },
        ["0.1.0-main+6a14f4aaaa6d"] = {
            digests = {
                ["aarch64-linux"] = "54a67ca0acdda5e01feee5fd39e9ae9f3e817d3deadc041678dc22d9cbc3094f",
                ["aarch64-macos"] = "54a67ca0acdda5e01feee5fd39e9ae9f3e817d3deadc041678dc22d9cbc3094f",
                ["x86_64-linux"] = "54a67ca0acdda5e01feee5fd39e9ae9f3e817d3deadc041678dc22d9cbc3094f",
            },
            commit = "6a14f4aaaa6de6e8aad9eea1f1a456e3fb58a467",
        },
        ["0.1.0-main+74bb4473b039"] = {
            digests = {
                ["aarch64-linux"] = "d0a480f60c37db4db673f4cec54a51eb6da530f62e77485ddbefa1f29655a755",
                ["aarch64-macos"] = "d0a480f60c37db4db673f4cec54a51eb6da530f62e77485ddbefa1f29655a755",
                ["x86_64-linux"] = "d0a480f60c37db4db673f4cec54a51eb6da530f62e77485ddbefa1f29655a755",
            },
            commit = "74bb4473b039774d81d31feaa8ccb422ba4ecf65",
        },
        ["0.1.0-main+797f05c93da3"] = {
            digests = {
                ["aarch64-linux"] = "fe0f3e393d2b7e4cedc1b08df45b56c5d1e8b2fbc23c9f962a4678284678c1c8",
                ["aarch64-macos"] = "fe0f3e393d2b7e4cedc1b08df45b56c5d1e8b2fbc23c9f962a4678284678c1c8",
                ["x86_64-linux"] = "fe0f3e393d2b7e4cedc1b08df45b56c5d1e8b2fbc23c9f962a4678284678c1c8",
            },
            commit = "797f05c93da309c0da1d0398564deea93ce15693",
        },
        ["0.1.0-main+8653321af42b"] = {
            digests = {
                ["aarch64-linux"] = "221ca19ee0e68fe31f2c526d290778a0ea4cc6c9e6f0931465c36220a0f8aa4f",
                ["aarch64-macos"] = "221ca19ee0e68fe31f2c526d290778a0ea4cc6c9e6f0931465c36220a0f8aa4f",
                ["x86_64-linux"] = "221ca19ee0e68fe31f2c526d290778a0ea4cc6c9e6f0931465c36220a0f8aa4f",
            },
            commit = "8653321af42bdfd58012109afcadd840c14d0b4a",
        },
        ["0.1.0-main+9a8f58eeb987"] = {
            digests = {
                ["aarch64-linux"] = "1014d248c3ad8a7a6f9b90de8cae3f6a5a1736670b05b1c7794bb279f585e0c8",
                ["aarch64-macos"] = "1014d248c3ad8a7a6f9b90de8cae3f6a5a1736670b05b1c7794bb279f585e0c8",
                ["x86_64-linux"] = "1014d248c3ad8a7a6f9b90de8cae3f6a5a1736670b05b1c7794bb279f585e0c8",
            },
            commit = "9a8f58eeb987b43de6b2687527492c3aebf2d01e",
        },
        ["0.1.0-main+9c8d622de688"] = {
            digests = {
                ["aarch64-linux"] = "f2f45262c75a1e91eafe75d9718ae5230d5a3ee9b66056f61d3e474bf44417f7",
                ["aarch64-macos"] = "f2f45262c75a1e91eafe75d9718ae5230d5a3ee9b66056f61d3e474bf44417f7",
                ["x86_64-linux"] = "f2f45262c75a1e91eafe75d9718ae5230d5a3ee9b66056f61d3e474bf44417f7",
            },
            source = {
                url = "https://codeload.github.com/rootbeer-org/rootbeer/tar.gz/9c8d622de688ec222df047663444630127452ec7",
                git = {
                    github = "rootbeer-org/rootbeer",
                    branch = "main",
                },
                archive = "tar.gz",
                strip_prefix = "rootbeer-9c8d622de688ec222df047663444630127452ec7",
            },
            build = {
                backend = "rust",
                rust = {
                    packages = { "rootbeer-cli", "rootbeer-forge", "rootbeer-store" },
                    environment = {
                        RB_SOURCE_REVISION = "9c8d622de688ec222df047663444630127452ec7",
                        ROOTBEER_PDR_PUBLIC_KEY = "028c5b185fb63ea61128a0bf6fb0decc8b700020561db08d82a998c7d0493bc0",
                        ROOTBEER_PDR_URL = "https://pdr.rbpkg.com/v3/current.json",
                    },
                },
            },
        },
        ["0.1.0-main+a33533f159d7"] = {
            digests = {
                ["aarch64-linux"] = "0cc647aa354c055d40a4b5bd534c88d7a93ba0a3b551d1983f2f86d7f91b73e5",
                ["aarch64-macos"] = "0cc647aa354c055d40a4b5bd534c88d7a93ba0a3b551d1983f2f86d7f91b73e5",
                ["x86_64-linux"] = "0cc647aa354c055d40a4b5bd534c88d7a93ba0a3b551d1983f2f86d7f91b73e5",
            },
            commit = "a33533f159d77f59e59c2844f8bcd3708cb1e41d",
        },
        ["0.1.0-main+b8f0a99c0e4b"] = {
            digests = {
                ["aarch64-linux"] = "11432e9f6528b0cfa7295e8ee1c7cf1070d80bfa09d6344ce11727a949ac2bf1",
                ["aarch64-macos"] = "11432e9f6528b0cfa7295e8ee1c7cf1070d80bfa09d6344ce11727a949ac2bf1",
                ["x86_64-linux"] = "11432e9f6528b0cfa7295e8ee1c7cf1070d80bfa09d6344ce11727a949ac2bf1",
            },
            commit = "b8f0a99c0e4bd4d653fcc760b0a50e65edb43f38",
        },
        ["0.1.0-main+c3691e08679f"] = {
            digests = {
                ["aarch64-linux"] = "00c2b3caf98ebe5525def904896e5752e116db8c4a323d2c6a9883e1f463ff99",
                ["aarch64-macos"] = "00c2b3caf98ebe5525def904896e5752e116db8c4a323d2c6a9883e1f463ff99",
                ["x86_64-linux"] = "00c2b3caf98ebe5525def904896e5752e116db8c4a323d2c6a9883e1f463ff99",
            },
            commit = "c3691e08679f7674915971f77b12478870f2366e",
        },
        ["0.1.0-main+c41cc8669a68"] = {
            digests = {
                ["aarch64-linux"] = "92283b4e9d495432af840cd12a7ebbd9989178627ab233fcf49727a0fd9ad54a",
                ["aarch64-macos"] = "92283b4e9d495432af840cd12a7ebbd9989178627ab233fcf49727a0fd9ad54a",
                ["x86_64-linux"] = "92283b4e9d495432af840cd12a7ebbd9989178627ab233fcf49727a0fd9ad54a",
            },
            commit = "c41cc8669a687eb47a5266a3209ded4fa9bf2215",
        },
        ["0.1.0-main+d1ed59320079"] = {
            digests = {
                ["aarch64-linux"] = "b9fb06467bcba58d7419ebe814fda27245cf7c92dcd0490c244fc0542c640395",
                ["aarch64-macos"] = "b9fb06467bcba58d7419ebe814fda27245cf7c92dcd0490c244fc0542c640395",
                ["x86_64-linux"] = "b9fb06467bcba58d7419ebe814fda27245cf7c92dcd0490c244fc0542c640395",
            },
            commit = "d1ed59320079526bfed09f027376402a25a9338f",
        },
        ["0.1.0-main+e2d15a5f16c2"] = {
            digests = {
                ["aarch64-linux"] = "5f04245e3c36807409abff128e93f93107cf8dbd149792facfc0d5afd6fd6280",
                ["aarch64-macos"] = "5f04245e3c36807409abff128e93f93107cf8dbd149792facfc0d5afd6fd6280",
                ["x86_64-linux"] = "5f04245e3c36807409abff128e93f93107cf8dbd149792facfc0d5afd6fd6280",
            },
            commit = "e2d15a5f16c228a7b523973b70d7acf5beb94761",
        },
        ["0.1.0-main+e386c724c091"] = {
            digests = {
                ["aarch64-linux"] = "ddf76cfdef14e2f9924b4f2fba2ce753e5719f0af7cd7a5a277ce684817acb6b",
                ["aarch64-macos"] = "ddf76cfdef14e2f9924b4f2fba2ce753e5719f0af7cd7a5a277ce684817acb6b",
                ["x86_64-linux"] = "ddf76cfdef14e2f9924b4f2fba2ce753e5719f0af7cd7a5a277ce684817acb6b",
            },
            commit = "e386c724c09130cfe5ce88d02197020bc2b93027",
        },
        ["0.1.0-main+e45736832161"] = {
            digests = {
                ["aarch64-linux"] = "1ff539ad26ebde668e7f6bda56c4364ec9faaa38a572e50582fe8e9dcd13365d",
                ["aarch64-macos"] = "1ff539ad26ebde668e7f6bda56c4364ec9faaa38a572e50582fe8e9dcd13365d",
                ["x86_64-linux"] = "1ff539ad26ebde668e7f6bda56c4364ec9faaa38a572e50582fe8e9dcd13365d",
            },
            commit = "e4573683216168080ec531d108a35fd8b56670d7",
        },
        ["0.1.0-main+e4cfb04e2e29"] = {
            digests = {
                ["aarch64-linux"] = "2af058fa273cbd358e32f8b70fbf00008c38ddda91860f8a5691073aa6ac2e5d",
                ["aarch64-macos"] = "2af058fa273cbd358e32f8b70fbf00008c38ddda91860f8a5691073aa6ac2e5d",
                ["x86_64-linux"] = "2af058fa273cbd358e32f8b70fbf00008c38ddda91860f8a5691073aa6ac2e5d",
            },
            commit = "e4cfb04e2e2930e7e929e6da0bf38e120aa2a6cc",
        },
        ["0.1.0-main+eee7bf74b917"] = {
            digests = {
                ["aarch64-linux"] = "8a5322d5adef8eb79f9042d2442ce3d7aaeedc2ca3b2d25b9a6bca55d530a492",
                ["aarch64-macos"] = "8a5322d5adef8eb79f9042d2442ce3d7aaeedc2ca3b2d25b9a6bca55d530a492",
                ["x86_64-linux"] = "8a5322d5adef8eb79f9042d2442ce3d7aaeedc2ca3b2d25b9a6bca55d530a492",
            },
            commit = "eee7bf74b9177e3068d012b549b8289d1e2e30c0",
        },
        ["0.1.0-main+f2012f0f4847"] = {
            digests = {
                ["aarch64-linux"] = "5d2b279633b539c6b09f96e9fab294fe5d21cfb41bf3041243010c6a4cd173a6",
                ["aarch64-macos"] = "5d2b279633b539c6b09f96e9fab294fe5d21cfb41bf3041243010c6a4cd173a6",
                ["x86_64-linux"] = "5d2b279633b539c6b09f96e9fab294fe5d21cfb41bf3041243010c6a4cd173a6",
            },
            commit = "f2012f0f4847226856eb274202025722594a1180",
        },
        ["0.1.0-main+feb6d0af2874"] = {
            digests = {
                ["aarch64-linux"] = "048355c65218fbfc883ff029f448ca6f14b9bb243a9ac0c02ad461f3a4106521",
                ["aarch64-macos"] = "048355c65218fbfc883ff029f448ca6f14b9bb243a9ac0c02ad461f3a4106521",
                ["x86_64-linux"] = "048355c65218fbfc883ff029f448ca6f14b9bb243a9ac0c02ad461f3a4106521",
            },
            commit = "feb6d0af2874c443e293215ff00598e196e12ba9",
        },
    },
}
