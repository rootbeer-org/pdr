return {
    name = "tflint",
    description = "Lint Terraform configurations",
    homepage = "https://github.com/terraform-linters/tflint",
    recipe_maintainers = { "tale" },
    default_license = "MPL-2.0",
    upstream = {
        github = "terraform-linters/tflint",
        repository_id = 71487396,
        tag = "v{version}",
    },
    source = {
        url = "https://codeload.github.com/terraform-linters/tflint/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "tflint-{version}",
    },
    build = {
        backend = "go",
        go = {
            binaries = {
                tflint = ".",
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
        bins = { "tflint" },
        checks = {
            { "tflint", "--version" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "0.64.0",
        },
        ["aarch64-macos"] = {
            default_version = "0.64.0",
        },
        ["x86_64-linux"] = {
            default_version = "0.64.0",
        },
    },
    versions = {
        ["0.64.0"] = {
            digests = {
                ["aarch64-linux"] = "995a3816520ec99e2518b6cd845d003b8eddf8ca51322c2b7e9053f908326d15",
                ["aarch64-macos"] = "995a3816520ec99e2518b6cd845d003b8eddf8ca51322c2b7e9053f908326d15",
                ["x86_64-linux"] = "995a3816520ec99e2518b6cd845d003b8eddf8ca51322c2b7e9053f908326d15",
            },
            revision = 2,
        },
    },
}
