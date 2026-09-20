return {
    schema = 2,
    name = "lazydocker",
    description = "Manage Docker containers in a terminal interface",
    default_version = "0.25.2",
    homepage = "https://github.com/jesseduffield/lazydocker",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "jesseduffield/lazydocker",
        repository_id = 187335810,
        tag_prefix = "v",
    },
    inputs = {
        source = {
            url = "https://codeload.github.com/jesseduffield/lazydocker/tar.gz/refs/tags/{tag}",
            archive = "tar.gz",
            strip_prefix = "lazydocker-{version}",
        },
    },
    build = {
        backend = "go",
        go = {
            binaries = { lazydocker = "." },
            variables = { ["main.version"] = "{version}", ["main.buildSource"] = "Rootbeer" },
        },
    },
    outputs = {
        bins = { "lazydocker" },
        checks = { { "lazydocker", "--version" } },
    },
    versions = {
        ["0.25.2"] = {
            revision = 3,
            inputs = {
                source = {
                    sha256 = "405071220e5be9aa061c65d290e0347143b73ae0a3cc01df164f0105de2b53c4",
                },
            },
        },
    },
}
