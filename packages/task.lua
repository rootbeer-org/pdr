return {
    name = "task",
    aliases = { "go-task" },
    description = "Run commands from Taskfiles",
    homepage = "https://taskfile.dev",
    recipe_maintainers = { "tale" },
    default_license = "MIT",
    upstream = {
        github = "go-task/task",
        repository_id = 83252983,
        tag = "v{version}",
    },
    source = {
        url = "https://codeload.github.com/go-task/task/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "task-{version}",
    },
    build = {
        backend = "go",
        go = {
            binaries = {
                task = "./cmd/task",
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
        bins = { "task" },
        checks = {
            { "task", "--version" },
            { "task", "--help" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "3.54.0",
        },
        ["aarch64-macos"] = {
            default_version = "3.54.0",
        },
        ["x86_64-linux"] = {
            default_version = "3.54.0",
        },
    },
    versions = {
        ["3.53.1"] = {
            digests = {
                ["aarch64-linux"] = "dd22395f4548ba58bc3adf83cb9ce33f1c5fad7e7c5f0a229bb2709af439fa9a",
                ["aarch64-macos"] = "dd22395f4548ba58bc3adf83cb9ce33f1c5fad7e7c5f0a229bb2709af439fa9a",
                ["x86_64-linux"] = "dd22395f4548ba58bc3adf83cb9ce33f1c5fad7e7c5f0a229bb2709af439fa9a",
            },
            revision = 4,
        },
        ["3.54.0"] = {
            digests = {
                ["aarch64-linux"] = "d9e92770c2c18f135701431d04bb24fb77b5f13464699683892bdfc0b26f2eb8",
                ["aarch64-macos"] = "d9e92770c2c18f135701431d04bb24fb77b5f13464699683892bdfc0b26f2eb8",
                ["x86_64-linux"] = "d9e92770c2c18f135701431d04bb24fb77b5f13464699683892bdfc0b26f2eb8",
            },
        },
    },
}
