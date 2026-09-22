return {
    name = "zig",
    description = "Build software with the Zig programming language and toolchain",
    homepage = "https://ziglang.org",
    default_license = "NOASSERTION",
    prebuilt = {
        url = "https://ziglang.org/download/{version}/zig-{target}-{version}.tar.xz",
        install = { Archive = { format = "TarXz" } },
    },
    outputs = { bins = { "zig" }, checks = { { "zig", "version" } } },
    platforms = {
        ["aarch64-linux"] = { target = "aarch64-linux", default_version = "0.16.0" },
        ["aarch64-macos"] = { target = "aarch64-macos", default_version = "0.16.0" },
        ["x86_64-linux"] = { target = "x86_64-linux", default_version = "0.16.0" },
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
    },
}
