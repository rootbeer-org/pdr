return {
    name = "git-lfs",
    description = "Store large files in Git repositories",
    homepage = "https://git-lfs.com/",
    recipe_maintainers = { "tale" },
    default_license = "MIT AND BSD-3-Clause",
    upstream = {
        github = "git-lfs/git-lfs",
        repository_id = 13021798,
        tag = "v{version}",
        exclude_tags = { "v0.5.4-homebrew" },
    },
    source = {
        url = "https://codeload.github.com/git-lfs/git-lfs/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "git-lfs-{version}",
        patches = {
            "--- a/git-lfs.go\010+++ b/git-lfs.go\010@@ -11,7 +11,7 @@\010 )\010 \010 func main() {\010-\009c := make(chan os.Signal)\010+\009c := make(chan os.Signal, 1)\010 \009signal.Notify(c, os.Interrupt, os.Kill)\010 \010 \009go func() {\010",
        },
    },
    build = {
        backend = "go",
        go = {
            binaries = {
                ["git-lfs"] = ".",
            },
            generate = { "./commands" },
        },
        dependencies = {
            {
                package = "go",
                kind = "build",
            },
        },
    },
    outputs = {
        bins = { "git-lfs" },
        checks = {
            { "git-lfs", "version" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "3.8.1",
        },
        ["aarch64-macos"] = {
            default_version = "3.8.1",
        },
        ["x86_64-linux"] = {
            default_version = "3.8.1",
        },
    },
    versions = {
        ["3.8.0"] = {
            digests = {
                ["aarch64-linux"] = "a12ecfc17ebee002d1f6acca79442029d41cbf5e5b4ba9e02249ed96de20300f",
                ["aarch64-macos"] = "a12ecfc17ebee002d1f6acca79442029d41cbf5e5b4ba9e02249ed96de20300f",
                ["x86_64-linux"] = "a12ecfc17ebee002d1f6acca79442029d41cbf5e5b4ba9e02249ed96de20300f",
            },
            revision = 4,
        },
        ["3.8.1"] = {
            digests = {
                ["aarch64-linux"] = "6ab3e7ffa03014f3ca574f06c1df835ccf9e8c079a3c5c1134b95bdff9c106c0",
                ["aarch64-macos"] = "6ab3e7ffa03014f3ca574f06c1df835ccf9e8c079a3c5c1134b95bdff9c106c0",
                ["x86_64-linux"] = "6ab3e7ffa03014f3ca574f06c1df835ccf9e8c079a3c5c1134b95bdff9c106c0",
            },
        },
    },
}
