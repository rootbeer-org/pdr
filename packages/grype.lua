return {
    schema = 2,
    name = "grype",
    description = "Find vulnerabilities in images and filesystems",
    homepage = "https://github.com/anchore/grype",
    default_version = "0.119.0",
    upstream = {
        github = "anchore/grype",
        repository_id = 267054247,
        tag_prefix = "v",
    },
    inputs = {
        source = {
            url = "https://codeload.github.com/anchore/grype/tar.gz/refs/tags/{tag}",
            archive = "tar.gz",
            strip_prefix = "grype-{version}",
        },
    },
    build = {
        backend = "go",
        go = {
            binaries = { grype = "./cmd/grype" },
            variables = { ["main.version"] = "{version}" },
        },
    },
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    outputs = {
        bins = { "grype" },
        checks = {
            { "grype", "version" },
        },
    },
    versions = {
        ["0.118.0"] = {
            revision = 3,
            inputs = {
                source = {
                    sha256 = "6963758836cd46fd019d4c5e2eb903ec26960c34814a35058ebea56971dc592c",
                },
            },
        },
        ["0.119.0"] = {
            revision = 2,
            inputs = {
                source = {
                    sha256 = "be9c904938d9702e432e3c24ea2288913678af33968405980d2061d6159248b2",
                },
            },
        },
    },
}
