return {
    name = "grype",
    description = "Find vulnerabilities in images and filesystems",
    homepage = "https://github.com/anchore/grype",
    recipe_maintainers = { "tale" },
    default_license = "Apache-2.0",
    upstream = {
        github = "anchore/grype",
        repository_id = 267054247,
        tag = "v{version}",
    },
    source = {
        url = "https://codeload.github.com/anchore/grype/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "grype-{version}",
    },
    build = {
        backend = "go",
        go = {
            binaries = {
                grype = "./cmd/grype",
            },
            variables = {
                ["main.version"] = "{version}",
            },
        },
        dependencies = {
            {
                package = "go",
                version = "1.27.1",
                kind = "build",
            },
        },
    },
    outputs = {
        bins = { "grype" },
        checks = {
            { "grype", "version" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "0.120.1",
        },
        ["aarch64-macos"] = {
            default_version = "0.120.1",
        },
        ["x86_64-linux"] = {
            default_version = "0.120.1",
        },
    },
    versions = {
        ["0.118.0"] = {
            digests = {
                ["aarch64-linux"] = "6963758836cd46fd019d4c5e2eb903ec26960c34814a35058ebea56971dc592c",
                ["aarch64-macos"] = "6963758836cd46fd019d4c5e2eb903ec26960c34814a35058ebea56971dc592c",
                ["x86_64-linux"] = "6963758836cd46fd019d4c5e2eb903ec26960c34814a35058ebea56971dc592c",
            },
            revision = 4,
        },
        ["0.119.0"] = {
            digests = {
                ["aarch64-linux"] = "be9c904938d9702e432e3c24ea2288913678af33968405980d2061d6159248b2",
                ["aarch64-macos"] = "be9c904938d9702e432e3c24ea2288913678af33968405980d2061d6159248b2",
                ["x86_64-linux"] = "be9c904938d9702e432e3c24ea2288913678af33968405980d2061d6159248b2",
            },
            revision = 3,
        },
        ["0.120.1"] = {
            digests = {
                ["aarch64-linux"] = "4e90b488a42818aaf40dc7119f85c533302953778f8fac96e281bed5d06c8a68",
                ["aarch64-macos"] = "4e90b488a42818aaf40dc7119f85c533302953778f8fac96e281bed5d06c8a68",
                ["x86_64-linux"] = "4e90b488a42818aaf40dc7119f85c533302953778f8fac96e281bed5d06c8a68",
            },
        },
    },
}
