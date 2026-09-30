return {
    name = "velero",
    description = "Back up and migrate Kubernetes resources and volumes",
    homepage = "https://velero.io",
    recipe_maintainers = { "tale" },
    default_license = "Apache-2.0",
    upstream = {
        github = "vmware-tanzu/velero",
        repository_id = 99143276,
        tag = "v{version}",
    },
    source = {
        url = "https://codeload.github.com/vmware-tanzu/velero/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "velero-{version}",
    },
    build = {
        backend = "go",
        go = {
            binaries = {
                velero = "./cmd/velero",
            },
            variables = {
                ["github.com/vmware-tanzu/velero/pkg/buildinfo.GitSHA"] = "{commit}",
                ["github.com/vmware-tanzu/velero/pkg/buildinfo.GitTreeState"] = "clean",
                ["github.com/vmware-tanzu/velero/pkg/buildinfo.ImageRegistry"] = "velero",
                ["github.com/vmware-tanzu/velero/pkg/buildinfo.Version"] = "v{version}",
            },
        },
    },
    outputs = {
        bins = { "velero" },
        checks = {
            { "velero", "version", "--client-only" },
            { "velero", "backup", "create", "--help" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "1.18.4",
        },
        ["aarch64-macos"] = {
            default_version = "1.18.4",
        },
        ["x86_64-linux"] = {
            default_version = "1.18.4",
        },
    },
    versions = {
        ["1.18.4"] = {
            digests = {
                ["aarch64-linux"] = "f551c797c90bc9e76f4de31e07011888666aeb63cd277991b909e4509baf9142",
                ["aarch64-macos"] = "f551c797c90bc9e76f4de31e07011888666aeb63cd277991b909e4509baf9142",
                ["x86_64-linux"] = "f551c797c90bc9e76f4de31e07011888666aeb63cd277991b909e4509baf9142",
            },
            commit = "4ee1e79a7aed367fd9b767b8219ec65bd0c96892",
        },
    },
}
