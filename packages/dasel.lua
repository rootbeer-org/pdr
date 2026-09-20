return {
    schema = 2,
    name = "dasel",
    description = "Query and transform structured data",
    default_version = "3.11.2",
    homepage = "https://github.com/TomWright/dasel",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "TomWright/dasel",
        repository_id = 297615696,
        tag_prefix = "v",
    },
    inputs = {
        source = {
            url = "https://codeload.github.com/TomWright/dasel/tar.gz/refs/tags/{tag}",
            archive = "tar.gz",
            strip_prefix = "dasel-{version}",
        },
    },
    build = {
        backend = "go",
        go = {
            binaries = { dasel = "./cmd/dasel" },
            variables = { ["github.com/tomwright/dasel/v3/internal.Version"] = "v{version}" },
        },
    },
    outputs = {
        bins = { "dasel" },
        checks = { { "dasel", "version" }, { "dasel", "--help" } },
    },
    versions = {
        ["3.11.2"] = {
            revision = 3,
            inputs = {
                source = {
                    sha256 = "5471fe33b28c98efed2b1a13431ed24097785f56a24dc9fb15e37b1e266446e1",
                },
            },
        },
    },
}
