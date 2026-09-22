return {
    name = "libidn2",
    description = "Internationalized domain name processing",
    homepage = "https://www.gnu.org/software/libidn/",
    default_license = "NOASSERTION",
    source = {
        url = "https://ftp.gnu.org/gnu/libidn/libidn2-{version}.tar.gz",
        archive = "tar.gz",
        strip_prefix = "libidn2-{version}",
    },
    build = {
        backend = "autotools",
        configure = {
            "--disable-shared",
            "--enable-static",
            "--disable-nls",
            "--disable-doc",
            "--disable-rpath",
            "--without-libiconv-prefix",
            "--without-libunistring-prefix",
        },
        dependencies = { "libiconv@1.19", "libunistring@1.4.2" },
        libraries = { "lib/libidn2.a" },
    },
    outputs = { bins = { "idn2" }, checks = { { "idn2", "--version" }, { "idn2", "example.com" } } },
    platforms = {
        ["aarch64-linux"] = { default_version = "2.3.8" },
        ["aarch64-macos"] = { default_version = "2.3.8" },
        ["x86_64-linux"] = { default_version = "2.3.8" },
    },
    versions = {
        ["2.3.8"] = {
            digests = {
                ["aarch64-linux"] = "f557911bf6171621e1f72ff35f5b1825bb35b52ed45325dcdee931e5d3c0787a",
                ["aarch64-macos"] = "f557911bf6171621e1f72ff35f5b1825bb35b52ed45325dcdee931e5d3c0787a",
                ["x86_64-linux"] = "f557911bf6171621e1f72ff35f5b1825bb35b52ed45325dcdee931e5d3c0787a",
            },
        },
    },
}
