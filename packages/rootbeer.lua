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
            default_version = "0.1.0-main+2881782a8c2a",
        },
        ["aarch64-macos"] = {
            default_version = "0.1.0-main+2881782a8c2a",
        },
        ["x86_64-linux"] = {
            default_version = "0.1.0-main+2881782a8c2a",
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
        ["0.1.0-main+5cc722f96c75"] = {
            digests = {
                ["aarch64-linux"] = "0ad877df9e476e40b96edda65eaca502d41dcb2f31acb42659fee6da18ba3b40",
                ["aarch64-macos"] = "0ad877df9e476e40b96edda65eaca502d41dcb2f31acb42659fee6da18ba3b40",
                ["x86_64-linux"] = "0ad877df9e476e40b96edda65eaca502d41dcb2f31acb42659fee6da18ba3b40",
            },
            commit = "5cc722f96c7593e5ea1ce2f115eaf84a4c07c8d6",
        },
        ["0.1.0-main+5feb04139f85"] = {
            digests = {
                ["aarch64-linux"] = "840a0b0e99b4f501f7cad15cafb6d15b8476616480123aa7405cd4e12e4572af",
                ["aarch64-macos"] = "840a0b0e99b4f501f7cad15cafb6d15b8476616480123aa7405cd4e12e4572af",
                ["x86_64-linux"] = "840a0b0e99b4f501f7cad15cafb6d15b8476616480123aa7405cd4e12e4572af",
            },
            commit = "5feb04139f85922ffa7db2231585706aebf2e48b",
        },
        ["0.1.0-main+6a14f4aaaa6d"] = {
            digests = {
                ["aarch64-linux"] = "54a67ca0acdda5e01feee5fd39e9ae9f3e817d3deadc041678dc22d9cbc3094f",
                ["aarch64-macos"] = "54a67ca0acdda5e01feee5fd39e9ae9f3e817d3deadc041678dc22d9cbc3094f",
                ["x86_64-linux"] = "54a67ca0acdda5e01feee5fd39e9ae9f3e817d3deadc041678dc22d9cbc3094f",
            },
            commit = "6a14f4aaaa6de6e8aad9eea1f1a456e3fb58a467",
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
        ["0.1.0-main+b8f0a99c0e4b"] = {
            digests = {
                ["aarch64-linux"] = "11432e9f6528b0cfa7295e8ee1c7cf1070d80bfa09d6344ce11727a949ac2bf1",
                ["aarch64-macos"] = "11432e9f6528b0cfa7295e8ee1c7cf1070d80bfa09d6344ce11727a949ac2bf1",
                ["x86_64-linux"] = "11432e9f6528b0cfa7295e8ee1c7cf1070d80bfa09d6344ce11727a949ac2bf1",
            },
            commit = "b8f0a99c0e4bd4d653fcc760b0a50e65edb43f38",
        },
        ["0.1.0-main+e45736832161"] = {
            digests = {
                ["aarch64-linux"] = "1ff539ad26ebde668e7f6bda56c4364ec9faaa38a572e50582fe8e9dcd13365d",
                ["aarch64-macos"] = "1ff539ad26ebde668e7f6bda56c4364ec9faaa38a572e50582fe8e9dcd13365d",
                ["x86_64-linux"] = "1ff539ad26ebde668e7f6bda56c4364ec9faaa38a572e50582fe8e9dcd13365d",
            },
            commit = "e4573683216168080ec531d108a35fd8b56670d7",
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
