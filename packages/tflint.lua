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
            default_version = "0.66.0",
        },
        ["aarch64-macos"] = {
            default_version = "0.66.0",
        },
        ["x86_64-linux"] = {
            default_version = "0.66.0",
        },
    },
    versions = {
        ["0.65.0"] = {
            digests = {
                ["aarch64-linux"] = "1f10a6c1a70f67c60887d3948954613b6cad3b85b9d41390cb706e3ec1c83c9e",
                ["aarch64-macos"] = "1f10a6c1a70f67c60887d3948954613b6cad3b85b9d41390cb706e3ec1c83c9e",
                ["x86_64-linux"] = "1f10a6c1a70f67c60887d3948954613b6cad3b85b9d41390cb706e3ec1c83c9e",
            },
        },
        ["0.66.0"] = {
            digests = {
                ["aarch64-linux"] = "e67efd787f18bbcec641a9799f983bf1965a891fc77dc8cec5b9a24681daa7b6",
                ["aarch64-macos"] = "e67efd787f18bbcec641a9799f983bf1965a891fc77dc8cec5b9a24681daa7b6",
                ["x86_64-linux"] = "e67efd787f18bbcec641a9799f983bf1965a891fc77dc8cec5b9a24681daa7b6",
            },
        },
    },
}
