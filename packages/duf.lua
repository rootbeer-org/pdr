return {
    name = "duf",
    description = "Inspect filesystem disk usage",
    homepage = "https://github.com/muesli/duf",
    default_license = "NOASSERTION",
    source = {
        url = "https://codeload.github.com/muesli/duf/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "duf-{version}",
    },
    build = {
        backend = "go",
        go = { binaries = { duf = "." }, variables = { ["main.Version"] = "{version}" } },
    },
    outputs = { bins = { "duf" }, checks = { { "duf", "--version" } } },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "0.9.1",
            upstream = { github = "muesli/duf", repository_id = 297165998, tag_prefix = "v" },
        },
        ["aarch64-macos"] = {
            default_version = "0.9.1",
            upstream = { github = "muesli/duf", repository_id = 297165998, tag_prefix = "v" },
        },
        ["x86_64-linux"] = {
            default_version = "0.9.1",
            upstream = { github = "muesli/duf", repository_id = 297165998, tag_prefix = "v" },
        },
    },
    versions = {
        ["0.9.1"] = {
            digests = {
                ["aarch64-linux"] = "1334d8c1a7957d0aceebe651e3af9e1c1e0c6f298f1feb39643dd0bd8ad1e955",
                ["aarch64-macos"] = "1334d8c1a7957d0aceebe651e3af9e1c1e0c6f298f1feb39643dd0bd8ad1e955",
                ["x86_64-linux"] = "1334d8c1a7957d0aceebe651e3af9e1c1e0c6f298f1feb39643dd0bd8ad1e955",
            },
            revision = 3,
        },
    },
}
