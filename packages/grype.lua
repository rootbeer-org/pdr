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
            default_version = "0.121.3",
        },
        ["aarch64-macos"] = {
            default_version = "0.121.3",
        },
        ["x86_64-linux"] = {
            default_version = "0.121.3",
        },
    },
    versions = {
        ["0.121.0"] = {
            digests = {
                ["aarch64-linux"] = "87244bc41b3fbd596d12f31f2f0e335d36c1059662f27baa31036584e427d169",
                ["aarch64-macos"] = "87244bc41b3fbd596d12f31f2f0e335d36c1059662f27baa31036584e427d169",
                ["x86_64-linux"] = "87244bc41b3fbd596d12f31f2f0e335d36c1059662f27baa31036584e427d169",
            },
        },
        ["0.121.3"] = {
            digests = {
                ["aarch64-linux"] = "ced703b9f94606d33f346369ec3d2f84aaa420147232b633d8d847987f9c64bd",
                ["aarch64-macos"] = "ced703b9f94606d33f346369ec3d2f84aaa420147232b633d8d847987f9c64bd",
                ["x86_64-linux"] = "ced703b9f94606d33f346369ec3d2f84aaa420147232b633d8d847987f9c64bd",
            },
        },
    },
}
