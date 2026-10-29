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
            default_version = "1.14.5",
        },
        ["aarch64-macos"] = {
            target = "darwin-arm64",
            default_version = "1.14.5",
        },
        ["x86_64-linux"] = {
            target = "linux-amd64",
            default_version = "1.14.5",
        },
    },
    versions = {
        ["1.14.4"] = {
            digests = {
                ["aarch64-linux"] = "a4430fad81b8dc54d99e0dc7b7ea5d0741b93645bc612cbeadf12855c4ec60bb",
                ["aarch64-macos"] = "044740c035de3453ff6d09287e9682da3d681ec19bf3d17be7ed9b17f93f8b23",
                ["x86_64-linux"] = "0a69e3f9b682c5cd844b78dae305f6056ceb86c5fcc6913dcea78c527ed97cee",
            },
        },
        ["1.14.5"] = {
            digests = {
                ["aarch64-linux"] = "dfd3aa33c3159810e216fc39afb685d4d120c8f2728e017d8c7f7635d3139382",
                ["aarch64-macos"] = "c865077bdfc99c38d70b377708682eec1a8febab987f0623206e7139d9013096",
                ["x86_64-linux"] = "ff432b68986709e6b69c563a08a2ced4232d5196b0dccd6d2e783e9d714d7d7d",
            },
        },
    },
}
