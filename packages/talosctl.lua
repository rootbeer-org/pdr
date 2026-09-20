return {
    schema = 2,
    name = "talosctl",
    description = "Manage Talos Linux clusters",
    homepage = "https://www.talos.dev",
    default_version = "1.14.1",
    upstream = {
        github = "siderolabs/talos",
        repository_id = 109451092,
        tag_prefix = "v",
    },
    inputs = {
        prebuilt = {
            github = "siderolabs/talos",
            tag = "v{version}",
            assets = {
                ["aarch64-linux"] = "talosctl-linux-arm64",
                ["aarch64-macos"] = "talosctl-darwin-arm64",
                ["x86_64-linux"] = "talosctl-linux-amd64",
            },
        },
    },
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    outputs = {
        bins = { "talosctl" },
        checks = {
            { "talosctl", "version", "--client" },
        },
    },
    versions = {
        ["1.14.1"] = {},
    },
}
