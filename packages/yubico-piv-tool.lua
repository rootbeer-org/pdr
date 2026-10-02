return {
    name = "yubico-piv-tool",
    description = "YubiKey PIV tool and the ykcs11 PKCS#11 module",
    homepage = "https://developers.yubico.com/yubico-piv-tool/",
    recipe_maintainers = { "tale" },
    default_license = "BSD-2-Clause",
    upstream = {
        github = "Yubico/yubico-piv-tool",
        repository_id = 16697663,
        tag = "yubico-piv-tool-{version}",
    },
    source = {
        url = "https://developers.yubico.com/yubico-piv-tool/Releases/yubico-piv-tool-{version}.tar.gz",
        archive = "tar.gz",
        strip_prefix = "yubico-piv-tool-{version}",
    },
    build = {
        backend = "custom",
        dependencies = {
            {
                package = "cmake",
                version = "4.4.3",
                kind = "build",
            },
            {
                package = "pkgconf",
                version = "3.0.7",
                kind = "build",
            },
            {
                package = "gengetopt",
                version = "2.23.1",
                kind = "build",
            },
            {
                package = "check",
                version = "0.15.2",
                kind = "link",
            },
            {
                package = "openssl",
                version = "4.0.2",
                kind = "link_runtime",
            },
            {
                package = "zlib",
                version = "1.3.2",
                kind = "link_runtime",
            },
        },
        libraries = { "lib/libykpiv.{shared_extension}", "lib/libykcs11.{shared_extension}" },
        steps = {
            configure = {
                {
                    "cmake",
                    "-S",
                    ".",
                    "-B",
                    "output",
                    "-DCMAKE_BUILD_TYPE=Release",
                    "-DCMAKE_INSTALL_PREFIX=/",
                    "-DYKPIV_INSTALL_LIB_DIR=/lib",
                    "-DYKPIV_INSTALL_INC_DIR=/include",
                    "-DYKPIV_INSTALL_BIN_DIR=/bin",
                    "-DYKPIV_INSTALL_MAN_DIR=/share/man",
                    "-DYKPIV_INSTALL_PKGCONFIG_DIR=/lib/pkgconfig",
                    "-DBACKEND=macscard",
                    "-DBUILD_STATIC_LIB=OFF",
                    -- Regenerating the man page needs help2man; the shipped page still installs.
                    "-DGENERATE_MAN_PAGES=OFF",
                    "-DENABLE_HARDWARE_TESTS=OFF",
                    -- OpenSSL 4 returns const X509 names and extensions; drop once
                    -- Yubico/yubico-piv-tool#583 ships.
                    "-DCMAKE_C_FLAGS=-Wno-error=incompatible-pointer-types-discards-qualifiers",
                },
            },
            build = {
                { "cmake", "--build", "output", "--parallel", "{jobs}" },
            },
            check = {
                {
                    "ctest",
                    "--test-dir",
                    "output",
                    "--output-on-failure",
                    "--no-tests=error",
                    "--parallel",
                    "{jobs}",
                },
            },
            install = {
                { "/usr/bin/env", "DESTDIR={prefix}", "cmake", "--install", "output" },
            },
        },
    },
    outputs = {
        bins = { "yubico-piv-tool" },
        checks = {
            { "yubico-piv-tool", "--version" },
            { "yubico-piv-tool", "--help" },
        },
    },
    -- macOS only: Linux needs a host pcscd, which rb does not manage yet.
    platforms = {
        ["aarch64-macos"] = {
            default_version = "2.7.3",
        },
    },
    versions = {
        ["2.7.3"] = {
            digests = {
                ["aarch64-macos"] = "fcb25c42f54298ece8b20684fb3c581ed9195a162cbc55180a4161501be93181",
            },
        },
    },
}
