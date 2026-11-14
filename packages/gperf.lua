return {
    name = "gperf",
    description = "Perfect hash function generator",
    homepage = "https://www.gnu.org/software/gperf/",
    recipe_maintainers = { "tale" },
    default_license = "GPL-3.0-or-later",
    upstream = {
        git = "https://git.savannah.gnu.org/git/gperf.git",
        tag = "v{version}",
    },
    source = {
        url = "https://ftp.gnu.org/gnu/gperf/gperf-{version}.tar.gz",
        archive = "tar.gz",
        strip_prefix = "gperf-{version}",
    },
    build = {
        backend = "autotools",
    },
    outputs = {
        bins = { "gperf" },
        checks = {
            { "gperf", "--version" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "3.3",
        },
        ["aarch64-macos"] = {
            default_version = "3.3",
        },
        ["x86_64-linux"] = {
            default_version = "3.3",
        },
    },
    versions = {
        ["3.3"] = {
            digests = {
                ["aarch64-linux"] = "fd87e0aba7e43ae054837afd6cd4db03a3f2693deb3619085e6ed9d8d9604ad8",
                ["aarch64-macos"] = "fd87e0aba7e43ae054837afd6cd4db03a3f2693deb3619085e6ed9d8d9604ad8",
                ["x86_64-linux"] = "fd87e0aba7e43ae054837afd6cd4db03a3f2693deb3619085e6ed9d8d9604ad8",
            },
        },
    },
}
