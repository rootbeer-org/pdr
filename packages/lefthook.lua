return {
    name = "lefthook",
    description = "Manage Git hooks",
    homepage = "https://lefthook.dev",
    recipe_maintainers = { "tale" },
    default_license = "MIT",
    upstream = {
        github = "evilmartians/lefthook",
        repository_id = 169250119,
        tag = "v{version}",
    },
    source = {
        url = "https://codeload.github.com/evilmartians/lefthook/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "lefthook-{version}",
    },
    build = {
        backend = "go",
        go = {
            binaries = {
                lefthook = ".",
            },
            tags = { "no_self_update" },
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
        bins = { "lefthook" },
        checks = {
            { "lefthook", "version" },
            { "lefthook", "help" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "2.1.15",
        },
        ["aarch64-macos"] = {
            default_version = "2.1.15",
        },
        ["x86_64-linux"] = {
            default_version = "2.1.15",
        },
    },
    versions = {
        ["2.1.12"] = {
            digests = {
                ["aarch64-linux"] = "c2e79ff53d31aaeb5a5765d118552a7b6f6e2667647347200386615ee4e88acf",
                ["aarch64-macos"] = "c2e79ff53d31aaeb5a5765d118552a7b6f6e2667647347200386615ee4e88acf",
                ["x86_64-linux"] = "c2e79ff53d31aaeb5a5765d118552a7b6f6e2667647347200386615ee4e88acf",
            },
            revision = 4,
        },
        ["2.1.14"] = {
            digests = {
                ["aarch64-linux"] = "b1a99784f93339b24a24731646d4489d2f3496c4f79c9dac449aea3d92fc2be0",
                ["aarch64-macos"] = "b1a99784f93339b24a24731646d4489d2f3496c4f79c9dac449aea3d92fc2be0",
                ["x86_64-linux"] = "b1a99784f93339b24a24731646d4489d2f3496c4f79c9dac449aea3d92fc2be0",
            },
            revision = 3,
        },
        ["2.1.15"] = {
            digests = {
                ["aarch64-linux"] = "8e2ea54882f1578eaac728004bfc8a68e5fdac839314e1ab7533d4b8ce7f944a",
                ["aarch64-macos"] = "8e2ea54882f1578eaac728004bfc8a68e5fdac839314e1ab7533d4b8ce7f944a",
                ["x86_64-linux"] = "8e2ea54882f1578eaac728004bfc8a68e5fdac839314e1ab7533d4b8ce7f944a",
            },
        },
    },
}
