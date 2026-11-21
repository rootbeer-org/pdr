return {
    name = "lima",
    description = "Run Linux virtual machines with file sharing and port forwarding",
    homepage = "https://lima-vm.io/",
    recipe_maintainers = { "tale" },
    default_license = "Apache-2.0",
    upstream = {
        github = "lima-vm/lima",
        repository_id = 367284699,
        tag = "v{version}",
    },
    prebuilt = {
        github = "lima-vm/lima",
        tag = "v{version}",
        asset = "lima-{version}-{target}.tar.gz",
    },
    outputs = {
        bins = { "lima", "limactl" },
        checks = {
            { "limactl", "--version" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            target = "Linux-aarch64",
            default_version = "2.3.0",
        },
        ["aarch64-macos"] = {
            target = "Darwin-arm64",
            default_version = "2.3.0",
        },
        ["x86_64-linux"] = {
            target = "Linux-x86_64",
            default_version = "2.3.0",
        },
    },
    versions = {
        ["2.3.0"] = {
            digests = {
                ["aarch64-linux"] = "7e295d243d9b9439fa05628500daff4371a6861cc7e995ac4af4a0781f736cc6",
                ["aarch64-macos"] = "b7af444bd8f91d3c307477e562f2cf3bd7595d62b9429185e4fa841563578cfc",
                ["x86_64-linux"] = "cc8ba97f1c801b899f7c9eda9919dfc4ce4fa2c140c53e5add15aa2d0a1936f9",
            },
        },
    },
}
