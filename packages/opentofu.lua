return {
    name = "opentofu",
    description = "Provision infrastructure from configuration files",
    homepage = "https://opentofu.org",
    recipe_maintainers = { "tale" },
    default_license = "MPL-2.0",
    upstream = {
        github = "opentofu/opentofu",
        repository_id = 679421146,
        tag = "v{version}",
    },
    source = {
        url = "https://codeload.github.com/opentofu/opentofu/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "opentofu-{version}",
    },
    build = {
        backend = "go",
        go = {
            binaries = {
                tofu = "./cmd/tofu",
            },
            variables = {
                -- Without this the binary reports itself as a -dev prerelease.
                ["github.com/opentofu/opentofu/version.dev"] = "no",
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
        bins = { "tofu" },
        checks = {
            {
                "sh",
                "-c",
                "tofu version | head -n 1 | grep -qx 'OpenTofu v[0-9.]*' && printf '%s\\n' ok",
            },
            {
                "sh",
                "-c",
                [[set -e
printf 'variable "x" {default=1}\n' | tofu fmt - | grep -q 'default = 1'
printf '%s\n' ok]],
            },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "1.13.9",
        },
        ["aarch64-macos"] = {
            default_version = "1.13.9",
        },
        ["x86_64-linux"] = {
            default_version = "1.13.9",
        },
    },
    versions = {
        ["1.13.9"] = {
            digests = {
                ["aarch64-linux"] = "acb73b84a4f32150f8a097841fe2c48a2e13d35656ddab4851f46a4d681cdde4",
                ["aarch64-macos"] = "acb73b84a4f32150f8a097841fe2c48a2e13d35656ddab4851f46a4d681cdde4",
                ["x86_64-linux"] = "acb73b84a4f32150f8a097841fe2c48a2e13d35656ddab4851f46a4d681cdde4",
            },
        },
    },
}
