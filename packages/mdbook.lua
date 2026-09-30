return {
    name = "mdbook",
    description = "Build books from Markdown files",
    homepage = "https://rust-lang.github.io/mdBook/",
    recipe_maintainers = { "tale" },
    default_license = "MPL-2.0",
    upstream = {
        github = "rust-lang/mdBook",
        repository_id = 38655056,
        tag = "v{version}",
    },
    source = {
        url = "https://codeload.github.com/rust-lang/mdBook/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "mdBook-{version}",
    },
    build = {
        backend = "rust",
        rust = {
            packages = { "mdbook" },
        },
    },
    outputs = {
        bins = { "mdbook" },
        checks = {
            { "mdbook", "--version" },
            { "mdbook", "completions", "bash" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "0.5.4",
        },
        ["aarch64-macos"] = {
            default_version = "0.5.4",
        },
        ["x86_64-linux"] = {
            default_version = "0.5.4",
        },
    },
    versions = {
        ["0.5.4"] = {
            digests = {
                ["aarch64-linux"] = "107614330c35c77d53b6f6ce7826c50eed087650efe5646a4d0a16ca6bf5544b",
                ["aarch64-macos"] = "107614330c35c77d53b6f6ce7826c50eed087650efe5646a4d0a16ca6bf5544b",
                ["x86_64-linux"] = "107614330c35c77d53b6f6ce7826c50eed087650efe5646a4d0a16ca6bf5544b",
            },
        },
    },
}
