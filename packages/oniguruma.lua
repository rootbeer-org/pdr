return {
    name = "oniguruma",
    description = "Regular expression library with Ruby, Perl and POSIX syntax support",
    homepage = "https://github.com/kkos/oniguruma",
    recipe_maintainers = { "tale" },
    default_license = "BSD-2-Clause",
    upstream = {
        github = "kkos/oniguruma",
        repository_id = 38999874,
        tag = "v{version}",
    },
    source = {
        url = "https://github.com/kkos/oniguruma/releases/download/v{version}/onig-{version}.tar.gz",
        archive = "tar.gz",
        strip_prefix = "onig-{version}",
    },
    build = {
        backend = "autotools",
        configure = {
            "--enable-shared",
            "--enable-static",
            "--with-pic",
            "--disable-rpath",
        },
        libraries = { "lib/libonig.a", "lib/libonig.{shared_extension}" },
    },
    outputs = {},
    platforms = {
        ["aarch64-linux"] = {
            default_version = "6.9.10",
        },
        ["aarch64-macos"] = {
            default_version = "6.9.10",
        },
        ["x86_64-linux"] = {
            default_version = "6.9.10",
        },
    },
    versions = {
        ["6.9.10"] = {
            digests = {
                ["aarch64-linux"] = "2a5cfc5ae259e4e97f86b68dfffc152cdaffe94e2060b770cb827238d769fc05",
                ["aarch64-macos"] = "2a5cfc5ae259e4e97f86b68dfffc152cdaffe94e2060b770cb827238d769fc05",
                ["x86_64-linux"] = "2a5cfc5ae259e4e97f86b68dfffc152cdaffe94e2060b770cb827238d769fc05",
            },
        },
    },
}
