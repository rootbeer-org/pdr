return {
    name = "sops",
    description = "Edit encrypted files with support for multiple key providers",
    homepage = "https://getsops.io",
    recipe_maintainers = { "tale" },
    default_license = "MPL-2.0",
    upstream = {
        github = "getsops/sops",
        repository_id = 40684033,
        tag = "v{version}",
    },
    prebuilt = {
        github = "getsops/sops",
        tag = "v{version}",
        asset = "sops-{tag}.{target}",
    },
    outputs = {
        bins = { "sops" },
        checks = {
            { "sops", "--version" },
            { "sops", "--help" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            target = "linux.arm64",
            default_version = "3.13.3",
        },
        ["aarch64-macos"] = {
            target = "darwin.arm64",
            default_version = "3.13.3",
        },
        ["x86_64-linux"] = {
            target = "linux.amd64",
            default_version = "3.13.3",
        },
    },
    versions = {
        ["3.13.3"] = {
            digests = {
                ["aarch64-linux"] = "53b0abacd38ef1b12a66d6c100956691b9cefce018d91f81e73ddf7438b94d77",
                ["aarch64-macos"] = "b97c0d434aab577dc40310e8d22ff9e45eef4c80638ab978daae9b4681c59286",
                ["x86_64-linux"] = "e5bec3346a873ae91d871550f3e698c1aad962aff462a080e40f25fde17fef6b",
            },
        },
    },
}
