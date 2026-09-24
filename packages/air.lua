return {
    name = "air",
    description = "Reload Go applications during development",
    homepage = "https://github.com/air-verse/air",
    recipe_maintainers = { "tale" },
    default_license = "GPL-3.0-only",
    upstream = {
        github = "air-verse/air",
        repository_id = 106704041,
        tag = "v{version}",
    },
    source = {
        url = "https://codeload.github.com/air-verse/air/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "air-{version}",
    },
    build = {
        backend = "go",
        go = {
            binaries = {
                air = ".",
            },
            variables = {
                ["main.airVersion"] = "{version}",
            },
        },
    },
    outputs = {
        bins = { "air" },
        checks = {
            { "air", "-v" },
            { "air", "-h" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "1.67.4",
        },
        ["aarch64-macos"] = {
            default_version = "1.67.4",
        },
        ["x86_64-linux"] = {
            default_version = "1.67.4",
        },
    },
    versions = {
        ["1.67.4"] = {
            digests = {
                ["aarch64-linux"] = "d74de50458f4f2cd744bb08a1acf84dbbcc99138ea0682176568f9a381a81887",
                ["aarch64-macos"] = "d74de50458f4f2cd744bb08a1acf84dbbcc99138ea0682176568f9a381a81887",
                ["x86_64-linux"] = "d74de50458f4f2cd744bb08a1acf84dbbcc99138ea0682176568f9a381a81887",
            },
            revision = 3,
        },
    },
}
