return {
    name = "helix",
    aliases = { "hx" },
    description = "Edit text with a modal terminal editor",
    homepage = "https://helix-editor.com",
    recipe_maintainers = { "tale" },
    default_license = "MPL-2.0",
    upstream = {
        github = "helix-editor/helix",
        repository_id = 268424739,
    },
    prebuilt = {
        github = "helix-editor/helix",
        tag = "{version}",
        asset = "helix-{tag}-{target}.tar.xz",
    },
    outputs = {
        bins = { "hx" },
        checks = {
            { "hx", "--version" },
            { "hx", "--health", "toml" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            target = "aarch64-linux",
            default_version = "25.07.1",
        },
        ["aarch64-macos"] = {
            target = "aarch64-macos",
            default_version = "25.07.1",
        },
        ["x86_64-linux"] = {
            target = "x86_64-linux",
            default_version = "25.07.1",
        },
    },
    versions = {
        ["25.07.1"] = {
            digests = {
                ["aarch64-linux"] = "ce23fa8d395e633e3e54c052012f11965d91d8d5c2bfa659685f50430b4f8175",
                ["aarch64-macos"] = "00b1651b4fdbbe0a2ae981c8e76b858bd26a7c33f5b3583f3b6bb9137d54f1ff",
                ["x86_64-linux"] = "3f08e63ecd388fff657ad39722f88bb03dcf326f1f2da2700d99e1dc40ab2e8b",
            },
        },
    },
}
