return {
    name = "dav1d",
    description = "Cross-platform AV1 decoder focused on speed and correctness",
    homepage = "https://code.videolan.org/videolan/dav1d",
    recipe_maintainers = { "tale" },
    default_license = "BSD-2-Clause",
    upstream = {
        git = "https://code.videolan.org/videolan/dav1d.git",
        tag = "{version}",
    },
    source = {
        url = "https://downloads.videolan.org/pub/videolan/dav1d/{version}/dav1d-{version}.tar.xz",
        archive = "tar.xz",
        strip_prefix = "dav1d-{version}",
    },
    build = {
        backend = "custom",
        dependencies = {
            {
                package = "meson",
                kind = "build",
            },
            {
                package = "ninja",
                kind = "build",
            },
            {
                package = "nasm",
                kind = "build",
            },
        },
        libraries = { "lib/libdav1d.a", "lib/libdav1d.{shared_extension}" },
        steps = {
            configure = {
                {
                    "meson",
                    "setup",
                    "build",
                    "--prefix={prefix}",
                    "--libdir=lib",
                    "--buildtype=release",
                    "--default-library=both",
                    "--wrap-mode=nodownload",
                    "-Denable_tests=false",
                    "-Denable_tools=true",
                    "-Denable_examples=false",
                },
            },
            build = {
                { "meson", "compile", "-C", "build", "-j", "{jobs}" },
            },
            install = {
                { "meson", "install", "-C", "build" },
            },
        },
    },
    outputs = {
        bins = { "dav1d" },
        checks = {
            { "dav1d", "--version" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "1.5.4",
        },
        ["aarch64-macos"] = {
            default_version = "1.5.4",
        },
        ["x86_64-linux"] = {
            default_version = "1.5.4",
        },
    },
    versions = {
        ["1.5.4"] = {
            digests = {
                ["aarch64-linux"] = "686616b7c69eb88d44459391ab25cac13b6647a3b288835c5784e71c1514a5c5",
                ["aarch64-macos"] = "686616b7c69eb88d44459391ab25cac13b6647a3b288835c5784e71c1514a5c5",
                ["x86_64-linux"] = "686616b7c69eb88d44459391ab25cac13b6647a3b288835c5784e71c1514a5c5",
            },
        },
    },
}
