return {
    name = "7zip",
    aliases = { "7zz", "sevenzip" },
    description = "Pack and unpack archives in many formats",
    homepage = "https://www.7-zip.org",
    recipe_maintainers = { "tale" },
    default_license = "LGPL-2.1-or-later AND BSD-3-Clause AND BSD-2-Clause AND LicenseRef-unRAR-restriction",
    upstream = {
        github = "ip7z/7zip",
        repository_id = 466446150,
        tag = "{version}",
    },
    prebuilt = {
        github = "ip7z/7zip",
        tag = "{version}",
        asset = "7z{major}{minor}-{target}.tar.xz",
    },
    outputs = {
        bins = { "7zz" },
        checks = {
            { "7zz", "i" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            target = "linux-arm64",
            default_version = "26.06",
            outputs = {
                bins = { ["7zz"] = "7zzs" },
            },
        },
        ["aarch64-macos"] = {
            target = "mac",
            default_version = "26.06",
        },
        ["x86_64-linux"] = {
            target = "linux-x64",
            default_version = "26.06",
            outputs = {
                bins = { ["7zz"] = "7zzs" },
            },
        },
    },
    versions = {
        ["26.05"] = {
            digests = {
                ["aarch64-linux"] = "0b71f6cfc34669b3bf69f2347efd3429f77020665003a13b9cdc53b784270421",
                ["aarch64-macos"] = "12ef6830317743cfd3f0ab1724bde43fcc270d8b6d8564f8c12c2a2b7f993570",
                ["x86_64-linux"] = "22cf82fcc6eb7474f1d5bb4f02c0f8ebd573a718089d6833dc30f8350a3b232e",
            },
        },
        ["26.06"] = {
            digests = {
                ["aarch64-linux"] = "edcc408aacce77da5223728f2eceb5e9f6dc713b8a9df934ad21e2a7f7560627",
                ["aarch64-macos"] = "b6f17920b4240940461dac8ef4009891881ac44d2a5ead625ede2ec8472185dd",
                ["x86_64-linux"] = "2b539cf067b2ad48e1baa5093dbaa8818b73542d1222a0ffde9dc5f2922ea62e",
            },
        },
    },
}
