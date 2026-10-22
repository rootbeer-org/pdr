return {
    name = "buf",
    description = "Build and check Protocol Buffer schemas",
    homepage = "https://buf.build/docs/cli/",
    recipe_maintainers = { "tale" },
    default_license = "Apache-2.0",
    upstream = {
        github = "bufbuild/buf",
        repository_id = 212465715,
        tag = "v{version}",
    },
    source = {
        url = "https://codeload.github.com/bufbuild/buf/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "buf-{version}",
    },
    build = {
        backend = "go",
        go = {
            binaries = {
                buf = "./cmd/buf",
            },
        },
        dependencies = {
            {
                package = "go",
                kind = "build",
            },
        },
    },
    outputs = {
        bins = { "buf" },
        checks = {
            { "buf", "--version" },
            { "buf", "lint", "--help" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "1.75.0",
        },
        ["aarch64-macos"] = {
            default_version = "1.75.0",
        },
        ["x86_64-linux"] = {
            default_version = "1.75.0",
        },
    },
    versions = {
        ["1.74.0"] = {
            digests = {
                ["aarch64-linux"] = "09f5e4f103ff418bbce2f98ea342852b590f45357c8f3492e827a5976cb9075c",
                ["aarch64-macos"] = "09f5e4f103ff418bbce2f98ea342852b590f45357c8f3492e827a5976cb9075c",
                ["x86_64-linux"] = "09f5e4f103ff418bbce2f98ea342852b590f45357c8f3492e827a5976cb9075c",
            },
        },
        ["1.75.0"] = {
            digests = {
                ["aarch64-linux"] = "e1b688283938b19ff072789d37f371e9bdfbc866ebb719b20c1f1bdc4a9ca8ff",
                ["aarch64-macos"] = "e1b688283938b19ff072789d37f371e9bdfbc866ebb719b20c1f1bdc4a9ca8ff",
                ["x86_64-linux"] = "e1b688283938b19ff072789d37f371e9bdfbc866ebb719b20c1f1bdc4a9ca8ff",
            },
        },
    },
}
