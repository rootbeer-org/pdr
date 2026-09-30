return {
    name = "ko",
    description = "Build and deploy Go applications as container images",
    homepage = "https://ko.build/",
    recipe_maintainers = { "tale" },
    default_license = "Apache-2.0",
    upstream = {
        github = "ko-build/ko",
        repository_id = 177010499,
        tag = "v{version}",
    },
    source = {
        url = "https://codeload.github.com/ko-build/ko/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "ko-{version}",
    },
    build = {
        backend = "go",
        go = {
            binaries = {
                ko = ".",
            },
            variables = {
                ["github.com/google/ko/pkg/commands.Version"] = "{version}",
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
        bins = { "ko" },
        checks = {
            { "ko", "version" },
            { "ko", "build", "--help" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "0.19.1",
        },
        ["aarch64-macos"] = {
            default_version = "0.19.1",
        },
        ["x86_64-linux"] = {
            default_version = "0.19.1",
        },
    },
    versions = {
        ["0.19.1"] = {
            digests = {
                ["aarch64-linux"] = "7accc1f4ad074285086573b084387bef5871872ef16e3f292d5818a99e4feeae",
                ["aarch64-macos"] = "7accc1f4ad074285086573b084387bef5871872ef16e3f292d5818a99e4feeae",
                ["x86_64-linux"] = "7accc1f4ad074285086573b084387bef5871872ef16e3f292d5818a99e4feeae",
            },
            revision = 2,
        },
    },
}
