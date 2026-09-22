return {
    name = "argc",
    description = "Build command-line interfaces for shell scripts",
    homepage = "https://github.com/sigoden/argc",
    default_license = "Apache-2.0",
    prebuilt = { github = "sigoden/argc", tag = "v{version}", asset = "argc-{tag}-{target}.tar.gz" },
    outputs = {
        bins = { "argc" },
        checks = { { "argc", "--argc-version" }, { "argc", "--argc-help" } },
    },
    platforms = {
        ["aarch64-linux"] = {
            target = "aarch64-unknown-linux-musl",
            default_version = "1.24.0",
            upstream = { github = "sigoden/argc", repository_id = 461504676, tag_prefix = "v" },
        },
        ["aarch64-macos"] = {
            target = "aarch64-apple-darwin",
            default_version = "1.24.0",
            upstream = { github = "sigoden/argc", repository_id = 461504676, tag_prefix = "v" },
        },
        ["x86_64-linux"] = {
            target = "x86_64-unknown-linux-musl",
            default_version = "1.24.0",
            upstream = { github = "sigoden/argc", repository_id = 461504676, tag_prefix = "v" },
        },
    },
    versions = {
        ["1.24.0"] = {
            digests = {
                ["aarch64-linux"] = "1493e522be42b83e326750bbd6bd1893b33ed4889ef6d1a03f18c57702159519",
                ["aarch64-macos"] = "617e2fbca3ce0fe604b82f22cd857e3d53fa1b53dbb18d5883bb0f935c31f42e",
                ["x86_64-linux"] = "92e2c30ef078e0a66855b5bdd389cefa7ac6ef4c1fe0b177f3f0bf639891aa72",
            },
            revision = 2,
        },
    },
}
