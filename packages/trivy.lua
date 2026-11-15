return {
    name = "trivy",
    description = "Find vulnerabilities and configuration issues",
    homepage = "https://trivy.dev",
    recipe_maintainers = { "tale" },
    default_license = "Apache-2.0",
    upstream = {
        github = "aquasecurity/trivy",
        repository_id = 180687624,
        tag = "v{version}",
    },
    source = {
        url = "https://codeload.github.com/aquasecurity/trivy/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "trivy-{version}",
        patches = {
            "json-err-unsupported.patch",
        },
    },
    build = {
        backend = "go",
        go = {
            binaries = {
                trivy = "./cmd/trivy",
            },
            experiments = { "jsonv2" },
            variables = {
                ["github.com/aquasecurity/trivy/pkg/version/app.ver"] = "{version}",
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
        bins = { "trivy" },
        checks = {
            { "trivy", "--version" },
            { "trivy", "filesystem", "--help" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "0.74.0",
        },
        ["aarch64-macos"] = {
            default_version = "0.74.0",
        },
        ["x86_64-linux"] = {
            default_version = "0.74.0",
        },
    },
    versions = {
        ["0.74.0"] = {
            digests = {
                ["aarch64-linux"] = "04268af574690b84bc3474a5f19e002cd6da3e16899fac9fd39c6e84e7843940",
                ["aarch64-macos"] = "04268af574690b84bc3474a5f19e002cd6da3e16899fac9fd39c6e84e7843940",
                ["x86_64-linux"] = "04268af574690b84bc3474a5f19e002cd6da3e16899fac9fd39c6e84e7843940",
            },
            revision = 4,
        },
    },
}
