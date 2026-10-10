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
                version = "1.27.1",
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
            default_version = "1.75.2",
        },
        ["aarch64-macos"] = {
            default_version = "1.75.2",
        },
        ["x86_64-linux"] = {
            default_version = "1.75.2",
        },
    },
    versions = {
        ["1.75.1"] = {
            digests = {
                ["aarch64-linux"] = "fcc9351ab3976c73b4824cf7919f98f911f2442a606e2910fc2bd562111da220",
                ["aarch64-macos"] = "fcc9351ab3976c73b4824cf7919f98f911f2442a606e2910fc2bd562111da220",
                ["x86_64-linux"] = "fcc9351ab3976c73b4824cf7919f98f911f2442a606e2910fc2bd562111da220",
            },
            revision = 2,
        },
        ["1.75.2"] = {
            digests = {
                ["aarch64-linux"] = "68afd7f68c84bd978966feae2116339aa7bf454b39c573910c462e87c3774d5a",
                ["aarch64-macos"] = "68afd7f68c84bd978966feae2116339aa7bf454b39c573910c462e87c3774d5a",
                ["x86_64-linux"] = "68afd7f68c84bd978966feae2116339aa7bf454b39c573910c462e87c3774d5a",
            },
        },
    },
}
