return {
    name = "direnv",
    description = "Load and unload environment variables per directory",
    homepage = "https://direnv.net/",
    recipe_maintainers = { "tale" },
    default_license = "MIT",
    upstream = {
        github = "direnv/direnv",
        repository_id = 1219305,
        tag = "v{version}",
    },
    source = {
        url = "https://codeload.github.com/direnv/direnv/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "direnv-{version}",
    },
    build = {
        backend = "go",
        go = {
            binaries = {
                direnv = ".",
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
        bins = { "direnv" },
        checks = {
            { "direnv", "version" },
            { "direnv", "stdlib" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "2.38.2",
        },
        ["aarch64-macos"] = {
            default_version = "2.38.2",
        },
        ["x86_64-linux"] = {
            default_version = "2.38.2",
        },
    },
    versions = {
        ["2.37.1"] = {
            digests = {
                ["aarch64-linux"] = "4142fbb661f3218913fac08d327c415e87b3e66bd0953185294ff8f3228ead24",
                ["aarch64-macos"] = "4142fbb661f3218913fac08d327c415e87b3e66bd0953185294ff8f3228ead24",
                ["x86_64-linux"] = "4142fbb661f3218913fac08d327c415e87b3e66bd0953185294ff8f3228ead24",
            },
            revision = 2,
        },
        ["2.38.2"] = {
            digests = {
                ["aarch64-linux"] = "02c5e873e9ebcf2798513f7dd3775e5b8aace99bfa1e0c1b93091b6d4cbcaffb",
                ["aarch64-macos"] = "02c5e873e9ebcf2798513f7dd3775e5b8aace99bfa1e0c1b93091b6d4cbcaffb",
                ["x86_64-linux"] = "02c5e873e9ebcf2798513f7dd3775e5b8aace99bfa1e0c1b93091b6d4cbcaffb",
            },
        },
    },
}
