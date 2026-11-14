return {
    name = "yarn",
    description = "Fast, reliable JavaScript package manager",
    homepage = "https://classic.yarnpkg.com",
    recipe_maintainers = { "tale" },
    default_license = "BSD-2-Clause",
    upstream = {
        github = "yarnpkg/yarn",
        repository_id = 49970642,
        tag = "v{version}",
    },
    prebuilt = {
        github = "yarnpkg/yarn",
        tag = "v{version}",
        asset = "yarn-v{version}.tar.gz",
        install = {
            Archive = {
                format = "TarGz",
                strip_prefix = "yarn-v{version}",
            },
        },
        dependencies = {
            { package = "node", kind = "runtime" },
        },
        steps = {
            install = {
                { "rm", "-f", "bin/yarn.cmd", "bin/yarnpkg.cmd" },
                -- Upstream's launchers run whatever node is on PATH, so they are replaced
                -- with ones that run the catalog's.
                {
                    "sh",
                    "-c",
                    [[printf '#!/bin/sh\nexec "%s/bin/node" "%s/bin/yarn.js" "$@"\n' "$1" "$2" > bin/yarn && cp bin/yarn bin/yarnpkg && chmod 755 bin/yarn bin/yarnpkg]],
                    "sh",
                    "{dependencies.node}",
                    "{prefix}",
                },
            },
        },
    },
    outputs = {
        bins = { "yarn", "yarnpkg" },
        checks = {
            { "yarn", "--version" },
            { "yarnpkg", "--version" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "1.22.22",
        },
        ["aarch64-macos"] = {
            default_version = "1.22.22",
        },
        ["x86_64-linux"] = {
            default_version = "1.22.22",
        },
    },
    versions = {
        ["1.22.22"] = {
            digests = {
                ["aarch64-linux"] = "88268464199d1611fcf73ce9c0a6c4d44c7d5363682720d8506f6508addf36a0",
                ["aarch64-macos"] = "88268464199d1611fcf73ce9c0a6c4d44c7d5363682720d8506f6508addf36a0",
                ["x86_64-linux"] = "88268464199d1611fcf73ce9c0a6c4d44c7d5363682720d8506f6508addf36a0",
            },
        },
    },
}
