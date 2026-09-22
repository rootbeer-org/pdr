return {
    name = "monstar",
    description = "Run a CPU-rendered Wayland terminal",
    homepage = "https://github.com/rockorager/monstar",
    default_license = "MIT",
    prebuilt = {
        github = "rockorager/monstar",
        tag = "v{version}",
        asset = "monstar-{version}-x86_64-linux.tar.gz",
    },
    outputs = {
        bins = { "monstar" },
        checks = { { "monstar", "--version" }, { "monstar", "--help" }, { "monstar", "--bench" } },
    },
    platforms = {
        ["x86_64-linux"] = {
            default_version = "1.0.1",
            upstream = {
                github = "rockorager/monstar",
                repository_id = 1287637631,
                tag_prefix = "v",
            },
        },
    },
    versions = {
        ["1.0.1"] = {
            digests = {
                ["x86_64-linux"] = "271fcf68d3e67350327eba43c061f0bd904ec4e5a7049ee60d7c9e79991d4bbc",
            },
        },
    },
}
