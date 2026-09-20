return {
    schema = 2,
    name = "fzf",
    description = "Find and select text interactively",
    default_version = "0.74.4",
    homepage = "https://github.com/junegunn/fzf",
    systems = { "aarch64-macos", "aarch64-linux", "x86_64-linux" },
    upstream = {
        github = "junegunn/fzf",
        repository_id = 13807606,
        tag_prefix = "v",
    },
    inputs = {
        source = {
            url = "https://codeload.github.com/junegunn/fzf/tar.gz/refs/tags/{tag}",
            archive = "tar.gz",
            strip_prefix = "fzf-{version}",
        },
    },
    build = {
        backend = "go",
        go = {
            binaries = { fzf = "." },
            variables = { ["main.version"] = "{version}" },
        },
    },
    outputs = {
        bins = { "fzf" },
        checks = { { "fzf", "--version" }, { "fzf", "--bash" } },
    },
    versions = {
        ["0.74.4"] = {
            revision = 3,
            inputs = {
                source = {
                    sha256 = "1046857c337f5bd05f6fa482446b5a42a011615105743efbe4efee0970b24bb7",
                },
            },
        },
    },
}
