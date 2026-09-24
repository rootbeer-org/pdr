return {
    name = "fzf",
    description = "Find and select text interactively",
    homepage = "https://junegunn.github.io/fzf/",
    recipe_maintainers = { "tale" },
    default_license = "MIT",
    upstream = {
        github = "junegunn/fzf",
        repository_id = 13807606,
        tag = "v{version}",
    },
    source = {
        url = "https://codeload.github.com/junegunn/fzf/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "fzf-{version}",
    },
    build = {
        backend = "go",
        go = {
            binaries = {
                fzf = ".",
            },
            variables = {
                ["main.version"] = "{version}",
            },
        },
    },
    outputs = {
        bins = { "fzf" },
        checks = {
            { "fzf", "--version" },
            { "fzf", "--bash" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "0.74.4",
        },
        ["aarch64-macos"] = {
            default_version = "0.74.4",
        },
        ["x86_64-linux"] = {
            default_version = "0.74.4",
        },
    },
    versions = {
        ["0.74.4"] = {
            digests = {
                ["aarch64-linux"] = "1046857c337f5bd05f6fa482446b5a42a011615105743efbe4efee0970b24bb7",
                ["aarch64-macos"] = "1046857c337f5bd05f6fa482446b5a42a011615105743efbe4efee0970b24bb7",
                ["x86_64-linux"] = "1046857c337f5bd05f6fa482446b5a42a011615105743efbe4efee0970b24bb7",
            },
            revision = 3,
        },
    },
}
