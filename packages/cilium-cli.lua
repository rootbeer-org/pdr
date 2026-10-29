return {
    name = "cilium-cli",
    description = "Install, manage, and troubleshoot Cilium clusters",
    homepage = "https://github.com/cilium/cilium-cli",
    recipe_maintainers = { "tale" },
    default_license = "Apache-2.0",
    upstream = {
        github = "cilium/cilium-cli",
        repository_id = 323610158,
        tag = "v{version}",
    },
    source = {
        url = "https://codeload.github.com/cilium/cilium-cli/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "cilium-cli-{version}",
    },
    build = {
        backend = "go",
        go = {
            binaries = {
                cilium = "./cmd/cilium",
            },
            variables = {
                ["github.com/cilium/cilium/cilium-cli/defaults.CLIVersion"] = "v{version}",
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
        bins = { "cilium" },
        checks = {
            { "cilium", "version", "--client" },
            { "cilium", "install", "--help" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "0.20.2",
        },
        ["aarch64-macos"] = {
            default_version = "0.20.2",
        },
        ["x86_64-linux"] = {
            default_version = "0.20.2",
        },
    },
    versions = {
        ["0.20.1"] = {
            digests = {
                ["aarch64-linux"] = "3c9c6a261baa52ee3365c41e6501eef956d046133360685ab2b5fc00bad7b683",
                ["aarch64-macos"] = "3c9c6a261baa52ee3365c41e6501eef956d046133360685ab2b5fc00bad7b683",
                ["x86_64-linux"] = "3c9c6a261baa52ee3365c41e6501eef956d046133360685ab2b5fc00bad7b683",
            },
            revision = 2,
        },
        ["0.20.2"] = {
            digests = {
                ["aarch64-linux"] = "78d4442defa00b91538dd784f96fbc957d48fb3622f9e784af9667a2974f124c",
                ["aarch64-macos"] = "78d4442defa00b91538dd784f96fbc957d48fb3622f9e784af9667a2974f124c",
                ["x86_64-linux"] = "78d4442defa00b91538dd784f96fbc957d48fb3622f9e784af9667a2974f124c",
            },
        },
    },
}
