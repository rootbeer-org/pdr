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
            default_version = "1.14.7",
        },
        ["aarch64-macos"] = {
            target = "darwin-arm64",
            default_version = "1.14.7",
        },
        ["x86_64-linux"] = {
            target = "linux-amd64",
            default_version = "1.14.7",
        },
    },
    versions = {
        ["1.14.6"] = {
            digests = {
                ["aarch64-linux"] = "fd22e0678d783105646d824c23ee45cf7a57f737edae274ca41376d03a4def65",
                ["aarch64-macos"] = "dd290798702d60ce8c1f59f4c223d5bdbc9c0638db45a9827d7f6cb4bd4a3f39",
                ["x86_64-linux"] = "11acde7f7578ffe9cbe6fb8349b34595065f597de0842615982e350b365de987",
            },
        },
        ["1.14.7"] = {
            digests = {
                ["aarch64-linux"] = "b5537c9e59ab60c763bee9ab476bf936ecd400799ff670e1f1e8e19182f8233a",
                ["aarch64-macos"] = "7eb6696ead7f6b1a2451fc50f022f4634cdaf7298af963e13c290c5583e185b9",
                ["x86_64-linux"] = "823deb86e20d79f08d000b266e63e4bffc772ee80364ce405bad5659bcacfb18",
            },
        },
    },
}
