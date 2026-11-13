return {
    name = "lz4",
    description = "Fast compression library and command-line tools",
    homepage = "https://lz4.org/",
    recipe_maintainers = { "tale" },
    default_license = "BSD-2-Clause AND GPL-2.0-or-later",
    upstream = {
        github = "lz4/lz4",
        repository_id = 18106269,
        tag = "v{version}",
    },
    source = {
        url = "https://github.com/lz4/lz4/releases/download/{tag}/lz4-{version}.tar.gz",
        archive = "tar.gz",
        strip_prefix = "lz4-{version}",
    },
    build = {
        backend = "custom",
        -- The tests pipe into diff, which buffers stdin in /tmp.
        allow = { "tmp" },
        libraries = { "lib/liblz4.a", "lib/liblz4.{shared_extension}" },
        steps = {
            configure = {
                {
                    "sed",
                    "-i.bak",
                    "-e",
                    "s/if start != 0 and end != 0:/if end != 0:/",
                    "tests/cli/test-lz4-list.py",
                },
            },
            build = {
                { "make", "-j{jobs}", "PREFIX={prefix}" },
            },
            check = {
                { "make", "PREFIX={prefix}", "test" },
            },
            install = {
                { "make", "PREFIX={prefix}", "install" },
            },
        },
    },
    outputs = {
        bins = { "lz4", "lz4c", "lz4cat", "unlz4" },
        checks = {
            { "lz4", "--version" },
            { "lz4c", "--version" },
            { "lz4cat", "--version" },
            { "unlz4", "--version" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "1.11.1",
        },
        ["aarch64-macos"] = {
            default_version = "1.11.1",
        },
        ["x86_64-linux"] = {
            default_version = "1.11.1",
        },
    },
    versions = {
        ["1.11.0"] = {
            digests = {
                ["aarch64-linux"] = "247e5fa64da5f7b75ee3dd3bed484076396c9ebe8254d9ccf693eb62800c5e26",
                ["aarch64-macos"] = "247e5fa64da5f7b75ee3dd3bed484076396c9ebe8254d9ccf693eb62800c5e26",
                ["x86_64-linux"] = "247e5fa64da5f7b75ee3dd3bed484076396c9ebe8254d9ccf693eb62800c5e26",
            },
        },
        ["1.11.1"] = {
            digests = {
                ["aarch64-linux"] = "683fed08a844ad012196381e40badf80c0bbe4962959761416d41c9e67d77ec7",
                ["aarch64-macos"] = "683fed08a844ad012196381e40badf80c0bbe4962959761416d41c9e67d77ec7",
                ["x86_64-linux"] = "683fed08a844ad012196381e40badf80c0bbe4962959761416d41c9e67d77ec7",
            },
        },
    },
}
