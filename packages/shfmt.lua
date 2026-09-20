return {
    schema = 2,
    name = "shfmt",
    description = "Format shell scripts",
    default_version = "3.14.1",
    homepage = "https://github.com/mvdan/sh",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "mvdan/sh",
        repository_id = 49766020,
        tag_prefix = "v",
    },
    inputs = {
        source = {
            url = "https://codeload.github.com/mvdan/sh/tar.gz/refs/tags/{tag}",
            archive = "tar.gz",
            strip_prefix = "sh-{version}",
            patches = {
                '--- a/cmd/shfmt/main.go\n+++ b/cmd/shfmt/main.go\n@@ -66,6 +66,8 @@\n }\n \n var (\n+\tversion = "(unknown)"\n+\n \t// Generic flags.\n \tversionFlag = flagVal("", "version", false, flag.BoolVar)\n \tlist        = flagVal("l", "list", "false", boolStringVar)\n@@ -156,8 +158,7 @@\n \tflag.Parse()\n \n \tif versionFlag.val {\n-\t\tversion := "(unknown)"\n-\t\tif info, ok := debug.ReadBuildInfo(); ok {\n+\t\tif info, ok := debug.ReadBuildInfo(); version == "(unknown)" && ok {\n \t\t\tmod := &info.Main\n \t\t\tif mod.Replace != nil {\n \t\t\t\tmod = mod.Replace\n',
            },
        },
    },
    build = {
        backend = "go",
        go = {
            binaries = { shfmt = "./cmd/shfmt" },
            variables = { ["main.version"] = "v{version}" },
        },
    },
    outputs = {
        bins = { "shfmt" },
        checks = { { "shfmt", "--version" } },
    },
    versions = {
        ["3.14.1"] = {
            revision = 4,
            inputs = {
                source = {
                    sha256 = "ec4bdb88ab6c95686be3a4eeb4ad77d2b49d33d2ed7b0a65035cd52d2d87c443",
                },
            },
        },
    },
}
