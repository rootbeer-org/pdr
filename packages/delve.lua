return {
    name = "delve",
    description = "Debug Go programs",
    homepage = "https://github.com/go-delve/delve",
    recipe_maintainers = { "tale" },
    default_license = "MIT",
    upstream = {
        github = "go-delve/delve",
        repository_id = 19994257,
        tag = "v{version}",
    },
    source = {
        url = "https://codeload.github.com/go-delve/delve/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "delve-{version}",
    },
    build = {
        backend = "go",
        go = {
            binaries = {
                dlv = "./cmd/dlv",
            },
            variables = {
                ["main.Build"] = "{commit}",
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
        bins = { "dlv" },
        checks = {
            { "dlv", "version" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "1.27.2",
        },
        ["aarch64-macos"] = {
            default_version = "1.27.2",
        },
        ["x86_64-linux"] = {
            default_version = "1.27.2",
        },
    },
    versions = {
        ["1.27.2"] = {
            digests = {
                ["aarch64-linux"] = "8ea5979dfc5978c9690dc1dd533a830815441dd33617f4a61bcdff7d2c3c7e90",
                ["aarch64-macos"] = "8ea5979dfc5978c9690dc1dd533a830815441dd33617f4a61bcdff7d2c3c7e90",
                ["x86_64-linux"] = "8ea5979dfc5978c9690dc1dd533a830815441dd33617f4a61bcdff7d2c3c7e90",
            },
            commit = "d116177dd925e085ba5dd340f8c644f4a1501a3b",
            revision = 2,
        },
    },
}
