return {
    name = "task",
    description = "Run commands from Taskfiles",
    homepage = "https://github.com/go-task/task",
    default_license = "MIT",
    source = {
        url = "https://codeload.github.com/go-task/task/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "task-{version}",
    },
    build = { backend = "go", go = { binaries = { task = "./cmd/task" } } },
    outputs = { bins = { "task" }, checks = { { "task", "--version" }, { "task", "--help" } } },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "3.53.1",
            upstream = { github = "go-task/task", repository_id = 83252983, tag_prefix = "v" },
        },
        ["aarch64-macos"] = {
            default_version = "3.53.1",
            upstream = { github = "go-task/task", repository_id = 83252983, tag_prefix = "v" },
        },
        ["x86_64-linux"] = {
            default_version = "3.53.1",
            upstream = { github = "go-task/task", repository_id = 83252983, tag_prefix = "v" },
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
