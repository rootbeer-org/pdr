return {
    schema = 2,
    name = "helix",
    aliases = { "hx" },
    description = "Edit text with Helix",
    homepage = "https://helix-editor.com",
    default_version = "25.07.1",
    upstream = {
        github = "helix-editor/helix",
        repository_id = 268424739,
    },
    inputs = {
        prebuilt = {
            github = "helix-editor/helix",
            tag = "{version}",
            assets = {
                ["aarch64-linux"] = "helix-{tag}-aarch64-linux.tar.xz",
                ["aarch64-macos"] = "helix-{tag}-aarch64-macos.tar.xz",
                ["x86_64-linux"] = "helix-{tag}-x86_64-linux.tar.xz",
            },
        },
    },
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    outputs = {
        bins = { "hx" },
        checks = {
            { "hx", "--version" },
            { "hx", "--health", "toml" },
        },
    },
    versions = {
        ["25.07.1"] = {},
    },
}
