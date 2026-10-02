return {
    name = "ldns",
    description = "DNS library and tools, including drill",
    homepage = "https://nlnetlabs.nl/projects/ldns/about/",
    recipe_maintainers = { "tale" },
    default_license = "BSD-3-Clause",
    upstream = {
        github = "NLnetLabs/ldns",
        tag = "release-{version}",
    },
    source = {
        url = "https://nlnetlabs.nl/downloads/ldns/ldns-{version}.tar.gz",
        archive = "tar.gz",
        strip_prefix = "ldns-{version}",
    },
    build = {
        backend = "custom",
        dependencies = {
            {
                package = "openssl",
                version = "4.0.2",
                kind = "link_runtime",
            },
        },
        libraries = { "lib/libldns.a", "lib/libldns.{shared_extension}" },
        steps = {
            configure = {
                {
                    "sh",
                    "./configure",
                    "--prefix=/",
                    "--with-ssl={dependencies.openssl}",
                    "--with-drill",
                    "--with-examples",
                    "--enable-shared",
                    "--enable-static",
                    "--disable-rpath",
                    "--with-ca-path=/etc/ssl/certs",
                },
            },
            build = {
                { "make", "-j{jobs}" },
            },
            -- The release tarball omits upstream's tests, so the check signs and verifies a
            -- zone with the built tools.
            check = {
                {
                    "/bin/sh",
                    "-ec",
                    "printf 'example.com. 3600 IN SOA ns.example.com. admin.example.com. 1 7200 3600 1209600 3600\\nexample.com. 3600 IN NS ns.example.com.\\nns.example.com. 3600 IN A 192.0.2.1\\n' > check.zone; key=$(examples/ldns-keygen -a ED25519 example.com); examples/ldns-signzone check.zone \"$key\"; examples/ldns-verify-zone -k \"$key.ds\" check.zone.signed 2>/dev/null || examples/ldns-verify-zone check.zone.signed; examples/ldns-read-zone check.zone.signed | grep -q RRSIG; drill/drill -v",
                },
            },
            install = {
                { "make", "DESTDIR={prefix}", "install" },
            },
        },
    },
    outputs = {
        bins = {
            "drill",
            "ldns-keygen",
            "ldns-read-zone",
            "ldns-signzone",
            "ldns-verify-zone",
            "ldns-key2ds",
        },
        checks = {
            { "drill", "-v" },
            { "ldns-keygen", "-a", "ED25519", "example.com" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "1.9.2",
        },
        ["aarch64-macos"] = {
            default_version = "1.9.2",
        },
        ["x86_64-linux"] = {
            default_version = "1.9.2",
        },
    },
    versions = {
        ["1.9.2"] = {
            digests = {
                ["aarch64-linux"] = "b524fa21994b6e834200ceb8c27f1b84bda5982fe35706f058196c079db94d5d",
                ["aarch64-macos"] = "b524fa21994b6e834200ceb8c27f1b84bda5982fe35706f058196c079db94d5d",
                ["x86_64-linux"] = "b524fa21994b6e834200ceb8c27f1b84bda5982fe35706f058196c079db94d5d",
            },
        },
    },
}
