return {
    name = "libvpx",
    description = "VP8 and VP9 video codec library",
    homepage = "https://www.webmproject.org/",
    recipe_maintainers = { "tale" },
    default_license = "BSD-3-Clause",
    upstream = {
        github = "webmproject/libvpx",
        repository_id = 22927608,
        tag = "v{version}",
    },
    source = {
        url = "https://github.com/webmproject/libvpx/archive/refs/tags/{tag}.tar.gz",
        archive = "tar.gz",
        strip_prefix = "libvpx-{version}",
    },
    build = {
        backend = "custom",
        dependencies = {
            {
                package = "nasm",
                kind = "build",
            },
        },
        libraries = { "lib/libvpx.a" },
        steps = {
            configure = {
                -- Static only: upstream links its shared object with ELF-only flags, which
                -- fails on macOS.
                {
                    "./configure",
                    "--prefix={prefix}",
                    "--enable-pic",
                    "--enable-static",
                    "--disable-shared",
                    "--enable-vp8",
                    "--enable-vp9",
                    "--enable-vp9-highbitdepth",
                    "--disable-examples",
                    "--disable-tools",
                    "--disable-docs",
                    "--disable-unit-tests",
                    "--disable-debug",
                },
            },
            build = {
                { "make", "-j{jobs}" },
            },
            install = {
                { "make", "install" },
            },
        },
    },
    outputs = {},
    platforms = {
        ["aarch64-linux"] = {
            default_version = "1.17.0",
        },
        ["aarch64-macos"] = {
            default_version = "1.17.0",
        },
        ["x86_64-linux"] = {
            default_version = "1.17.0",
        },
    },
    versions = {
        ["1.17.0"] = {
            digests = {
                ["aarch64-linux"] = "1020f184046187baa2985dbde38e0691f49c44088bca7a1842b0236c6081dc0a",
                ["aarch64-macos"] = "1020f184046187baa2985dbde38e0691f49c44088bca7a1842b0236c6081dc0a",
                ["x86_64-linux"] = "1020f184046187baa2985dbde38e0691f49c44088bca7a1842b0236c6081dc0a",
            },
        },
    },
}
