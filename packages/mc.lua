return {
    name = "mc",
    description = "Manage files in S3-compatible object storage",
    homepage = "https://github.com/minio/mc",
    recipe_maintainers = { "tale" },
    default_license = "AGPL-3.0-or-later",
    upstream = {
        github = "minio/mc",
        repository_id = 29329884,
        tag = "RELEASE.{version}",
    },
    source = {
        url = "https://codeload.github.com/minio/mc/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "mc-RELEASE.{version}",
    },
    build = {
        backend = "go",
        go = {
            binaries = {
                mc = ".",
            },
            tags = { "kqueue" },
            variables = {
                ["github.com/minio/mc/cmd.CommitID"] = "{commit}",
                ["github.com/minio/mc/cmd.CopyrightYear"] = "{major}",
                ["github.com/minio/mc/cmd.ReleaseTag"] = "{tag}",
            },
        },
        dependencies = {
            {
                package = "go",
                version = "1.27.1",
                kind = "build",
            },
        },
    },
    outputs = {
        bins = { "mc" },
        checks = {
            { "mc", "--version" },
            { "mc", "ls", "--help" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "2025-08-13T08-35-41Z",
        },
        ["aarch64-macos"] = {
            default_version = "2025-08-13T08-35-41Z",
        },
        ["x86_64-linux"] = {
            default_version = "2025-08-13T08-35-41Z",
        },
    },
    versions = {
        ["2025-08-13T08-35-41Z"] = {
            digests = {
                ["aarch64-linux"] = "29db22500374169a43951c7cef09daf19e7291ea5ba00ac10f321371b0a35b32",
                ["aarch64-macos"] = "29db22500374169a43951c7cef09daf19e7291ea5ba00ac10f321371b0a35b32",
                ["x86_64-linux"] = "29db22500374169a43951c7cef09daf19e7291ea5ba00ac10f321371b0a35b32",
            },
            commit = "7394ce0dd2a80935aded936b09fa12cbb3cb8096",
            revision = 2,
        },
    },
}
