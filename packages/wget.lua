return {
    name = "wget",
    description = "Retrieve files over HTTP, HTTPS, and FTP",
    homepage = "https://www.gnu.org/software/wget/",
    default_license = "NOASSERTION",
    source = {
        url = "https://ftp.gnu.org/gnu/wget/wget-{version}.tar.gz",
        archive = "tar.gz",
        strip_prefix = "wget-{version}",
        patches = {
            "--- a/src/openssl.c\n+++ b/src/openssl.c\n@@ -226,7 +226,7 @@\n       break;\n \n     case secure_protocol_sslv3:\n-#ifndef OPENSSL_NO_SSL3_METHOD\n+#if !defined(OPENSSL_NO_SSL3_METHOD) && OPENSSL_VERSION_NUMBER < 0x40000000L\n       meth = SSLv3_client_method ();\n #endif\n       break;\n",
            '--- a/tests/Test-ftp-iri.px\n+++ b/tests/Test-ftp-iri.px\n@@ -2,6 +2,15 @@\n \n use strict;\n use warnings;\n+\n+# APFS cannot represent the byte-oriented filenames used by this test.\n+my $probe_name = "wget-filename-$$-\\xE7";\n+open my $probe, \'>\', $probe_name or do {\n+    exit 77 if $!{EILSEQ};\n+    die "Cannot probe filename support: $!";\n+};\n+close $probe;\n+unlink $probe_name;\n \n use WgetFeature qw(iri);\n use FTPTest;\n',
            '--- a/tests/Test-ftp-iri-fallback.px\n+++ b/tests/Test-ftp-iri-fallback.px\n@@ -2,6 +2,15 @@\n \n use strict;\n use warnings;\n+\n+# APFS cannot represent the byte-oriented filenames used by this test.\n+my $probe_name = "wget-filename-$$-\\xE7";\n+open my $probe, \'>\', $probe_name or do {\n+    exit 77 if $!{EILSEQ};\n+    die "Cannot probe filename support: $!";\n+};\n+close $probe;\n+unlink $probe_name;\n \n use WgetFeature qw(iri);\n use FTPTest;\n',
            '--- a/tests/Test-ftp-iri-recursive.px\n+++ b/tests/Test-ftp-iri-recursive.px\n@@ -2,6 +2,15 @@\n \n use strict;\n use warnings;\n+\n+# APFS cannot represent the byte-oriented filenames used by this test.\n+my $probe_name = "wget-filename-$$-\\xE7";\n+open my $probe, \'>\', $probe_name or do {\n+    exit 77 if $!{EILSEQ};\n+    die "Cannot probe filename support: $!";\n+};\n+close $probe;\n+unlink $probe_name;\n \n use WgetFeature qw(iri);\n use FTPTest;\n',
            '--- a/tests/Test-ftp-iri-disabled.px\n+++ b/tests/Test-ftp-iri-disabled.px\n@@ -2,6 +2,15 @@\n \n use strict;\n use warnings;\n+\n+# APFS cannot represent the byte-oriented filenames used by this test.\n+my $probe_name = "wget-filename-$$-\\xE7";\n+open my $probe, \'>\', $probe_name or do {\n+    exit 77 if $!{EILSEQ};\n+    die "Cannot probe filename support: $!";\n+};\n+close $probe;\n+unlink $probe_name;\n \n use WgetFeature qw(iri);\n use FTPTest;\n',
        },
    },
    build = {
        backend = "custom",
        dependencies = {
            "openssl@4.0.2",
            "libpsl@0.23.3",
            "libidn2@2.3.8",
            "libiconv@1.19",
            "libunistring@1.4.2",
            "zlib@1.3.2",
            "pkgconf@3.0.7",
        },
        steps = {
            configure = {
                {
                    "/bin/sh",
                    "-ec",
                    'LIBPSL_LIBS="$(pkg-config --static --libs libpsl)" LIBIDN2_LIBS="$(pkg-config --static --libs libidn2)" ./configure --prefix=/ --with-ssl=openssl --disable-nls --disable-rpath --disable-pcre --disable-pcre2 --without-libiconv-prefix --without-libunistring-prefix',
                },
            },
            build = { { "make", "-j{jobs}" } },
            check = {
                { "make", "-C", "lib", "check" },
                {
                    "/bin/sh",
                    "-ec",
                    "cd tests; make check TESTS=\"unit-tests $(printf '%s ' Test-ftp*.px)\"",
                },
                {
                    "python3",
                    "-c",
                    "import http.server\nimport pathlib\nimport ssl\nimport subprocess\nimport tempfile\nimport threading\n\nwget = str(pathlib.Path('src/wget').resolve())\npayload = b'rootbeer-wget\\n' * 4096\n\nclass Handler(http.server.BaseHTTPRequestHandler):\n    def log_message(self, *args):\n        pass\n\n    def do_GET(self):\n        if self.path == '/redirect':\n            self.send_response(302)\n            self.send_header('Location', '/payload')\n            self.end_headers()\n            return\n        if self.path != '/payload':\n            self.send_error(404)\n            return\n        start = int(self.headers.get('Range', 'bytes=0-')[6:].split('-')[0])\n        self.send_response(206 if start else 200)\n        self.send_header('Content-Length', str(len(payload) - start))\n        if start:\n            self.send_header('Content-Range', f'bytes {start}-{len(payload)-1}/{len(payload)}')\n        self.end_headers()\n        self.wfile.write(payload[start:])\n\nwith tempfile.TemporaryDirectory() as directory:\n    root = pathlib.Path(directory)\n    def run(*args, success=True):\n        result = subprocess.run([wget, '--no-config', '--no-hsts', '--tries=1', '--timeout=5', '-q', *args], cwd=root, capture_output=True, timeout=15)\n        assert (result.returncode == 0) == success, (args, result.returncode, result.stderr)\n        return result.stdout\n\n    server = http.server.ThreadingHTTPServer(('127.0.0.1', 0), Handler)\n    thread = threading.Thread(target=server.serve_forever, daemon=True)\n    thread.start()\n    url = f'http://127.0.0.1:{server.server_port}'\n    try:\n        assert run('-O-', url + '/redirect') == payload\n        run('-O-', url + '/missing', success=False)\n        (root / 'download').write_bytes(payload[:123])\n        run('-c', '-O', 'download', url + '/payload')\n        assert (root / 'download').read_bytes() == payload\n    finally:\n        server.shutdown()\n        server.server_close()\n\n    certificate = root / 'certificate.pem'\n    key = root / 'key.pem'\n    subprocess.run(['openssl', 'req', '-x509', '-newkey', 'rsa:2048', '-nodes', '-days', '1', '-subj', '/CN=localhost', '-addext', 'subjectAltName=DNS:localhost', '-keyout', str(key), '-out', str(certificate)], check=True, capture_output=True)\n    server = http.server.ThreadingHTTPServer(('127.0.0.1', 0), Handler)\n    context = ssl.SSLContext(ssl.PROTOCOL_TLS_SERVER)\n    context.load_cert_chain(certificate, key)\n    server.socket = context.wrap_socket(server.socket, server_side=True)\n    threading.Thread(target=server.serve_forever, daemon=True).start()\n    url = f'https://localhost:{server.server_port}/payload'\n    try:\n        assert run('--ca-certificate=' + str(certificate), '-O-', url) == payload\n        run('-O-', url, success=False)\n    finally:\n        server.shutdown()\n        server.server_close()\nprint('HTTP redirects, resume, errors, and HTTPS certificate validation passed')\n",
                },
            },
            install = { { "make", "DESTDIR={prefix}", "install" } },
        },
    },
    outputs = { bins = { "wget" }, checks = { { "wget", "--version" }, { "wget", "--help" } } },
    platforms = {
        ["aarch64-linux"] = { default_version = "1.25.0" },
        ["aarch64-macos"] = { default_version = "1.25.0" },
        ["x86_64-linux"] = { default_version = "1.25.0" },
    },
    versions = {
        ["1.25.0"] = {
            digests = {
                ["aarch64-linux"] = "766e48423e79359ea31e41db9e5c289675947a7fcf2efdcedb726ac9d0da3784",
                ["aarch64-macos"] = "766e48423e79359ea31e41db9e5c289675947a7fcf2efdcedb726ac9d0da3784",
                ["x86_64-linux"] = "766e48423e79359ea31e41db9e5c289675947a7fcf2efdcedb726ac9d0da3784",
            },
            revision = 2,
        },
    },
}
