return {
    name = "croc",
    description = "Send files between computers securely",
    homepage = "https://github.com/schollz/croc",
    recipe_maintainers = { "tale" },
    default_license = "MIT",
    upstream = {
        github = "schollz/croc",
        repository_id = 107286889,
        tag = "v{version}",
    },
    source = {
        url = "https://codeload.github.com/schollz/croc/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "croc-{version}",
    },
    build = {
        backend = "go",
        go = {
            binaries = {
                croc = ".",
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
        bins = { "croc" },
        checks = {
            { "croc", "--version" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "11.6.4",
        },
        ["aarch64-macos"] = {
            default_version = "11.6.4",
        },
        ["x86_64-linux"] = {
            default_version = "11.6.4",
        },
    },
    versions = {
        ["11.5.5"] = {
            digests = {
                ["aarch64-linux"] = "1263e430cd62654438c9724072b7d5587e9930ca0e687d65b3dd8917ec0141df",
                ["aarch64-macos"] = "1263e430cd62654438c9724072b7d5587e9930ca0e687d65b3dd8917ec0141df",
                ["x86_64-linux"] = "1263e430cd62654438c9724072b7d5587e9930ca0e687d65b3dd8917ec0141df",
            },
        },
        ["11.6.4"] = {
            digests = {
                ["aarch64-linux"] = "e77f051d3470020d856b22240c2edb09fcd93b059611358157656d8833667722",
                ["aarch64-macos"] = "e77f051d3470020d856b22240c2edb09fcd93b059611358157656d8833667722",
                ["x86_64-linux"] = "e77f051d3470020d856b22240c2edb09fcd93b059611358157656d8833667722",
            },
        },
    },
}
