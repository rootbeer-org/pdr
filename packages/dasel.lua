return {
    name = "dasel",
    description = "Query and transform structured data",
    homepage = "https://github.com/TomWright/dasel",
    default_license = "MIT",
    source = {
        url = "https://codeload.github.com/TomWright/dasel/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "dasel-{version}",
    },
    build = {
        backend = "go",
        go = {
            binaries = { dasel = "./cmd/dasel" },
            variables = { ["github.com/tomwright/dasel/v3/internal.Version"] = "v{version}" },
        },
    },
    outputs = { bins = { "dasel" }, checks = { { "dasel", "version" }, { "dasel", "--help" } } },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "3.11.2",
            upstream = { github = "TomWright/dasel", repository_id = 297615696, tag_prefix = "v" },
        },
        ["aarch64-macos"] = {
            default_version = "3.11.2",
            upstream = { github = "TomWright/dasel", repository_id = 297615696, tag_prefix = "v" },
        },
        ["x86_64-linux"] = {
            default_version = "3.11.2",
            upstream = { github = "TomWright/dasel", repository_id = 297615696, tag_prefix = "v" },
        },
    },
    versions = {
        ["3.11.2"] = {
            digests = {
                ["aarch64-linux"] = "5471fe33b28c98efed2b1a13431ed24097785f56a24dc9fb15e37b1e266446e1",
                ["aarch64-macos"] = "5471fe33b28c98efed2b1a13431ed24097785f56a24dc9fb15e37b1e266446e1",
                ["x86_64-linux"] = "5471fe33b28c98efed2b1a13431ed24097785f56a24dc9fb15e37b1e266446e1",
            },
            revision = 3,
        },
    },
}
