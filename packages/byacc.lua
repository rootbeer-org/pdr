return {
    name = "byacc",
    description = "Berkeley yacc parser generator",
    homepage = "https://invisible-island.net/byacc/",
    recipe_maintainers = { "tale" },
    default_license = "LicenseRef-Public-Domain",
    -- Released only on invisible-island.net, so versions are updated by hand.
    source = {
        url = "https://invisible-island.net/archives/byacc/byacc-{version}.tgz",
        archive = "tar.gz",
        strip_prefix = "byacc-{version}",
    },
    build = {
        backend = "autotools",
    },
    outputs = {
        bins = { "yacc" },
        checks = {
            { "yacc", "-V" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "20260126",
        },
        ["aarch64-macos"] = {
            default_version = "20260126",
        },
        ["x86_64-linux"] = {
            default_version = "20260126",
        },
    },
    versions = {
        ["20260126"] = {
            digests = {
                ["aarch64-linux"] = "b618c5fb44c2f5f048843db90f7d1b24f78f47b07913c8c7ba8c942d3eb24b00",
                ["aarch64-macos"] = "b618c5fb44c2f5f048843db90f7d1b24f78f47b07913c8c7ba8c942d3eb24b00",
                ["x86_64-linux"] = "b618c5fb44c2f5f048843db90f7d1b24f78f47b07913c8c7ba8c942d3eb24b00",
            },
        },
    },
}
