return {
    name = "shfmt",
    description = "Format shell scripts",
    homepage = "https://github.com/mvdan/sh",
    default_license = "BSD-3-Clause",
    source = {
        url = "https://codeload.github.com/mvdan/sh/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "sh-{version}",
        patches = {
            '--- a/cmd/shfmt/main.go\n+++ b/cmd/shfmt/main.go\n@@ -66,6 +66,8 @@\n }\n \n var (\n+\tversion = "(unknown)"\n+\n \t// Generic flags.\n \tversionFlag = flagVal("", "version", false, flag.BoolVar)\n \tlist        = flagVal("l", "list", "false", boolStringVar)\n@@ -156,8 +158,7 @@\n \tflag.Parse()\n \n \tif versionFlag.val {\n-\t\tversion := "(unknown)"\n-\t\tif info, ok := debug.ReadBuildInfo(); ok {\n+\t\tif info, ok := debug.ReadBuildInfo(); version == "(unknown)" && ok {\n \t\t\tmod := &info.Main\n \t\t\tif mod.Replace != nil {\n \t\t\t\tmod = mod.Replace\n',
        },
    },
    build = {
        backend = "go",
        go = {
            binaries = { shfmt = "./cmd/shfmt" },
            variables = { ["main.version"] = "v{version}" },
        },
    },
    outputs = { bins = { "shfmt" }, checks = { { "shfmt", "--version" } } },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "3.14.1",
            upstream = { github = "mvdan/sh", repository_id = 49766020, tag_prefix = "v" },
        },
        ["aarch64-macos"] = {
            default_version = "3.14.1",
            upstream = { github = "mvdan/sh", repository_id = 49766020, tag_prefix = "v" },
        },
        ["x86_64-linux"] = {
            default_version = "3.14.1",
            upstream = { github = "mvdan/sh", repository_id = 49766020, tag_prefix = "v" },
        },
    },
    versions = {
        ["3.14.1"] = {
            digests = {
                ["aarch64-linux"] = "ec4bdb88ab6c95686be3a4eeb4ad77d2b49d33d2ed7b0a65035cd52d2d87c443",
                ["aarch64-macos"] = "ec4bdb88ab6c95686be3a4eeb4ad77d2b49d33d2ed7b0a65035cd52d2d87c443",
                ["x86_64-linux"] = "ec4bdb88ab6c95686be3a4eeb4ad77d2b49d33d2ed7b0a65035cd52d2d87c443",
            },
            revision = 4,
        },
    },
}
