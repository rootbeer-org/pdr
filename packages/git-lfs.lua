return {
    name = "git-lfs",
    description = "Store large files in Git repositories",
    homepage = "https://github.com/git-lfs/git-lfs",
    default_license = "NOASSERTION",
    source = {
        url = "https://codeload.github.com/git-lfs/git-lfs/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "git-lfs-{version}",
        patches = {
            "--- a/git-lfs.go\n+++ b/git-lfs.go\n@@ -11,7 +11,7 @@\n )\n \n func main() {\n-\tc := make(chan os.Signal)\n+\tc := make(chan os.Signal, 1)\n \tsignal.Notify(c, os.Interrupt, os.Kill)\n \n \tgo func() {\n",
        },
    },
    build = {
        backend = "go",
        go = { binaries = { ["git-lfs"] = "." }, generate = { "./commands" } },
    },
    outputs = { bins = { "git-lfs" }, checks = { { "git-lfs", "version" } } },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "3.8.0",
            upstream = {
                github = "git-lfs/git-lfs",
                repository_id = 13021798,
                tag_prefix = "v",
                exclude_tags = { "v0.5.4-homebrew" },
            },
        },
        ["aarch64-macos"] = {
            default_version = "3.8.0",
            upstream = {
                github = "git-lfs/git-lfs",
                repository_id = 13021798,
                tag_prefix = "v",
                exclude_tags = { "v0.5.4-homebrew" },
            },
        },
        ["x86_64-linux"] = {
            default_version = "3.8.0",
            upstream = {
                github = "git-lfs/git-lfs",
                repository_id = 13021798,
                tag_prefix = "v",
                exclude_tags = { "v0.5.4-homebrew" },
            },
        },
    },
    versions = {
        ["3.8.0"] = {
            digests = {
                ["aarch64-linux"] = "a12ecfc17ebee002d1f6acca79442029d41cbf5e5b4ba9e02249ed96de20300f",
                ["aarch64-macos"] = "a12ecfc17ebee002d1f6acca79442029d41cbf5e5b4ba9e02249ed96de20300f",
                ["x86_64-linux"] = "a12ecfc17ebee002d1f6acca79442029d41cbf5e5b4ba9e02249ed96de20300f",
            },
            revision = 3,
        },
    },
}
