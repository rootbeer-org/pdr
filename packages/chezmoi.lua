return {
    name = "chezmoi",
    description = "Manage dotfiles across machines",
    homepage = "https://www.chezmoi.io/",
    recipe_maintainers = { "tale" },
    default_license = "MIT",
    upstream = {
        github = "twpayne/chezmoi",
        repository_id = 157245200,
        tag = "v{version}",
    },
    source = {
        url = "https://codeload.github.com/twpayne/chezmoi/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "chezmoi-{version}",
    },
    build = {
        backend = "go",
        go = {
            binaries = {
                chezmoi = ".",
            },
            variables = {
                ["main.version"] = "{version}",
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
        bins = { "chezmoi" },
        checks = {
            { "chezmoi", "--version" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "2.74.2",
        },
        ["aarch64-macos"] = {
            default_version = "2.74.2",
        },
        ["x86_64-linux"] = {
            default_version = "2.74.2",
        },
    },
    versions = {
        ["2.74.1"] = {
            digests = {
                ["aarch64-linux"] = "818984475f981bb79d516f144386d0f4aeb03f035bca3c6d6287da2bdae61829",
                ["aarch64-macos"] = "818984475f981bb79d516f144386d0f4aeb03f035bca3c6d6287da2bdae61829",
                ["x86_64-linux"] = "818984475f981bb79d516f144386d0f4aeb03f035bca3c6d6287da2bdae61829",
            },
        },
        ["2.74.2"] = {
            digests = {
                ["aarch64-linux"] = "2e300922c65411f90b1749bb59c70814a5d8b376818a2e8ad727ddd75816ddbb",
                ["aarch64-macos"] = "2e300922c65411f90b1749bb59c70814a5d8b376818a2e8ad727ddd75816ddbb",
                ["x86_64-linux"] = "2e300922c65411f90b1749bb59c70814a5d8b376818a2e8ad727ddd75816ddbb",
            },
        },
    },
}
