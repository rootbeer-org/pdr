return {
    name = "act",
    description = "Run GitHub Actions workflows locally",
    homepage = "https://nektosact.com/",
    recipe_maintainers = { "tale" },
    default_license = "MIT",
    upstream = {
        github = "nektos/act",
        repository_id = 163883279,
        tag = "v{version}",
    },
    source = {
        url = "https://codeload.github.com/nektos/act/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "act-{version}",
    },
    build = {
        backend = "go",
        go = {
            binaries = {
                act = ".",
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
        bins = { "act" },
        checks = {
            { "act", "--version" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "0.2.97",
        },
        ["aarch64-macos"] = {
            default_version = "0.2.97",
        },
        ["x86_64-linux"] = {
            default_version = "0.2.97",
        },
    },
    versions = {
        ["0.2.92"] = {
            digests = {
                ["aarch64-linux"] = "8b3ffbbb803007dfca19d5ea8e071876733d1390cfe358fe164ad67c6d7e549b",
                ["aarch64-macos"] = "8b3ffbbb803007dfca19d5ea8e071876733d1390cfe358fe164ad67c6d7e549b",
                ["x86_64-linux"] = "8b3ffbbb803007dfca19d5ea8e071876733d1390cfe358fe164ad67c6d7e549b",
            },
        },
        ["0.2.97"] = {
            digests = {
                ["aarch64-linux"] = "807e43becd597f65c76c7d5dd6dbe5ff94285629214f6005ad18ce618b70e49c",
                ["aarch64-macos"] = "807e43becd597f65c76c7d5dd6dbe5ff94285629214f6005ad18ce618b70e49c",
                ["x86_64-linux"] = "807e43becd597f65c76c7d5dd6dbe5ff94285629214f6005ad18ce618b70e49c",
            },
        },
    },
}
