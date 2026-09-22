return {
    name = "lazydocker",
    description = "Manage Docker containers in a terminal interface",
    homepage = "https://github.com/jesseduffield/lazydocker",
    default_license = "MIT",
    source = {
        url = "https://codeload.github.com/jesseduffield/lazydocker/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "lazydocker-{version}",
    },
    build = {
        backend = "go",
        go = {
            binaries = { lazydocker = "." },
            variables = { ["main.buildSource"] = "Rootbeer", ["main.version"] = "{version}" },
        },
    },
    outputs = { bins = { "lazydocker" }, checks = { { "lazydocker", "--version" } } },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "0.25.2",
            upstream = {
                github = "jesseduffield/lazydocker",
                repository_id = 187335810,
                tag_prefix = "v",
            },
        },
        ["aarch64-macos"] = {
            default_version = "0.25.2",
            upstream = {
                github = "jesseduffield/lazydocker",
                repository_id = 187335810,
                tag_prefix = "v",
            },
        },
        ["x86_64-linux"] = {
            default_version = "0.25.2",
            upstream = {
                github = "jesseduffield/lazydocker",
                repository_id = 187335810,
                tag_prefix = "v",
            },
        },
    },
    versions = {
        ["0.25.2"] = {
            digests = {
                ["aarch64-linux"] = "405071220e5be9aa061c65d290e0347143b73ae0a3cc01df164f0105de2b53c4",
                ["aarch64-macos"] = "405071220e5be9aa061c65d290e0347143b73ae0a3cc01df164f0105de2b53c4",
                ["x86_64-linux"] = "405071220e5be9aa061c65d290e0347143b73ae0a3cc01df164f0105de2b53c4",
            },
            revision = 3,
        },
    },
}
