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
            default_version = "3.53.1",
        },
        ["aarch64-macos"] = {
            default_version = "3.53.1",
        },
        ["x86_64-linux"] = {
            default_version = "3.53.1",
        },
    },
    versions = {
        ["3.53.1"] = {
            digests = {
                ["aarch64-linux"] = "dd22395f4548ba58bc3adf83cb9ce33f1c5fad7e7c5f0a229bb2709af439fa9a",
                ["aarch64-macos"] = "dd22395f4548ba58bc3adf83cb9ce33f1c5fad7e7c5f0a229bb2709af439fa9a",
                ["x86_64-linux"] = "dd22395f4548ba58bc3adf83cb9ce33f1c5fad7e7c5f0a229bb2709af439fa9a",
            },
            revision = 3,
        },
    },
}
