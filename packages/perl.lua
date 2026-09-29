return {
    name = "perl",
    description = "Highly capable, feature-rich programming language",
    homepage = "https://www.perl.org/",
    recipe_maintainers = { "tale" },
    default_license = "Artistic-1.0-Perl OR GPL-1.0-or-later",
    upstream = {
        github = "Perl/perl5",
        repository_id = 8183570,
        tag = "v{version}",
    },
    source = {
        url = "https://www.cpan.org/src/5.0/perl-{version}.tar.gz",
        archive = "tar.gz",
        strip_prefix = "perl-{version}",
    },
    build = {
        backend = "custom",
        steps = {
            configure = {
                {
                    "/bin/sh",
                    "./Configure",
                    "-des",
                    "-Dprefix=/",
                    "-Duserelocatableinc",
                    "-Dlibswanted=m dl pthread util c",
                    "-Dman1dir=none",
                    "-Dman3dir=none",
                },
            },
            build = {
                { "make", "-j{jobs}" },
            },
            check = {
                { "/usr/bin/env", "TEST_JOBS={jobs}", "make", "test_harness" },
            },
            install = {
                { "make", "DESTDIR={prefix}", "install" },
            },
        },
    },
    outputs = {
        bins = { "perl" },
        checks = {
            { "perl", "-e", "exit($^V eq 'v{version}' ? 0 : 1)" },
            {
                "perl",
                "-MList::Util=sum",
                "-MDigest::SHA=sha256_hex",
                "-e",
                "exit(sum(1, 2) == 3 && length(sha256_hex('')) == 64 ? 0 : 1)",
            },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "5.44.0",
        },
        ["aarch64-macos"] = {
            default_version = "5.44.0",
        },
        ["x86_64-linux"] = {
            default_version = "5.44.0",
        },
    },
    versions = {
        ["5.44.0"] = {
            digests = {
                ["aarch64-linux"] = "3b855066b92491cb40e86affb1ca57d1a388aa43e51b91c7806a32c2f65f96c3",
                ["aarch64-macos"] = "3b855066b92491cb40e86affb1ca57d1a388aa43e51b91c7806a32c2f65f96c3",
                ["x86_64-linux"] = "3b855066b92491cb40e86affb1ca57d1a388aa43e51b91c7806a32c2f65f96c3",
            },
        },
    },
}
