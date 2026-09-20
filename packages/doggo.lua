return {
    schema = 2,
    name = "doggo",
    description = "Look up DNS records from the terminal",
    default_version = "1.4.0",
    homepage = "https://github.com/mr-karan/doggo",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "mr-karan/doggo",
        repository_id = 319848237,
        tag_prefix = "v",
    },
    inputs = {
        source = {
            url = "https://codeload.github.com/mr-karan/doggo/tar.gz/refs/tags/{tag}",
            archive = "tar.gz",
            strip_prefix = "doggo-{version}",
        },
    },
    build = {
        backend = "go",
        go = {
            binaries = { doggo = "./cmd/doggo" },
            variables = { ["main.buildVersion"] = "v{version}" },
        },
    },
    outputs = {
        bins = { "doggo" },
        checks = { { "doggo", "--version" }, { "doggo", "--help" } },
    },
    versions = {
        ["1.4.0"] = {
            revision = 3,
            inputs = {
                source = {
                    sha256 = "e0d043aa34fb8daa44df07558fd32fe2686eba6644d5f6834edbc8a789d42e1d",
                },
            },
        },
    },
}
