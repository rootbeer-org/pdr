return {
    name = "gmx",
    description = "Manage Ghostty terminal sessions",
    homepage = "https://github.com/nicosuave/gmx",
    default_license = "NOASSERTION",
    prebuilt = {
        github = "nicosuave/gmx",
        tag = "v{version}",
        asset = "gmx-{version}-macos-arm64.tar.gz",
    },
    outputs = {
        bins = { "gmx" },
        checks = { { "gmx", "--help" }, { "gmx", "completions", "zsh" } },
    },
    platforms = {
        ["aarch64-macos"] = {
            default_version = "0.1.10",
            upstream = { github = "nicosuave/gmx", repository_id = 1183476144, tag_prefix = "v" },
        },
    },
    versions = {
        ["0.1.10"] = {
            digests = {
                ["aarch64-macos"] = "ce4c56730d1c13f5b524acda641c1eda9bab91fdc7c33e468ea6d04d1a945de9",
            },
            revision = 2,
        },
    },
}
