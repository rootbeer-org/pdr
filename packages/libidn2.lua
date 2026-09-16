return {
    schema = 2,
    name = "libidn2",
    description = "Internationalized domain name processing",
    default_version = "2.3.8",
    homepage = "https://www.gnu.org/software/libidn/",
    systems = { "aarch64-macos", "aarch64-linux", "x86_64-linux" },
    build = {
        backend = "autotools",
        dependencies = { "libunistring@1.4.2" },
        configure = {
            "--disable-shared",
            "--enable-static",
            "--disable-nls",
            "--disable-doc",
            "--disable-rpath",
            "--with-libunistring-prefix={dependencies}",
        },
    },
    inputs = {
        source = {
            url = "https://ftp.gnu.org/gnu/libidn/libidn2-{version}.tar.gz",
            archive = "tar.gz",
            strip_prefix = "libidn2-{version}",
        },
    },
    outputs = {
        libraries = { "lib/libidn2.a" },
        bins = { "idn2" },
        checks = {
            { "idn2", "--version" },
            { "idn2", "bücher.de" },
        },
    },
    versions = {
        ["2.3.8"] = {
            inputs = {
                source = {
                    sha256 = "f557911bf6171621e1f72ff35f5b1825bb35b52ed45325dcdee931e5d3c0787a",
                },
            },
        },
    },
}
