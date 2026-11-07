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
        dependencies = {
            {
                package = "go",
                kind = "build",
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
            default_version = "0.75.0",
        },
        ["aarch64-macos"] = {
            default_version = "0.75.0",
        },
        ["x86_64-linux"] = {
            default_version = "0.75.0",
        },
    },
    versions = {
        ["0.74.5"] = {
            digests = {
                ["aarch64-linux"] = "5529d08897b85ae773695787c811ff9c9eeee32419c8a297fa1dbe586ed0a27e",
                ["aarch64-macos"] = "5529d08897b85ae773695787c811ff9c9eeee32419c8a297fa1dbe586ed0a27e",
                ["x86_64-linux"] = "5529d08897b85ae773695787c811ff9c9eeee32419c8a297fa1dbe586ed0a27e",
            },
        },
        ["0.75.0"] = {
            digests = {
                ["aarch64-linux"] = "165f6e0c1b9ba082346233681e3f1d1374e37f9fd3c1d7b6dfe09659ab893faa",
                ["aarch64-macos"] = "165f6e0c1b9ba082346233681e3f1d1374e37f9fd3c1d7b6dfe09659ab893faa",
                ["x86_64-linux"] = "165f6e0c1b9ba082346233681e3f1d1374e37f9fd3c1d7b6dfe09659ab893faa",
            },
        },
    },
}
