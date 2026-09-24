return {
    name = "shfmt",
    description = "Format shell scripts",
    homepage = "https://github.com/mvdan/sh",
    recipe_maintainers = { "tale" },
    default_license = "BSD-3-Clause",
    upstream = {
        github = "mvdan/sh",
        repository_id = 49766020,
        tag = "v{version}",
    },
    source = {
        url = "https://codeload.github.com/mvdan/sh/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "sh-{version}",
        patches = {
            "--- a/cmd/shfmt/main.go\010+++ b/cmd/shfmt/main.go\010@@ -66,6 +66,8 @@\010 }\010 \010 var (\010+\009version = \"(unknown)\"\010+\010 \009// Generic flags.\010 \009versionFlag = flagVal(\"\", \"version\", false, flag.BoolVar)\010 \009list        = flagVal(\"l\", \"list\", \"false\", boolStringVar)\010@@ -156,8 +158,7 @@\010 \009flag.Parse()\010 \010 \009if versionFlag.val {\010-\009\009version := \"(unknown)\"\010-\009\009if info, ok := debug.ReadBuildInfo(); ok {\010+\009\009if info, ok := debug.ReadBuildInfo(); version == \"(unknown)\" && ok {\010 \009\009\009mod := &info.Main\010 \009\009\009if mod.Replace != nil {\010 \009\009\009\009mod = mod.Replace\010",
        },
    },
    build = {
        backend = "go",
        go = {
            binaries = {
                shfmt = "./cmd/shfmt",
            },
            variables = {
                ["main.version"] = "v{version}",
            },
        },
    },
    outputs = {
        bins = { "shfmt" },
        checks = {
            { "shfmt", "--version" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "3.14.1",
        },
        ["aarch64-macos"] = {
            default_version = "3.14.1",
        },
        ["x86_64-linux"] = {
            default_version = "3.14.1",
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
