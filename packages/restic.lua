return {
    name = "restic",
    description = "Back up data with deduplication and encryption",
    homepage = "https://restic.net/",
    recipe_maintainers = { "tale" },
    default_license = "BSD-2-Clause",
    upstream = {
        github = "restic/restic",
        repository_id = 19205896,
        tag = "v{version}",
    },
    source = {
        url = "https://codeload.github.com/restic/restic/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "restic-{version}",
    },
    build = {
        backend = "go",
        go = {
            binaries = {
                restic = "./cmd/restic",
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
        bins = { "restic" },
        checks = {
            { "restic", "version" },
            { "restic", "init", "--help" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "0.20.0",
        },
        ["aarch64-macos"] = {
            default_version = "0.20.0",
        },
        ["x86_64-linux"] = {
            default_version = "0.20.0",
        },
    },
    versions = {
        ["0.19.1"] = {
            digests = {
                ["aarch64-linux"] = "bb9b1a19040744d26d8a79be029d4e6b189c45ccc9d8831d7fe367d3c33df725",
                ["aarch64-macos"] = "bb9b1a19040744d26d8a79be029d4e6b189c45ccc9d8831d7fe367d3c33df725",
                ["x86_64-linux"] = "bb9b1a19040744d26d8a79be029d4e6b189c45ccc9d8831d7fe367d3c33df725",
            },
            revision = 2,
        },
        ["0.20.0"] = {
            digests = {
                ["aarch64-linux"] = "7def5bbe05e62640f7b030b865b6f304701fd876f7836f5a6a603b56e1f4e30a",
                ["aarch64-macos"] = "7def5bbe05e62640f7b030b865b6f304701fd876f7836f5a6a603b56e1f4e30a",
                ["x86_64-linux"] = "7def5bbe05e62640f7b030b865b6f304701fd876f7836f5a6a603b56e1f4e30a",
            },
        },
    },
}
