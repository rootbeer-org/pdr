return {
    name = "rclone",
    description = "Sync files to and from cloud storage",
    homepage = "https://rclone.org/",
    recipe_maintainers = { "tale" },
    default_license = "MIT",
    upstream = {
        github = "rclone/rclone",
        repository_id = 17803236,
        tag = "v{version}",
    },
    source = {
        url = "https://codeload.github.com/rclone/rclone/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "rclone-{version}",
    },
    build = {
        backend = "go",
        go = {
            binaries = {
                rclone = ".",
            },
            variables = {
                ["github.com/rclone/rclone/fs.Version"] = "v{version}",
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
        bins = { "rclone" },
        checks = {
            { "rclone", "version" },
            { "rclone", "help", "backends" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "1.76.0",
        },
        ["aarch64-macos"] = {
            default_version = "1.76.0",
        },
        ["x86_64-linux"] = {
            default_version = "1.76.0",
        },
    },
    versions = {
        ["1.75.2"] = {
            digests = {
                ["aarch64-linux"] = "68afd7f68c84bd978966feae2116339aa7bf454b39c573910c462e87c3774d5a",
                ["aarch64-macos"] = "68afd7f68c84bd978966feae2116339aa7bf454b39c573910c462e87c3774d5a",
                ["x86_64-linux"] = "68afd7f68c84bd978966feae2116339aa7bf454b39c573910c462e87c3774d5a",
            },
        },
        ["1.76.0"] = {
            digests = {
                ["aarch64-linux"] = "8cb7e5d576fe9a3aef8b1a0785e2ffc6c1953f8ed109f42000b0b86718f6628b",
                ["aarch64-macos"] = "8cb7e5d576fe9a3aef8b1a0785e2ffc6c1953f8ed109f42000b0b86718f6628b",
                ["x86_64-linux"] = "8cb7e5d576fe9a3aef8b1a0785e2ffc6c1953f8ed109f42000b0b86718f6628b",
            },
        },
    },
}
