return {
    name = "zig",
    description = "Build software with the Zig toolchain",
    homepage = "https://ziglang.org",
    recipe_maintainers = { "tale" },
    default_license = "MIT",
    upstream = {
        git = "https://codeberg.org/ziglang/zig.git",
    },
    prebuilt = {
        url = "https://ziglang.org/download/{version}/zig-{target}-{version}.tar.xz",
        install = {
            Archive = {
                format = "TarXz",
                strip_prefix = nil,
            },
        },
    },
    outputs = {
        bins = { "zig" },
        checks = {
            { "zig", "version" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            target = "aarch64-linux",
            default_version = "0.17.0",
        },
        ["aarch64-macos"] = {
            target = "aarch64-macos",
            default_version = "0.17.0",
        },
        ["x86_64-linux"] = {
            target = "x86_64-linux",
            default_version = "0.17.0",
        },
    },
    versions = {
        ["0.16.0"] = {
            digests = {
                ["aarch64-linux"] = "ea4b09bfb22ec6f6c6ceac57ab63efb6b46e17ab08d21f69f3a48b38e1534f17",
                ["aarch64-macos"] = "b23d70deaa879b5c2d486ed3316f7eaa53e84acf6fc9cc747de152450d401489",
                ["x86_64-linux"] = "70e49664a74374b48b51e6f3fdfbf437f6395d42509050588bd49abe52ba3d00",
            },
            revision = 2,
        },
        ["0.17.0"] = {
            digests = {
                ["aarch64-linux"] = "9e8d11661d4ae3bd57702a3832781e23ad151dde5798e16a5ccd503f65234ff8",
                ["aarch64-macos"] = "b607e9b9234790a008116ae5bdb71c6243b84b9fb42a53a9e70fde41c06c536a",
                ["x86_64-linux"] = "1cbe9df9f27e6b78d14ccbca43b6703a404ef79ef1c463de901d7f088d4e2026",
            },
        },
    },
}
