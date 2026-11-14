return {
    name = "meson",
    description = "Fast and user-friendly build system",
    homepage = "https://mesonbuild.com",
    recipe_maintainers = { "tale" },
    default_license = "Apache-2.0",
    upstream = {
        github = "mesonbuild/meson",
        repository_id = 19784232,
        tag = "{version}",
        exclude_tags = { "*rc*" },
    },
    prebuilt = {
        github = "mesonbuild/meson",
        tag = "{version}",
        asset = "meson-{version}.tar.gz",
        install = {
            Archive = {
                format = "TarGz",
                strip_prefix = "meson-{version}",
            },
        },
        dependencies = {
            { package = "python", kind = "all" },
        },
        steps = {
            install = {
                {
                    "rm",
                    "-rf",
                    "test cases",
                    "manual tests",
                    "unittests",
                    "cross",
                    "packaging",
                    "graphics",
                    "data",
                    "tools",
                    "meson.egg-info",
                    "setup.py",
                    "setup.cfg",
                    "MANIFEST.in",
                    "pyproject.toml",
                    "PKG-INFO",
                    "contributing.md",
                    "run_unittests.py",
                    "run_tests.py",
                    "run_project_tests.py",
                    "run_meson_command_tests.py",
                    "run_cross_test.py",
                },
                -- The source tree runs in place, so it lives under lib/meson and bin/meson
                -- runs it with the catalog's python.
                {
                    "sh",
                    "-c",
                    [[mkdir -p lib/meson bin && mv meson.py mesonbuild COPYING README.md man lib/meson/ && printf '#!/bin/sh\nexec "%s/bin/python3" "%s/lib/meson/meson.py" "$@"\n' "$1" "$2" > bin/meson && chmod 755 bin/meson]],
                    "sh",
                    "{dependencies.python}",
                    "{prefix}",
                },
            },
        },
    },
    outputs = {
        bins = { "meson" },
        checks = {
            { "meson", "--version" },
            { "meson", "--help" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "1.12.1",
        },
        ["aarch64-macos"] = {
            default_version = "1.12.1",
        },
        ["x86_64-linux"] = {
            default_version = "1.12.1",
        },
    },
    versions = {
        ["1.12.1"] = {
            digests = {
                ["aarch64-linux"] = "ab0a6ca09f8ef70c564c8241fb5a23957886a0b53fb58412b5e07eaf07dba743",
                ["aarch64-macos"] = "ab0a6ca09f8ef70c564c8241fb5a23957886a0b53fb58412b5e07eaf07dba743",
                ["x86_64-linux"] = "ab0a6ca09f8ef70c564c8241fb5a23957886a0b53fb58412b5e07eaf07dba743",
            },
        },
    },
}
