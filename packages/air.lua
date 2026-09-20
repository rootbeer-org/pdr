return {
    schema = 2,
    name = "air",
    description = "Reload Go applications during development",
    default_version = "1.67.4",
    homepage = "https://github.com/air-verse/air",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "air-verse/air",
        repository_id = 106704041,
        tag_prefix = "v",
    },
    inputs = {
        source = {
            url = "https://codeload.github.com/air-verse/air/tar.gz/refs/tags/{tag}",
            archive = "tar.gz",
            strip_prefix = "air-{version}",
        },
    },
    build = {
        backend = "go",
        go = {
            binaries = { air = "." },
            variables = { ["main.airVersion"] = "{version}" },
        },
    },
    outputs = {
        bins = { "air" },
        checks = { { "air", "-v" }, { "air", "-h" } },
    },
    versions = {
        ["1.67.4"] = {
            revision = 3,
            inputs = {
                source = {
                    sha256 = "d74de50458f4f2cd744bb08a1acf84dbbcc99138ea0682176568f9a381a81887",
                },
            },
        },
    },
}
