return {
    name = "navi",
    description = "Browse interactive command-line cheatsheets",
    homepage = "https://github.com/denisidoro/navi",
    recipe_maintainers = { "tale" },
    default_license = "Apache-2.0",
    upstream = {
        github = "denisidoro/navi",
        repository_id = 209799228,
        tag = "v{version}",
    },
    source = {
        url = "https://codeload.github.com/denisidoro/navi/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "navi-{version}",
    },
    build = {
        backend = "rust",
        rust = {
            packages = { "navi" },
        },
    },
    outputs = {
        bins = { "navi" },
        checks = {
            { "navi", "--version" },
            { "navi", "info", "cheats-example" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "2.24.0",
        },
        ["aarch64-macos"] = {
            default_version = "2.24.0",
        },
        ["x86_64-linux"] = {
            default_version = "2.24.0",
        },
    },
    versions = {
        ["2.24.0"] = {
            digests = {
                ["aarch64-linux"] = "4c10f47c306826255b07483b7e94eed8ffc1401555c52434a56246295d3f2728",
                ["aarch64-macos"] = "4c10f47c306826255b07483b7e94eed8ffc1401555c52434a56246295d3f2728",
                ["x86_64-linux"] = "4c10f47c306826255b07483b7e94eed8ffc1401555c52434a56246295d3f2728",
            },
        },
    },
}
