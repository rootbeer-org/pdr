return {
    name = "dprint",
    description = "Format source files with configurable plugins",
    homepage = "https://dprint.dev/",
    recipe_maintainers = { "tale" },
    default_license = "MIT",
    upstream = {
        github = "dprint/dprint",
        repository_id = 192136193,
        tag = "{version}",
    },
    prebuilt = {
        github = "dprint/dprint",
        tag = "{version}",
        asset = "dprint-{target}.zip",
        dependencies = {
            { package = "7zip", kind = "build" },
        },
    },
    outputs = {
        bins = { "dprint" },
        checks = {
            { "dprint", "--version" },
            { "dprint", "help" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            target = "aarch64-unknown-linux-musl",
            default_version = "0.65.0",
        },
        ["aarch64-macos"] = {
            target = "aarch64-apple-darwin",
            default_version = "0.65.0",
        },
        ["x86_64-linux"] = {
            target = "x86_64-unknown-linux-musl",
            default_version = "0.65.0",
        },
    },
    versions = {
        ["0.64.3"] = {
            digests = {
                ["aarch64-linux"] = "61c8936368ff4030a615ce43853adc5a0707ff77973743d0a691aee2cbf64723",
                ["aarch64-macos"] = "94b48820945602fb113a34343db0a9e653a8346c60966f790556dc9ce4084a92",
                ["x86_64-linux"] = "f105dbc2b0bc0d83c644fcabc3e7bd8779469c0d9faeda48365c58b389d5a443",
            },
        },
        ["0.65.0"] = {
            digests = {
                ["aarch64-linux"] = "a427ef844b300d896b3f836706bb77d8df6b77f8f2627103c4a34ded94cf6ae1",
                ["aarch64-macos"] = "5e57a5e75f5d29d1f9dcc10255fccb9815031f4720fe6759643d0ee12cf201f2",
                ["x86_64-linux"] = "61707303f4305891fecffec1f92ec8243b07e9d3ba8a7e81f7543fc77fb0002d",
            },
        },
    },
}
