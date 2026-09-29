return {
    name = "check",
    description = "Unit testing framework for C",
    homepage = "https://libcheck.github.io/check/",
    recipe_maintainers = { "tale" },
    default_license = "LGPL-2.1-or-later",
    upstream = {
        github = "libcheck/check",
        repository_id = 48520045,
    },
    source = {
        url = "https://github.com/libcheck/check/releases/download/{version}/check-{version}.tar.gz",
        archive = "tar.gz",
        strip_prefix = "check-{version}",
    },
    build = {
        backend = "autotools",
        configure = {
            "--disable-shared",
            "--enable-static",
            "--disable-build-docs",
            "--disable-subunit",
            -- The timeout tests measure wall-clock delays and flake on shared CI runners.
            "--disable-timeout-tests",
        },
        libraries = { "lib/libcheck.a" },
    },
    outputs = {},
    platforms = {
        ["aarch64-linux"] = {
            default_version = "0.15.2",
        },
        ["aarch64-macos"] = {
            default_version = "0.15.2",
        },
        ["x86_64-linux"] = {
            default_version = "0.15.2",
        },
    },
    versions = {
        ["0.15.2"] = {
            digests = {
                ["aarch64-linux"] = "a8de4e0bacfb4d76dd1c618ded263523b53b85d92a146d8835eb1a52932fa20a",
                ["aarch64-macos"] = "a8de4e0bacfb4d76dd1c618ded263523b53b85d92a146d8835eb1a52932fa20a",
                ["x86_64-linux"] = "a8de4e0bacfb4d76dd1c618ded263523b53b85d92a146d8835eb1a52932fa20a",
            },
        },
    },
}
