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
            default_version = "1.14.6",
        },
        ["aarch64-macos"] = {
            target = "darwin-arm64",
            default_version = "1.14.6",
        },
        ["x86_64-linux"] = {
            target = "linux-amd64",
            default_version = "1.14.6",
        },
    },
    versions = {
        ["1.14.5"] = {
            digests = {
                ["aarch64-linux"] = "dfd3aa33c3159810e216fc39afb685d4d120c8f2728e017d8c7f7635d3139382",
                ["aarch64-macos"] = "c865077bdfc99c38d70b377708682eec1a8febab987f0623206e7139d9013096",
                ["x86_64-linux"] = "ff432b68986709e6b69c563a08a2ced4232d5196b0dccd6d2e783e9d714d7d7d",
            },
        },
        ["1.14.6"] = {
            digests = {
                ["aarch64-linux"] = "fd22e0678d783105646d824c23ee45cf7a57f737edae274ca41376d03a4def65",
                ["aarch64-macos"] = "dd290798702d60ce8c1f59f4c223d5bdbc9c0638db45a9827d7f6cb4bd4a3f39",
                ["x86_64-linux"] = "11acde7f7578ffe9cbe6fb8349b34595065f597de0842615982e350b365de987",
            },
        },
    },
}
