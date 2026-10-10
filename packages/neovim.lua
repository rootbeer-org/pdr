return {
    name = "neovim",
    aliases = { "nvim" },
    description = "Edit text with an extensible Vim-based editor",
    homepage = "https://neovim.io",
    recipe_maintainers = { "tale" },
    default_license = "Apache-2.0 AND Vim",
    upstream = {
        github = "neovim/neovim",
        repository_id = 16408992,
        tag = "v{version}",
        exclude_tags = { "stable" },
    },
    prebuilt = {
        github = "neovim/neovim",
        tag = "v{version}",
        asset = "nvim-{target}.tar.gz",
    },
    outputs = {
        bins = { "nvim" },
        checks = {
            { "nvim", "--version" },
            {
                "nvim",
                "--headless",
                "-u",
                "NONE",
                "-i",
                "NONE",
                "-n",
                "-c",
                "lua assert(vim.fn.filereadable(vim.env.VIMRUNTIME .. '/syntax/syntax.vim') == 1)",
                "-c",
                "qa!",
            },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            target = "linux-arm64",
            default_version = "0.12.6",
        },
        ["aarch64-macos"] = {
            target = "macos-arm64",
            default_version = "0.12.6",
        },
        ["x86_64-linux"] = {
            target = "linux-x86_64",
            default_version = "0.12.6",
        },
    },
    versions = {
        ["0.12.5"] = {
            digests = {
                ["aarch64-linux"] = "1aa5ca085249580ae0f91eb14f27ec0919773ff2d99a163d03f3d6c21ac29725",
                ["aarch64-macos"] = "65fb000099e47ca1b762584c484cc833f40e30851a0ec450d4174e16317c1f9b",
                ["x86_64-linux"] = "bce0f56eda1f1b1db6eee8f4133d7a38813ea07933837dd1777411ca384c6875",
            },
            revision = 2,
        },
        ["0.12.6"] = {
            digests = {
                ["aarch64-linux"] = "8f1f64a0bdb97247034038c3823c6cbad5bdf9ecd5751b85494b71c3ee04c815",
                ["aarch64-macos"] = "1dbd148222b051ba6c307c4d17a318ed083df018a4f6a5a0ce46955ffc9ab87b",
                ["x86_64-linux"] = "474430d53e6264f6d6dd18db42d6dc9df3a1b56ca9e88a325bbf860e1a811d87",
            },
        },
    },
}
