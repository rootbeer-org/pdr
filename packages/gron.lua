return {
    name = "gron",
    description = "Make JSON greppable",
    homepage = "https://github.com/tomnomnom/gron",
    recipe_maintainers = { "tale" },
    default_license = "MIT",
    upstream = {
        github = "tomnomnom/gron",
        repository_id = 5724223,
        tag = "v{version}",
    },
    source = {
        url = "https://codeload.github.com/tomnomnom/gron/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "gron-{version}",
    },
    build = {
        backend = "go",
        go = {
            binaries = {
                gron = ".",
            },
            variables = {
                ["main.gronVersion"] = "{version}",
            },
        },
    },
    outputs = {
        bins = { "gron" },
        checks = {
            { "gron", "--version" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "0.7.1",
        },
        ["aarch64-macos"] = {
            default_version = "0.7.1",
        },
        ["x86_64-linux"] = {
            default_version = "0.7.1",
        },
    },
    versions = {
        ["0.7.1"] = {
            digests = {
                ["aarch64-linux"] = "1c98f2ef2ba03558864b1ab5e9c4b47a2e89d3ffaf24cfa0ac75cd38d775feb4",
                ["aarch64-macos"] = "1c98f2ef2ba03558864b1ab5e9c4b47a2e89d3ffaf24cfa0ac75cd38d775feb4",
                ["x86_64-linux"] = "1c98f2ef2ba03558864b1ab5e9c4b47a2e89d3ffaf24cfa0ac75cd38d775feb4",
            },
        },
    },
}
