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
            default_version = "2026.10.18",
        },
        ["aarch64-macos"] = {
            target = "macos-arm64",
            default_version = "2026.10.18",
        },
        ["x86_64-linux"] = {
            target = "linux-x64-musl",
            default_version = "2026.10.18",
        },
    },
    versions = {
        ["2026.10.15"] = {
            digests = {
                ["aarch64-linux"] = "cb3d7896680b0289e98097cdb0c70f0989bdd5383dcf795f6d04a6cab703062a",
                ["aarch64-macos"] = "8a44a56f72323c777298a1d5abd88ffd21d0fca19fab1ccccd389a912374f69c",
                ["x86_64-linux"] = "e00c09db8f4d11e7c8d417a12584e2d1297583fcbcba1da1b9866bd24a0af503",
            },
        },
        ["2026.10.18"] = {
            digests = {
                ["aarch64-linux"] = "88bbc1480e196c45c67194b653a08170b9e45e6573e5036f643f288eee95120e",
                ["aarch64-macos"] = "1b1cd6ad4a6176db5ddaf03bf71e131b26324af09cfcf14d7d7038bee60be85d",
                ["x86_64-linux"] = "bb2f31a377789e85df9358f23aaadb4283e2d760cf657ca7449856f92c4230c4",
            },
        },
    },
}
