return {
    name = "mise",
    description = "Manage development tools and tasks",
    homepage = "https://mise.jdx.dev",
    recipe_maintainers = { "tale" },
    default_license = "MIT",
    upstream = {
        github = "jdx/mise",
        repository_id = 586920414,
        tag = "v{version}",
    },
    prebuilt = {
        github = "jdx/mise",
        tag = "v{version}",
        asset = "mise-{tag}-{target}.tar.gz",
    },
    outputs = {
        bins = { "mise" },
        checks = {
            { "mise", "--version" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            target = "linux-arm64-musl",
            default_version = "2026.9.13",
        },
        ["aarch64-macos"] = {
            target = "macos-arm64",
            default_version = "2026.9.13",
        },
        ["x86_64-linux"] = {
            target = "linux-x64-musl",
            default_version = "2026.9.13",
        },
    },
    versions = {
        ["2026.9.11"] = {
            digests = {
                ["aarch64-linux"] = "fcebd8c5bd136a34e0ab01275b5770e1bc449badcb3e9cc7df315c3df5ccbb84",
                ["aarch64-macos"] = "34e8296f932c1d6f3b84d924bbb9f2841336d7bee1c373005d479e13664cb6c0",
                ["x86_64-linux"] = "3359332541856cbce37d3f9837093601c89649b83cd7d0dc6406331e30c00bf9",
            },
        },
        ["2026.9.12"] = {
            digests = {
                ["aarch64-linux"] = "22e7ecd3c6c84ef36e4d0c78c4eef49a79e3fb83aa88e091e2993fd9c9a3f8a1",
                ["aarch64-macos"] = "0f1c7f3e74d8c9ae82976e6990058f2bc68821acc6b4c37a68c206c836692419",
                ["x86_64-linux"] = "1b2051d8d3efab4d9c85ceb59849a3eb052db24ad406a3901fd6b45374c56ebe",
            },
        },
        ["2026.9.13"] = {
            digests = {
                ["aarch64-linux"] = "9a6c72ee899c1e95988e6eb668a9860c4f8e3c01bc2aedd9de113d58b1e35869",
                ["aarch64-macos"] = "4698c2537eef78830bd5acf98204100fb0ad9a8884861e55265e855f35aa3fa0",
                ["x86_64-linux"] = "03052ce8247285b8b5ec40dd04f8058dabc1eaa29881550b7d21199cb133fbf5",
            },
        },
        ["2026.9.5"] = {
            digests = {
                ["aarch64-linux"] = "7915fb3089cb03919fb93c8c629ed065fe30c7cf8e797d9a58c8a70853f44d7e",
                ["aarch64-macos"] = "cb994f2e8a94fbf00300045c81ee799ffebcd8e78241ff37b0aa2da96b924aad",
                ["x86_64-linux"] = "6f0445ef390b60f8de2fdefc15cc69997faacdf75bb9fc113593879269054b17",
            },
            revision = 2,
        },
        ["2026.9.6"] = {
            digests = {
                ["aarch64-linux"] = "0756712abbb855a38c134b5144eb1fdc086d42311388b927b136b215e8474183",
                ["aarch64-macos"] = "47d93429ab421a47e7ca158cdc97aad5c12475c7b306e600583b5b00d6922b8f",
                ["x86_64-linux"] = "451bd4773bd2acf9c069d3bc43097ed53261b9ed8dcbccecca825472fb068112",
            },
            revision = 2,
        },
        ["2026.9.7"] = {
            digests = {
                ["aarch64-linux"] = "85cce4289be0f931609ba2ac179b84875198e948ccb8557a8e842aa15ee117b6",
                ["aarch64-macos"] = "f6810aa1609a475ce7f3fdc83eb1e090ace6231d3b1b5aaead944663c4b4b7f1",
                ["x86_64-linux"] = "2b95652a7e946be3fc72b729d3e415813eba74c49eb3a13b96d16b213aaf6c60",
            },
            revision = 2,
        },
    },
}
