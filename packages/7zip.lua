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
            default_version = "26.05",
            outputs = {
                bins = { ["7zz"] = "7zzs" },
            },
        },
        ["aarch64-macos"] = {
            target = "mac",
            default_version = "26.05",
        },
        ["x86_64-linux"] = {
            target = "linux-x64",
            default_version = "26.05",
            outputs = {
                bins = { ["7zz"] = "7zzs" },
            },
        },
    },
    versions = {
        ["26.04"] = {
            digests = {
                ["aarch64-linux"] = "5b0ac3aa91c1e3499f011d6af69d7f6b4de3ef2f011d9e2ff44c58ebd04aa388",
                ["aarch64-macos"] = "bee04358cbcbc7106273cee0e8d72916db2696c48067a3538c34d8cd6fd16578",
                ["x86_64-linux"] = "fc0327ba27e89bd086cf426dff17d77de582953cdbbc10a6576540a06853ffcd",
            },
        },
        ["26.05"] = {
            digests = {
                ["aarch64-linux"] = "0b71f6cfc34669b3bf69f2347efd3429f77020665003a13b9cdc53b784270421",
                ["aarch64-macos"] = "12ef6830317743cfd3f0ab1724bde43fcc270d8b6d8564f8c12c2a2b7f993570",
                ["x86_64-linux"] = "22cf82fcc6eb7474f1d5bb4f02c0f8ebd573a718089d6833dc30f8350a3b232e",
            },
        },
    },
}
