return {
    name = "btop",
    description = "Monitor system resources in the terminal",
    homepage = "https://github.com/aristocratos/btop",
    recipe_maintainers = { "tale" },
    default_license = "Apache-2.0",
    upstream = {
        github = "aristocratos/btop",
        repository_id = 365005377,
        tag = "v{version}",
    },
    -- btop only samples the system inside a terminal, so checks stop at its command line.
    outputs = {
        bins = { "btop" },
        checks = {
            { "btop", "--version" },
            { "btop", "--default-config" },
        },
    },
    platforms = {
        -- btop needs GCC 14 or Clang 19 for C++23, newer than the builder's GCC 13, so Linux
        -- uses upstream's static musl binaries until the catalog provides a newer compiler.
        -- Their bundled themes sit outside the ../share/btop/themes path btop searches; the
        -- built-in themes still work.
        ["aarch64-linux"] = {
            target = "aarch64-unknown-linux-musl",
            default_version = "1.4.7",
            prebuilt = {
                github = "aristocratos/btop",
                asset = "btop-{target}.tar.gz",
            },
            outputs = {
                bins = {
                    btop = "btop/bin/btop",
                },
            },
        },
        ["aarch64-macos"] = {
            default_version = "1.4.7",
            source = {
                url = "https://github.com/aristocratos/btop/archive/refs/tags/{tag}.tar.gz",
                archive = "tar.gz",
                strip_prefix = "btop-{version}",
            },
            build = {
                backend = "custom",
                dependencies = {
                    {
                        package = "cmake",
                        version = "4.4.3",
                        kind = "build",
                    },
                },
                steps = {
                    configure = {
                        {
                            "cmake",
                            "-S",
                            ".",
                            "-B",
                            "output",
                            "-DCMAKE_BUILD_TYPE=Release",
                            "-DCMAKE_INSTALL_PREFIX=/",
                            -- Upstream's tests fetch GoogleTest at configure time, which builds can't.
                            "-DBUILD_TESTING=OFF",
                            -- Pinned off so the output never depends on a host lowdown; the man page is
                            -- skipped.
                            "-DLOWDOWN_EXECUTABLE=LOWDOWN_EXECUTABLE-NOTFOUND",
                        },
                    },
                    build = {
                        { "cmake", "--build", "output", "--parallel", "{jobs}" },
                    },
                    check = {
                        { "output/btop", "--version" },
                        { "output/btop", "--default-config" },
                    },
                    install = {
                        { "/usr/bin/env", "DESTDIR={prefix}", "cmake", "--install", "output" },
                    },
                },
            },
        },
        ["x86_64-linux"] = {
            target = "x86_64-unknown-linux-musl",
            default_version = "1.4.7",
            prebuilt = {
                github = "aristocratos/btop",
                asset = "btop-{target}.tar.gz",
            },
            outputs = {
                bins = {
                    btop = "btop/bin/btop",
                },
            },
        },
    },
    versions = {
        ["1.4.7"] = {
            digests = {
                ["aarch64-linux"] = "6270de0ef4c84cf0eea61cb148b3ad9ae91a11e9c3309867ffc6b3751024c252",
                ["aarch64-macos"] = "933de2e4d1b2211a638be463eb6e8616891bfba73aef5d38060bd8319baeefc6",
                ["x86_64-linux"] = "5099054dd6a101bd12eb6ff3702a9a6a3f57aaa27923a0da478ae5b517faf335",
            },
        },
    },
}
