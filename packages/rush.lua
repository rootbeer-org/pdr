return {
    name = "rush",
    description = "Run a POSIX shell with interactive editing and completions",
    homepage = "https://rush.horse",
    recipe_maintainers = { "tale" },
    default_license = "MIT",
    source = {
        url = "https://codeload.github.com/rockorager/rush/tar.gz/294212ebd35f5b755062186a66bcfd6436d3627a",
        archive = "tar.gz",
        strip_prefix = "rush-294212ebd35f5b755062186a66bcfd6436d3627a",
        patches = {
            "build-version-option.patch",
        },
    },
    build = {
        backend = "zig",
        args = {
            "-Doptimize=ReleaseSafe",
            "-Dregister-shell=false",
            "-Dsysconfdir=/etc",
            "-Ddatadir=/usr/share",
            "-Dversion=0.1.0-dev.20260909+g294212ebd35f5b755062186a66bcfd6436d3627a",
        },
        dependencies = {
            -- rush and its packages use std APIs zig 0.17 removed.
            {
                package = "zig",
                version = "0.16.0",
                kind = "all",
            },
        },
    },
    outputs = {
        bins = { "rush" },
        checks = {
            { "rush", "--version" },
            {
                "rush",
                "-ec",
                '[ "$((2 + 3))" = 5 ]; value=$(printf "%s" "a b"); [ "$value" = "a b" ]; path_prepend /usr/bin; [ "${PATH%%:*}" = /usr/bin ]',
            },
            {
                "rush",
                "-ec",
                '[ "$("$0" --version)" = "rush 0.1.0-dev.20260909+g294212ebd35f5b755062186a66bcfd6436d3627a" ]',
            },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "0.1.0-dev.20260909+g294212ebd35f5b755062186a66bcfd6436d3627a",
        },
        ["aarch64-macos"] = {
            default_version = "0.1.0-dev.20260909+g294212ebd35f5b755062186a66bcfd6436d3627a",
        },
        ["x86_64-linux"] = {
            default_version = "0.1.0-dev.20260909+g294212ebd35f5b755062186a66bcfd6436d3627a",
        },
    },
    versions = {
        ["0.1.0-dev.20260909+g294212ebd35f5b755062186a66bcfd6436d3627a"] = {
            digests = {
                ["aarch64-linux"] = "b7eb240c58b7de30a80f1a2f27d1273effa1a1785d670ea6917995e5803422b6",
                ["aarch64-macos"] = "b7eb240c58b7de30a80f1a2f27d1273effa1a1785d670ea6917995e5803422b6",
                ["x86_64-linux"] = "b7eb240c58b7de30a80f1a2f27d1273effa1a1785d670ea6917995e5803422b6",
            },
            revision = 2,
        },
    },
}
