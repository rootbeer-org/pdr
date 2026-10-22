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
        dependencies = {
            {
                package = "go",
                kind = "build",
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
            default_version = "1.4.2",
        },
        ["aarch64-macos"] = {
            default_version = "1.4.2",
        },
        ["x86_64-linux"] = {
            default_version = "1.4.2",
        },
    },
    versions = {
        ["1.4.0"] = {
            digests = {
                ["aarch64-linux"] = "e0d043aa34fb8daa44df07558fd32fe2686eba6644d5f6834edbc8a789d42e1d",
                ["aarch64-macos"] = "e0d043aa34fb8daa44df07558fd32fe2686eba6644d5f6834edbc8a789d42e1d",
                ["x86_64-linux"] = "e0d043aa34fb8daa44df07558fd32fe2686eba6644d5f6834edbc8a789d42e1d",
            },
            revision = 4,
        },
        ["1.4.2"] = {
            digests = {
                ["aarch64-linux"] = "9c5d1d0d800f72e80d35f6731fa3a80435f5a1af08af900a6b77142600e19395",
                ["aarch64-macos"] = "9c5d1d0d800f72e80d35f6731fa3a80435f5a1af08af900a6b77142600e19395",
                ["x86_64-linux"] = "9c5d1d0d800f72e80d35f6731fa3a80435f5a1af08af900a6b77142600e19395",
            },
        },
    },
}
