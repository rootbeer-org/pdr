return {
    name = "neovim",
    aliases = { "nvim" },
    description = "Edit text with Neovim",
    homepage = "https://github.com/neovim/neovim",
    default_license = "NOASSERTION",
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
            default_version = "0.12.5",
        },
        ["aarch64-macos"] = {
            target = "macos-arm64",
            default_version = "0.12.5",
        },
        ["x86_64-linux"] = {
            target = "linux-x86_64",
            default_version = "0.12.5",
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
    },
}
