return {
    name = "crane",
    description = "Interact with remote container images and registries",
    homepage = "https://github.com/google/go-containerregistry",
    recipe_maintainers = { "tale" },
    default_license = "Apache-2.0",
    upstream = {
        github = "google/go-containerregistry",
        repository_id = 125253663,
        tag = "v{version}",
    },
    source = {
        url = "https://codeload.github.com/google/go-containerregistry/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "go-containerregistry-{version}",
    },
    build = {
        backend = "go",
        go = {
            binaries = {
                crane = "./cmd/crane",
            },
            variables = {
                ["github.com/google/go-containerregistry/cmd/crane/cmd.Version"] = "{version}",
                ["github.com/google/go-containerregistry/pkg/v1/remote/transport.Version"] = "{version}",
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
        bins = { "crane" },
        checks = {
            { "crane", "version" },
            { "crane", "digest", "--help" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "0.22.1",
        },
        ["aarch64-macos"] = {
            default_version = "0.22.1",
        },
        ["x86_64-linux"] = {
            default_version = "0.22.1",
        },
    },
    versions = {
        ["0.22.1"] = {
            digests = {
                ["aarch64-linux"] = "a52cc7d61f8b2f043b7f0be1febecead5fceb791543c4790d699440f12d6b370",
                ["aarch64-macos"] = "a52cc7d61f8b2f043b7f0be1febecead5fceb791543c4790d699440f12d6b370",
                ["x86_64-linux"] = "a52cc7d61f8b2f043b7f0be1febecead5fceb791543c4790d699440f12d6b370",
            },
            revision = 2,
        },
    },
}
