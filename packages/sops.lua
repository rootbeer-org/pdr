return {
    schema = 2,
    name = "sops",
    description = "Edit encrypted files with support for multiple key providers",
    homepage = "https://getsops.io",
    default_version = "3.13.3",
    upstream = {
        github = "getsops/sops",
        repository_id = 40684033,
        tag_prefix = "v",
    },
    inputs = {
        prebuilt = {
            github = "getsops/sops",
            tag = "v{version}",
            assets = {
                ["aarch64-linux"] = "sops-{tag}.linux.arm64",
                ["aarch64-macos"] = "sops-{tag}.darwin.arm64",
                ["x86_64-linux"] = "sops-{tag}.linux.amd64",
            },
        },
    },
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    outputs = {
        bins = { "sops" },
        checks = {
            { "sops", "--version" },
            { "sops", "--help" },
        },
    },
    versions = {
        ["3.13.3"] = {},
    },
}
