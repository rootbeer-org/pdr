local install = {
    "./install.sh",
    "--prefix={prefix}",
    "--components=rustc,cargo,rust-std-{target}",
    "--disable-ldconfig",
}

-- LLVM needs zlib, which glibc systems don't promise. rust-objcopy looks for
-- LLVM in the wrong directory, upstream too, and nothing here uses it.
local linux = {
    backend = "custom",
    dependencies = {
        { package = "zlib", version = "1.3.2", kind = "link_runtime" },
    },
    steps = {
        install = {
            install,
            { "ln", "-s", "{dependencies.zlib}/lib/libz.so.1", "{prefix}/lib/libz.so.1" },
            { "rm", "{prefix}/lib/rustlib/{target}/bin/rust-objcopy" },
        },
    },
}

return {
    name = "rust",
    description = "Build Rust programs with rustc and cargo",
    homepage = "https://www.rust-lang.org",
    recipe_maintainers = { "tale" },
    default_license = "MIT OR Apache-2.0",
    source = {
        url = "https://static.rust-lang.org/dist/rust-{version}-{target}.tar.xz",
        archive = "tar.xz",
        strip_prefix = "rust-{version}-{target}",
    },
    build = {
        backend = "custom",
        steps = {
            install = { install },
        },
    },
    outputs = {
        bins = { "cargo", "rustc" },
        checks = {
            { "cargo", "--version" },
            { "rustc", "--version" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            target = "aarch64-unknown-linux-gnu",
            default_version = "1.98.1",
            build = linux,
        },
        ["aarch64-macos"] = {
            target = "aarch64-apple-darwin",
            default_version = "1.98.1",
        },
        ["x86_64-linux"] = {
            target = "x86_64-unknown-linux-gnu",
            default_version = "1.98.1",
            build = linux,
        },
    },
    versions = {
        ["1.98.1"] = {
            digests = {
                ["aarch64-linux"] = "0b514a8cc1cbcd939bff0f151661fe58b6ea5c7a7f645a5098c69e32e8c1e0a2",
                ["aarch64-macos"] = "8f7c9de34c12c66dc55a6dbdd63b2b9645d4418775d4b975b0078a602f66e3e8",
                ["x86_64-linux"] = "5326b36c53de11d148c8f8dab6553a3d1006c2cfd32123683073fad3c302605b",
            },
        },
    },
}
