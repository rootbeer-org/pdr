return {
    name = "step",
    description = "Manage certificates and a private certificate authority",
    homepage = "https://smallstep.com/cli",
    recipe_maintainers = { "tale" },
    default_license = "Apache-2.0",
    upstream = {
        github = "smallstep/cli",
        repository_id = 141352703,
        tag = "v{version}",
    },
    source = {
        url = "https://github.com/smallstep/cli/releases/download/{tag}/step_{version}.tar.gz",
        archive = "tar.gz",
    },
    build = {
        backend = "go",
        go = {
            binaries = {
                step = "./cmd/step",
            },
            variables = {
                ["main.Version"] = "{version}",
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
        bins = { "step" },
        checks = {
            { "step", "version" },
            { "step", "crypto", "rand", "--format", "hex", "16" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "0.31.0",
        },
        ["aarch64-macos"] = {
            default_version = "0.31.0",
        },
        ["x86_64-linux"] = {
            default_version = "0.31.0",
        },
    },
    versions = {
        ["0.31.0"] = {
            digests = {
                ["aarch64-linux"] = "28b8f239e4813566c68e92a7c00547dec0f3706da0c434e22a8048d012cb9246",
                ["aarch64-macos"] = "28b8f239e4813566c68e92a7c00547dec0f3706da0c434e22a8048d012cb9246",
                ["x86_64-linux"] = "28b8f239e4813566c68e92a7c00547dec0f3706da0c434e22a8048d012cb9246",
            },
            revision = 2,
        },
    },
}
