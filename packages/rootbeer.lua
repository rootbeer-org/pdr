return {
    name = "rootbeer",
    description = "Declarative system configuration and package tooling in Lua",
    homepage = "https://rootbeer.tale.me",
    default_license = "NOASSERTION",
    source = {
        url = "https://codeload.github.com/tale/rootbeer/tar.gz/323434417bc302fa0fc180430d1ce74e595ba254",
        git = {
            github = "tale/rootbeer",
            branch = "main",
        },
        archive = "tar.gz",
        strip_prefix = "rootbeer-323434417bc302fa0fc180430d1ce74e595ba254",
    },
    build = {
        backend = "rust",
        rust = {
            packages = { "rootbeer-cli", "rootbeer-forge" },
            environment = {
                RB_BUILD_TIMESTAMP = "2026-09-17 01:36 UTC",
                ROOTBEER_INDEX_PUBLIC_KEY = "028c5b185fb63ea61128a0bf6fb0decc8b700020561db08d82a998c7d0493bc0",
                ROOTBEER_INDEX_URL = "https://tale.github.io/rootbeer-index/current.json",
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
            default_version = "0.1.0-main+e5ddb4debb87",
        },
        ["aarch64-macos"] = {
            default_version = "0.1.0-main+e5ddb4debb87",
        },
        ["x86_64-linux"] = {
            default_version = "0.1.0-main+e5ddb4debb87",
        },
    },
    versions = {
        ["0.1.0-main+0e9c7425918c"] = {
            digests = {
                ["aarch64-linux"] = "643581adec3bef09f3a98377e15c2e28f816e043649490dac136a990ffc6b2d2",
                ["aarch64-macos"] = "643581adec3bef09f3a98377e15c2e28f816e043649490dac136a990ffc6b2d2",
                ["x86_64-linux"] = "643581adec3bef09f3a98377e15c2e28f816e043649490dac136a990ffc6b2d2",
            },
            source = {
                url = "https://codeload.github.com/tale/rootbeer/tar.gz/0e9c7425918cbb68c88a61d418c0275a3aec76d4",
                git = {
                    github = "tale/rootbeer",
                    branch = "main",
                },
                archive = "tar.gz",
                strip_prefix = "rootbeer-0e9c7425918cbb68c88a61d418c0275a3aec76d4",
            },
            build = {
                backend = "rust",
                rust = {
                    packages = { "rootbeer-cli", "rootbeer-forge" },
                    environment = {
                        RB_BUILD_TIMESTAMP = "2026-09-19 19:11 UTC",
                        ROOTBEER_INDEX_PUBLIC_KEY = "028c5b185fb63ea61128a0bf6fb0decc8b700020561db08d82a998c7d0493bc0",
                        ROOTBEER_INDEX_URL = "https://tale.github.io/rootbeer-index/current.json",
                    },
                },
            },
        },
        ["0.1.0-main+1857a470d1f9"] = {
            digests = {
                ["aarch64-linux"] = "1c2b231007642e7eacebd1d00f11a37538c4808dd2514dc5764e5fdf70689dbc",
                ["aarch64-macos"] = "1c2b231007642e7eacebd1d00f11a37538c4808dd2514dc5764e5fdf70689dbc",
                ["x86_64-linux"] = "1c2b231007642e7eacebd1d00f11a37538c4808dd2514dc5764e5fdf70689dbc",
            },
            source = {
                url = "https://codeload.github.com/tale/rootbeer/tar.gz/1857a470d1f9c271feeb7d3a8817f331805ec0fa",
                git = {
                    github = "tale/rootbeer",
                    branch = "main",
                },
                archive = "tar.gz",
                strip_prefix = "rootbeer-1857a470d1f9c271feeb7d3a8817f331805ec0fa",
            },
            build = {
                backend = "rust",
                rust = {
                    packages = { "rootbeer-cli", "rootbeer-forge" },
                    environment = {
                        RB_BUILD_TIMESTAMP = "2026-09-20 18:48 UTC",
                        ROOTBEER_INDEX_PUBLIC_KEY = "028c5b185fb63ea61128a0bf6fb0decc8b700020561db08d82a998c7d0493bc0",
                        ROOTBEER_INDEX_URL = "https://pdr.rbpkg.com/current.json",
                    },
                },
            },
        },
        ["0.1.0-main+1c4ae91fbd73"] = {
            digests = {
                ["aarch64-linux"] = "fb68fb67742c5beaa19f6d1f9c09ac26251fb13efcfa999db0623cea5ec28bc4",
                ["aarch64-macos"] = "fb68fb67742c5beaa19f6d1f9c09ac26251fb13efcfa999db0623cea5ec28bc4",
                ["x86_64-linux"] = "fb68fb67742c5beaa19f6d1f9c09ac26251fb13efcfa999db0623cea5ec28bc4",
            },
            source = {
                url = "https://codeload.github.com/tale/rootbeer/tar.gz/1c4ae91fbd739b4e4ecd97124ee0a33a689d7346",
                git = {
                    github = "tale/rootbeer",
                    branch = "main",
                },
                archive = "tar.gz",
                strip_prefix = "rootbeer-1c4ae91fbd739b4e4ecd97124ee0a33a689d7346",
            },
            build = {
                backend = "rust",
                rust = {
                    packages = { "rootbeer-cli", "rootbeer-forge" },
                    environment = {
                        RB_BUILD_TIMESTAMP = "2026-09-20 13:27 UTC",
                        ROOTBEER_INDEX_PUBLIC_KEY = "028c5b185fb63ea61128a0bf6fb0decc8b700020561db08d82a998c7d0493bc0",
                        ROOTBEER_INDEX_URL = "https://pdr.rbpkg.com/current.json",
                    },
                },
            },
        },
        ["0.1.0-main+323434417bc3"] = {
            digests = {
                ["aarch64-linux"] = "414ed0e96cce96fe468db879710434e5a511dd228aa8bf031dc7bfe1cd059823",
                ["aarch64-macos"] = "414ed0e96cce96fe468db879710434e5a511dd228aa8bf031dc7bfe1cd059823",
                ["x86_64-linux"] = "414ed0e96cce96fe468db879710434e5a511dd228aa8bf031dc7bfe1cd059823",
            },
        },
        ["0.1.0-main+5024c18768d1"] = {
            digests = {
                ["aarch64-linux"] = "534fc0c0914922443b7afb255cf1ef99b088ab2371ddce6714c644eb43beda42",
                ["aarch64-macos"] = "534fc0c0914922443b7afb255cf1ef99b088ab2371ddce6714c644eb43beda42",
                ["x86_64-linux"] = "534fc0c0914922443b7afb255cf1ef99b088ab2371ddce6714c644eb43beda42",
            },
            source = {
                url = "https://codeload.github.com/tale/rootbeer/tar.gz/5024c18768d156de175c90229728aafe3561b994",
                git = {
                    github = "tale/rootbeer",
                    branch = "main",
                },
                archive = "tar.gz",
                strip_prefix = "rootbeer-5024c18768d156de175c90229728aafe3561b994",
            },
            build = {
                backend = "rust",
                rust = {
                    packages = { "rootbeer-cli", "rootbeer-forge" },
                    environment = {
                        RB_BUILD_TIMESTAMP = "2026-09-20 20:10 UTC",
                        ROOTBEER_INDEX_PUBLIC_KEY = "028c5b185fb63ea61128a0bf6fb0decc8b700020561db08d82a998c7d0493bc0",
                        ROOTBEER_INDEX_URL = "https://pdr.rbpkg.com/current.json",
                    },
                },
            },
        },
        ["0.1.0-main+5e2153485889"] = {
            digests = {
                ["aarch64-linux"] = "5d5591c8b7eec23c5f976ad26bfc65e72af82a4a0251fa9b9e449c6bbf01670b",
                ["aarch64-macos"] = "5d5591c8b7eec23c5f976ad26bfc65e72af82a4a0251fa9b9e449c6bbf01670b",
                ["x86_64-linux"] = "5d5591c8b7eec23c5f976ad26bfc65e72af82a4a0251fa9b9e449c6bbf01670b",
            },
            revision = 2,
            source = {
                url = "https://codeload.github.com/tale/rootbeer/tar.gz/5e21534858896917f6d703d4ff3c9cffbfefd989",
                git = {
                    github = "tale/rootbeer",
                    branch = "main",
                },
                archive = "tar.gz",
                strip_prefix = "rootbeer-5e21534858896917f6d703d4ff3c9cffbfefd989",
            },
            build = {
                backend = "rust",
                rust = {
                    packages = { "rootbeer-cli", "rootbeer-forge" },
                    environment = {
                        RB_BUILD_TIMESTAMP = "2026-09-20 10:29 UTC",
                        ROOTBEER_INDEX_PUBLIC_KEY = "028c5b185fb63ea61128a0bf6fb0decc8b700020561db08d82a998c7d0493bc0",
                        ROOTBEER_INDEX_URL = "https://pdr.rbpkg.com/current.json",
                    },
                },
            },
        },
        ["0.1.0-main+64c18d5414f4"] = {
            digests = {
                ["aarch64-linux"] = "ecd4684166f31a9c95f7e3632bfff033f48e289ca9cb0476d2e8b136adeb1b99",
                ["aarch64-macos"] = "ecd4684166f31a9c95f7e3632bfff033f48e289ca9cb0476d2e8b136adeb1b99",
                ["x86_64-linux"] = "ecd4684166f31a9c95f7e3632bfff033f48e289ca9cb0476d2e8b136adeb1b99",
            },
            source = {
                url = "https://codeload.github.com/tale/rootbeer/tar.gz/64c18d5414f4268ae254c9db008664b62efab093",
                git = {
                    github = "tale/rootbeer",
                    branch = "main",
                },
                archive = "tar.gz",
                strip_prefix = "rootbeer-64c18d5414f4268ae254c9db008664b62efab093",
            },
            build = {
                backend = "rust",
                rust = {
                    packages = { "rootbeer-cli", "rootbeer-forge" },
                    environment = {
                        RB_BUILD_TIMESTAMP = "2026-09-18 17:32 UTC",
                        ROOTBEER_INDEX_PUBLIC_KEY = "028c5b185fb63ea61128a0bf6fb0decc8b700020561db08d82a998c7d0493bc0",
                        ROOTBEER_INDEX_URL = "https://tale.github.io/rootbeer-index/current.json",
                    },
                },
            },
        },
        ["0.1.0-main+7b15f9e2828e"] = {
            digests = {
                ["aarch64-linux"] = "79fc9fae072e63da0f24a7468880e357846d1258eaf348c7d98607e9b9738058",
                ["aarch64-macos"] = "79fc9fae072e63da0f24a7468880e357846d1258eaf348c7d98607e9b9738058",
                ["x86_64-linux"] = "79fc9fae072e63da0f24a7468880e357846d1258eaf348c7d98607e9b9738058",
            },
            source = {
                url = "https://codeload.github.com/tale/rootbeer/tar.gz/7b15f9e2828ebee00263c1a9356140a0a72c5fcb",
                git = {
                    github = "tale/rootbeer",
                    branch = "main",
                },
                archive = "tar.gz",
                strip_prefix = "rootbeer-7b15f9e2828ebee00263c1a9356140a0a72c5fcb",
            },
            build = {
                backend = "rust",
                rust = {
                    packages = { "rootbeer-cli", "rootbeer-forge" },
                    environment = {
                        RB_BUILD_TIMESTAMP = "2026-09-21 01:43 UTC",
                        ROOTBEER_INDEX_PUBLIC_KEY = "028c5b185fb63ea61128a0bf6fb0decc8b700020561db08d82a998c7d0493bc0",
                        ROOTBEER_INDEX_URL = "https://pdr.rbpkg.com/current.json",
                    },
                },
            },
        },
        ["0.1.0-main+7e6f55977be8"] = {
            digests = {
                ["aarch64-linux"] = "a6539590f1958a021d897c014c1fbcf6887e3bd237694c99028f74b761fd7fcc",
                ["aarch64-macos"] = "a6539590f1958a021d897c014c1fbcf6887e3bd237694c99028f74b761fd7fcc",
                ["x86_64-linux"] = "a6539590f1958a021d897c014c1fbcf6887e3bd237694c99028f74b761fd7fcc",
            },
            source = {
                url = "https://codeload.github.com/tale/rootbeer/tar.gz/7e6f55977be8609efd37db42f4cd1b0628e53307",
                git = {
                    github = "tale/rootbeer",
                    branch = "main",
                },
                archive = "tar.gz",
                strip_prefix = "rootbeer-7e6f55977be8609efd37db42f4cd1b0628e53307",
            },
            build = {
                backend = "rust",
                rust = {
                    packages = { "rootbeer-cli", "rootbeer-forge" },
                    environment = {
                        RB_BUILD_TIMESTAMP = "2026-09-20 05:15 UTC",
                        ROOTBEER_INDEX_PUBLIC_KEY = "028c5b185fb63ea61128a0bf6fb0decc8b700020561db08d82a998c7d0493bc0",
                        ROOTBEER_INDEX_URL = "https://tale.github.io/rootbeer-index/current.json",
                    },
                },
            },
        },
        ["0.1.0-main+a0de7c07581f"] = {
            digests = {
                ["aarch64-linux"] = "7fd68d9d65296ee43e52def457df7235c82c63aecb1d7eb8a0c3c169ea0c66cd",
                ["aarch64-macos"] = "7fd68d9d65296ee43e52def457df7235c82c63aecb1d7eb8a0c3c169ea0c66cd",
                ["x86_64-linux"] = "7fd68d9d65296ee43e52def457df7235c82c63aecb1d7eb8a0c3c169ea0c66cd",
            },
            source = {
                url = "https://codeload.github.com/tale/rootbeer/tar.gz/a0de7c07581fafbc393524536a274d0981b97f34",
                git = {
                    github = "tale/rootbeer",
                    branch = "main",
                },
                archive = "tar.gz",
                strip_prefix = "rootbeer-a0de7c07581fafbc393524536a274d0981b97f34",
            },
            build = {
                backend = "rust",
                rust = {
                    packages = { "rootbeer-cli", "rootbeer-forge" },
                    environment = {
                        RB_BUILD_TIMESTAMP = "2026-09-20 20:54 UTC",
                        ROOTBEER_INDEX_PUBLIC_KEY = "028c5b185fb63ea61128a0bf6fb0decc8b700020561db08d82a998c7d0493bc0",
                        ROOTBEER_INDEX_URL = "https://pdr.rbpkg.com/current.json",
                    },
                },
            },
        },
        ["0.1.0-main+acdc3c816323"] = {
            digests = {
                ["aarch64-linux"] = "b87b432597f8065d08403234eca56224b527267eb2dbc59d50bcac44bcc611f1",
                ["aarch64-macos"] = "b87b432597f8065d08403234eca56224b527267eb2dbc59d50bcac44bcc611f1",
                ["x86_64-linux"] = "b87b432597f8065d08403234eca56224b527267eb2dbc59d50bcac44bcc611f1",
            },
            source = {
                url = "https://codeload.github.com/tale/rootbeer/tar.gz/acdc3c816323b541609abbf52b338c76e0e47260",
                git = {
                    github = "tale/rootbeer",
                    branch = "main",
                },
                archive = "tar.gz",
                strip_prefix = "rootbeer-acdc3c816323b541609abbf52b338c76e0e47260",
            },
            build = {
                backend = "rust",
                rust = {
                    packages = { "rootbeer-cli", "rootbeer-forge" },
                    environment = {
                        RB_BUILD_TIMESTAMP = "2026-09-18 23:09 UTC",
                        ROOTBEER_INDEX_PUBLIC_KEY = "028c5b185fb63ea61128a0bf6fb0decc8b700020561db08d82a998c7d0493bc0",
                        ROOTBEER_INDEX_URL = "https://tale.github.io/rootbeer-index/current.json",
                    },
                },
            },
        },
        ["0.1.0-main+e5ddb4debb87"] = {
            digests = {
                ["aarch64-linux"] = "99e12a7ee77ff8f975515c6e02044cc2615b9f7eaef36d36849c5f8fc2c17080",
                ["aarch64-macos"] = "99e12a7ee77ff8f975515c6e02044cc2615b9f7eaef36d36849c5f8fc2c17080",
                ["x86_64-linux"] = "99e12a7ee77ff8f975515c6e02044cc2615b9f7eaef36d36849c5f8fc2c17080",
            },
            source = {
                url = "https://codeload.github.com/tale/rootbeer/tar.gz/e5ddb4debb87679ff2a83d080e9651a61cc27489",
                git = {
                    github = "tale/rootbeer",
                    branch = "main",
                },
                archive = "tar.gz",
                strip_prefix = "rootbeer-e5ddb4debb87679ff2a83d080e9651a61cc27489",
            },
            build = {
                backend = "rust",
                rust = {
                    packages = { "rootbeer-cli", "rootbeer-forge" },
                    environment = {
                        RB_BUILD_TIMESTAMP = "2026-09-21 02:47 UTC",
                        ROOTBEER_INDEX_PUBLIC_KEY = "028c5b185fb63ea61128a0bf6fb0decc8b700020561db08d82a998c7d0493bc0",
                        ROOTBEER_INDEX_URL = "https://pdr.rbpkg.com/current.json",
                    },
                },
            },
        },
    },
}
