return {
    schema = 2,
    name = "task",
    description = "Run commands from Taskfiles",
    default_version = "3.53.1",
    homepage = "https://github.com/go-task/task",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "go-task/task",
        repository_id = 83252983,
        tag_prefix = "v",
    },
    inputs = {
        source = {
            url = "https://codeload.github.com/go-task/task/tar.gz/refs/tags/{tag}",
            archive = "tar.gz",
            strip_prefix = "task-{version}",
        },
    },
    build = {
        backend = "go",
        go = {
            binaries = { task = "./cmd/task" },
        },
    },
    outputs = {
        bins = { "task" },
        checks = { { "task", "--version" }, { "task", "--help" } },
    },
    versions = {
        ["3.53.1"] = {
            revision = 3,
            inputs = {
                source = {
                    sha256 = "dd22395f4548ba58bc3adf83cb9ce33f1c5fad7e7c5f0a229bb2709af439fa9a",
                },
            },
        },
    },
}
