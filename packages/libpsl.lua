return {
    schema = 2,
    name = "libpsl",
    description = "Public suffix list library and tools",
    default_version = "0.23.3",
    homepage = "https://github.com/rockdaboot/libpsl",
    systems = { "aarch64-macos", "aarch64-linux", "x86_64-linux" },
    build = {
        backend = "autotools",
        dependencies = { "libiconv@1.19", "libidn2@2.3.8", "libunistring@1.4.2", "pkgconf@3.0.7" },
        configure = {
            "--disable-shared",
            "--enable-static",
            "--disable-nls",
            "--disable-rpath",
            "--without-libiconv-prefix",
            "--enable-runtime=libidn2",
            "--enable-builtin",
            "--without-libunistring-prefix",
        },
    },
    inputs = {
        source = {
            url = "https://github.com/rockdaboot/libpsl/releases/download/{version}/libpsl-{version}.tar.gz",
            archive = "tar.gz",
            strip_prefix = "libpsl-{version}",
        },
    },
    outputs = {
        libraries = { "lib/libpsl.a" },
        bins = { "psl" },
        checks = {
            { "psl", "--version" },
        },
    },
    versions = {
        ["0.23.3"] = {
            inputs = {
                source = {
                    sha256 = "93941f85a1e7bd593fa94f299233cb5dfc91cd144fd9a78a6ceb75001c5b03be",
                },
            },
        },
    },
}
