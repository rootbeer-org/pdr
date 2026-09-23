return {
    name = "gitui",
    description = "Browse and manage Git repositories in the terminal",
    homepage = "https://github.com/gitui-org/gitui",
    default_license = "MIT",
    upstream = {
        github = "gitui-org/gitui",
        repository_id = 247725846,
        tag = "v{version}",
    },
    prebuilt = {
        github = "gitui-org/gitui",
        tag = "v{version}",
        asset = "gitui-{target}.tar.gz",
    },
    outputs = {
        bins = { "gitui" },
        checks = {
            { "gitui", "--version" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            target = "linux-aarch64",
            default_version = "0.28.1",
        },
        ["aarch64-macos"] = {
            target = "mac",
            default_version = "0.28.1",
        },
        ["x86_64-linux"] = {
            target = "linux-x86_64",
            default_version = "0.28.1",
        },
    },
    versions = {
        ["0.28.1"] = {
            digests = {
                ["aarch64-linux"] = "2a640da05b73e9152a7bf92bfd7c23acd9d60438f4f2cabb62357014a5fd7c28",
                ["aarch64-macos"] = "3b519a593383841289361bacf579d4a222169aa7ebbdeae6cc449d488d8bb967",
                ["x86_64-linux"] = "f6149b9ae203397158b0c89c13cfde718e7121d3d3cd2ebc597f93d6628d9b5b",
            },
            revision = 3,
        },
    },
}
