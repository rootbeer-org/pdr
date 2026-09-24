return {
    name = "doggo",
    description = "Look up DNS records from the terminal",
    homepage = "https://doggo.mrkaran.dev/",
    recipe_maintainers = { "tale" },
    default_license = "GPL-3.0-only",
    upstream = {
        github = "mr-karan/doggo",
        repository_id = 319848237,
        tag = "v{version}",
    },
    source = {
        url = "https://codeload.github.com/mr-karan/doggo/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "doggo-{version}",
    },
    build = {
        backend = "go",
        go = {
            binaries = {
                doggo = "./cmd/doggo",
            },
            variables = {
                ["main.buildVersion"] = "v{version}",
            },
        },
    },
    outputs = {
        bins = { "doggo" },
        checks = {
            { "doggo", "--version" },
            { "doggo", "--help" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "1.4.0",
        },
        ["aarch64-macos"] = {
            default_version = "1.4.0",
        },
        ["x86_64-linux"] = {
            default_version = "1.4.0",
        },
    },
    versions = {
        ["1.4.0"] = {
            digests = {
                ["aarch64-linux"] = "e0d043aa34fb8daa44df07558fd32fe2686eba6644d5f6834edbc8a789d42e1d",
                ["aarch64-macos"] = "e0d043aa34fb8daa44df07558fd32fe2686eba6644d5f6834edbc8a789d42e1d",
                ["x86_64-linux"] = "e0d043aa34fb8daa44df07558fd32fe2686eba6644d5f6834edbc8a789d42e1d",
            },
            revision = 3,
        },
    },
}
