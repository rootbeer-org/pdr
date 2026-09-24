return {
    name = "typst",
    description = "Typeset documents with a markup-based language",
    homepage = "https://typst.app",
    recipe_maintainers = { "tale" },
    default_license = "Apache-2.0",
    upstream = {
        github = "typst/typst",
        repository_id = 210702427,
        tag = "v{version}",
    },
    prebuilt = {
        github = "typst/typst",
        tag = "v{version}",
        asset = "typst-{target}.tar.xz",
    },
    outputs = {
        bins = { "typst" },
        checks = {
            { "typst", "--version" },
            { "typst", "fonts", "--ignore-system-fonts" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            target = "aarch64-unknown-linux-musl",
            default_version = "0.15.1",
        },
        ["aarch64-macos"] = {
            target = "aarch64-apple-darwin",
            default_version = "0.15.1",
        },
        ["x86_64-linux"] = {
            target = "x86_64-unknown-linux-musl",
            default_version = "0.15.1",
        },
    },
    versions = {
        ["0.15.1"] = {
            digests = {
                ["aarch64-linux"] = "5aa8d74a3d906e60ea12a66ac2f37f8eef1b14cbad7182a745e393a10c23dcee",
                ["aarch64-macos"] = "48f62ed034aa3a7978309579ac6ca00045e2ef0da73114e8af27cfd8e74dc05a",
                ["x86_64-linux"] = "a6d077d0a95eed5a2eba715b2dae06be954f624ccbf85758a03f389ded33118c",
            },
            revision = 2,
        },
    },
}
