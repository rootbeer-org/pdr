return {
    name = "pandoc",
    description = "Convert documents between markup formats",
    homepage = "https://pandoc.org",
    recipe_maintainers = { "tale" },
    default_license = "GPL-2.0-or-later",
    upstream = {
        github = "jgm/pandoc",
        repository_id = 571770,
        tag = "{version}",
    },
    prebuilt = {
        github = "jgm/pandoc",
        tag = "{version}",
        asset = "pandoc-{version}-{target}",
    },
    outputs = {
        bins = { "pandoc" },
        checks = {
            { "pandoc", "--version" },
            {
                "sh",
                "-c",
                [[set -e
printf '# Title\n\nhello *world*\n' | pandoc -f markdown -t html | grep -q '<em>world</em>'
printf '%s\n' ok]],
            },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            target = "linux-arm64.tar.gz",
            default_version = "3.14",
        },
        ["aarch64-macos"] = {
            target = "arm64-macOS.zip",
            default_version = "3.14",
            prebuilt = {
                github = "jgm/pandoc",
                tag = "{version}",
                asset = "pandoc-{version}-{target}",
                dependencies = {
                    { package = "7zip", kind = "build" },
                },
            },
        },
        ["x86_64-linux"] = {
            target = "linux-amd64.tar.gz",
            default_version = "3.14",
        },
    },
    versions = {
        ["3.14"] = {
            digests = {
                ["aarch64-linux"] = "c692f3d78a415741bbbac4cdbbbe26fa7edca1f43d2301b982fbf4009cc8cf7f",
                ["aarch64-macos"] = "58d6593884fec9d4424b641b92503c316d9c36decb2891ff8d73ae74dd3b6304",
                ["x86_64-linux"] = "c5f4720cdefb3f7bdc5d07202ef579feef0d1370773c873804dd8fdaa8c4f1b8",
            },
        },
    },
}
