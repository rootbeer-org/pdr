return {
    name = "nushell",
    description = "Run a structured-data shell",
    homepage = "https://www.nushell.sh/",
    recipe_maintainers = { "tale" },
    default_license = "MIT",
    upstream = {
        github = "nushell/nushell",
        repository_id = 186024298,
        tag = "{version}",
    },
    source = {
        url = "https://codeload.github.com/nushell/nushell/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "nushell-{version}",
    },
    build = {
        backend = "rust",
        dependencies = {
            { package = "rust", kind = "build" },
        },
        rust = {
            packages = { "nu" },
        },
    },
    outputs = {
        bins = { "nu" },
        checks = {
            { "nu", "--version" },
            { "nu", "--no-config-file", "--commands", "[1 2 3] | math sum" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "0.117.0",
        },
        ["aarch64-macos"] = {
            default_version = "0.117.0",
        },
        ["x86_64-linux"] = {
            default_version = "0.117.0",
        },
    },
    versions = {
        ["0.116.1"] = {
            digests = {
                ["aarch64-linux"] = "0cca0c5bc9d9eb608dee00c75b6b511917df6e66c784b034468bab2ff0fbb9b4",
                ["aarch64-macos"] = "0cca0c5bc9d9eb608dee00c75b6b511917df6e66c784b034468bab2ff0fbb9b4",
                ["x86_64-linux"] = "0cca0c5bc9d9eb608dee00c75b6b511917df6e66c784b034468bab2ff0fbb9b4",
            },
        },
        ["0.117.0"] = {
            digests = {
                ["aarch64-linux"] = "ccb5640f8f88b48787c946daf87a349972b939c2edbc5a3b4ca6fc0921bddd6b",
                ["aarch64-macos"] = "ccb5640f8f88b48787c946daf87a349972b939c2edbc5a3b4ca6fc0921bddd6b",
                ["x86_64-linux"] = "ccb5640f8f88b48787c946daf87a349972b939c2edbc5a3b4ca6fc0921bddd6b",
            },
        },
    },
}
