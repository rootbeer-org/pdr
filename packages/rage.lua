return {
    name = "rage",
    description = "Encrypt files using the age format",
    homepage = "https://github.com/str4d/rage",
    recipe_maintainers = { "tale" },
    default_license = "Apache-2.0",
    upstream = {
        github = "str4d/rage",
        repository_id = 213749542,
        tag = "v{version}",
    },
    prebuilt = {
        github = "str4d/rage",
        tag = "v{version}",
        asset = "rage-{tag}-{target}.tar.gz",
    },
    outputs = {
        bins = { "rage", "rage-keygen" },
        checks = {
            { "rage", "--version" },
            { "rage-keygen", "--version" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            target = "arm64-linux",
            default_version = "0.12.1",
        },
        ["aarch64-macos"] = {
            target = "arm64-darwin",
            default_version = "0.12.1",
        },
        ["x86_64-linux"] = {
            target = "x86_64-linux",
            default_version = "0.12.1",
        },
    },
    versions = {
        ["0.12.1"] = {
            digests = {
                ["aarch64-linux"] = "d6814986f9fb0c62bdd4f40a3672468ef3d64d0a3e894ffceb6d1a618309964b",
                ["aarch64-macos"] = "25478bfca7085c7bf59e9f552907d4d0f4635e8de501b0b3553949edef39053e",
                ["x86_64-linux"] = "c5d7ab41fbf1213590e89721fd2b8eb122e84518c155ce35866f1c5759a3a29f",
            },
            revision = 2,
        },
    },
}
