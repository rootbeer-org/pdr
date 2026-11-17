return {
    name = "syft",
    description = "Generate software bills of materials",
    homepage = "https://github.com/anchore/syft",
    recipe_maintainers = { "tale" },
    default_license = "Apache-2.0",
    upstream = {
        github = "anchore/syft",
        repository_id = 262126497,
        tag = "v{version}",
    },
    source = {
        url = "https://codeload.github.com/anchore/syft/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "syft-{version}",
    },
    build = {
        backend = "go",
        go = {
            binaries = {
                syft = "./cmd/syft",
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
        bins = { "syft" },
        checks = {
            { "syft", "version" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "1.57.2",
        },
        ["aarch64-macos"] = {
            default_version = "1.57.2",
        },
        ["x86_64-linux"] = {
            default_version = "1.57.2",
        },
    },
    versions = {
        ["1.57.1"] = {
            digests = {
                ["aarch64-linux"] = "990a7d9402109bce18f27c54a15ac5c10ac6f05e559a2f576aaa5c70afbaeab4",
                ["aarch64-macos"] = "990a7d9402109bce18f27c54a15ac5c10ac6f05e559a2f576aaa5c70afbaeab4",
                ["x86_64-linux"] = "990a7d9402109bce18f27c54a15ac5c10ac6f05e559a2f576aaa5c70afbaeab4",
            },
        },
        ["1.57.2"] = {
            digests = {
                ["aarch64-linux"] = "1cf84a0b5481cc9b6bfa158e2cf1f51a69f4b3d2da1bb79be25511891f2dc473",
                ["aarch64-macos"] = "1cf84a0b5481cc9b6bfa158e2cf1f51a69f4b3d2da1bb79be25511891f2dc473",
                ["x86_64-linux"] = "1cf84a0b5481cc9b6bfa158e2cf1f51a69f4b3d2da1bb79be25511891f2dc473",
            },
        },
    },
}
