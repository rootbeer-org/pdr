return {
    name = "pcre2",
    description = "Perl-compatible regular expression library",
    homepage = "https://github.com/PCRE2Project/pcre2",
    recipe_maintainers = { "tale" },
    default_license = "BSD-3-Clause WITH PCRE2-exception",
    upstream = {
        github = "PCRE2Project/pcre2",
        repository_id = 398251321,
        tag = "pcre2-{version}",
        exclude_tags = { "pcre2-*RC*" },
    },
    source = {
        url = "https://github.com/PCRE2Project/pcre2/releases/download/pcre2-{version}/pcre2-{version}.tar.gz",
        archive = "tar.gz",
        strip_prefix = "pcre2-{version}",
    },
    build = {
        backend = "autotools",
        configure = {
            "--enable-static",
            "--enable-shared",
            "--enable-pcre2-16",
            "--enable-pcre2-32",
            "--enable-jit",
            "--enable-unicode",
        },
        libraries = {
            "lib/libpcre2-8.a",
            "lib/libpcre2-8.{shared_extension}",
            "lib/libpcre2-16.a",
            "lib/libpcre2-16.{shared_extension}",
            "lib/libpcre2-32.a",
            "lib/libpcre2-32.{shared_extension}",
            "lib/libpcre2-posix.a",
            "lib/libpcre2-posix.{shared_extension}",
        },
    },
    outputs = {
        bins = { "pcre2grep", "pcre2test", "pcre2-config" },
        checks = {
            { "pcre2grep", "--version" },
            { "pcre2test", "-C" },
            { "pcre2-config", "--version" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "10.49",
        },
        ["aarch64-macos"] = {
            default_version = "10.49",
        },
        ["x86_64-linux"] = {
            default_version = "10.49",
        },
    },
    versions = {
        ["10.49"] = {
            digests = {
                ["aarch64-linux"] = "929f0b20e62879252a15886b06c89f1edef61a363cbd5826fb041080a5e557ae",
                ["aarch64-macos"] = "929f0b20e62879252a15886b06c89f1edef61a363cbd5826fb041080a5e557ae",
                ["x86_64-linux"] = "929f0b20e62879252a15886b06c89f1edef61a363cbd5826fb041080a5e557ae",
            },
        },
    },
}
