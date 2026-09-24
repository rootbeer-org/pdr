return {
    name = "talosctl",
    description = "Manage Talos Linux clusters",
    homepage = "https://www.siderolabs.com/talos-linux",
    recipe_maintainers = { "tale" },
    default_license = "MPL-2.0",
    upstream = {
        github = "siderolabs/talos",
        repository_id = 109451092,
        tag = "v{version}",
    },
    prebuilt = {
        github = "siderolabs/talos",
        tag = "v{version}",
        asset = "talosctl-{target}",
    },
    outputs = {
        bins = { "talosctl" },
        checks = {
            { "talosctl", "version", "--client" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            target = "linux-arm64",
            default_version = "1.14.1",
        },
        ["aarch64-macos"] = {
            target = "darwin-arm64",
            default_version = "1.14.1",
        },
        ["x86_64-linux"] = {
            target = "linux-amd64",
            default_version = "1.14.1",
        },
    },
    versions = {
        ["1.14.1"] = {
            digests = {
                ["aarch64-linux"] = "812406cfc3bd83a937108d5f4872a48645b96de3c01e1f3d82445e8cbd1e7a21",
                ["aarch64-macos"] = "8335917a3c3eb7ad466cc4b834defcbd4948d51312a6e47de11113d7c399a8f8",
                ["x86_64-linux"] = "7233ece94c94296a033a6ddb5efe0baf508a94c71de7e6c7b286500705924208",
            },
        },
    },
}
