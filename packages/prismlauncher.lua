return {
    name = "prismlauncher",
    aliases = { "prism-launcher" },
    description = "Launch and manage Minecraft instances",
    homepage = "https://prismlauncher.org/",
    recipe_maintainers = { "tale" },
    default_license = "GPL-3.0-only",
    upstream = {
        github = "PrismLauncher/PrismLauncher",
        repository_id = 553135896,
    },
    prebuilt = {
        github = "PrismLauncher/PrismLauncher",
        tag = "{version}",
        asset = "PrismLauncher-macOS-{version}.zip",
        mirror = true,
    },
    outputs = {
        apps = {
            ["Prism Launcher.app"] = { path = "Prism Launcher.app", updates = "self" },
        },
    },
    platforms = {
        ["aarch64-macos"] = {
            default_version = "11.1.1",
        },
    },
    versions = {
        ["11.1.1"] = {
            digests = {
                ["aarch64-macos"] = "15126a7df57acb4f37fe581dad68cb03c7bb60b70eb82345f8bb3246235600c6",
            },
            trees = {
                ["aarch64-macos"] = "417f695ea267a10d93e8991f18a3cffb4344c4f3fbd17f16c631ab42e3794dbf",
            },
        },
    },
}
