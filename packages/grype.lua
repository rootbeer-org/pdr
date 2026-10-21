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
            default_version = "0.121.0",
        },
        ["aarch64-macos"] = {
            default_version = "0.121.0",
        },
        ["x86_64-linux"] = {
            default_version = "0.121.0",
        },
    },
    versions = {
        ["0.119.0"] = {
            digests = {
                ["aarch64-linux"] = "be9c904938d9702e432e3c24ea2288913678af33968405980d2061d6159248b2",
                ["aarch64-macos"] = "be9c904938d9702e432e3c24ea2288913678af33968405980d2061d6159248b2",
                ["x86_64-linux"] = "be9c904938d9702e432e3c24ea2288913678af33968405980d2061d6159248b2",
            },
            revision = 3,
        },
        ["0.121.0"] = {
            digests = {
                ["aarch64-linux"] = "87244bc41b3fbd596d12f31f2f0e335d36c1059662f27baa31036584e427d169",
                ["aarch64-macos"] = "87244bc41b3fbd596d12f31f2f0e335d36c1059662f27baa31036584e427d169",
                ["x86_64-linux"] = "87244bc41b3fbd596d12f31f2f0e335d36c1059662f27baa31036584e427d169",
            },
        },
    },
}
