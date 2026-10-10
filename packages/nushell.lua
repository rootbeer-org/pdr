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
            default_version = "0.116.1",
        },
        ["aarch64-macos"] = {
            default_version = "0.116.1",
        },
        ["x86_64-linux"] = {
            default_version = "0.116.1",
        },
    },
    versions = {
        ["0.116.0"] = {
            digests = {
                ["aarch64-linux"] = "1174d023ffc8083750daec8ee2dfe6486a8ef9f5c22396aa675b61d1bb0fad2d",
                ["aarch64-macos"] = "1174d023ffc8083750daec8ee2dfe6486a8ef9f5c22396aa675b61d1bb0fad2d",
                ["x86_64-linux"] = "1174d023ffc8083750daec8ee2dfe6486a8ef9f5c22396aa675b61d1bb0fad2d",
            },
        },
        ["0.116.1"] = {
            digests = {
                ["aarch64-linux"] = "0cca0c5bc9d9eb608dee00c75b6b511917df6e66c784b034468bab2ff0fbb9b4",
                ["aarch64-macos"] = "0cca0c5bc9d9eb608dee00c75b6b511917df6e66c784b034468bab2ff0fbb9b4",
                ["x86_64-linux"] = "0cca0c5bc9d9eb608dee00c75b6b511917df6e66c784b034468bab2ff0fbb9b4",
            },
        },
    },
}
