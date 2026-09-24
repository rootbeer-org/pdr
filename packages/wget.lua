return {
    name = "wget",
    description = "Retrieve files over HTTP, HTTPS, and FTP",
    homepage = "https://www.gnu.org/software/wget/",
    recipe_maintainers = { "tale" },
    default_license = "GPL-3.0-or-later",
    source = {
        url = "https://ftp.gnu.org/gnu/wget/wget-{version}.tar.gz",
        archive = "tar.gz",
        strip_prefix = "wget-{version}",
        patches = {
            "--- a/src/openssl.c\010+++ b/src/openssl.c\010@@ -226,7 +226,7 @@\010       break;\010 \010     case secure_protocol_sslv3:\010-#ifndef OPENSSL_NO_SSL3_METHOD\010+#if !defined(OPENSSL_NO_SSL3_METHOD) && OPENSSL_VERSION_NUMBER < 0x40000000L\010       meth = SSLv3_client_method ();\010 #endif\010       break;\010",
            "--- a/tests/Test-ftp-iri.px\010+++ b/tests/Test-ftp-iri.px\010@@ -2,6 +2,15 @@\010 \010 use strict;\010 use warnings;\010+\010+# APFS cannot represent the byte-oriented filenames used by this test.\010+my $probe_name = \"wget-filename-$$-\\xE7\";\010+open my $probe, '>', $probe_name or do {\010+    exit 77 if $!{EILSEQ};\010+    die \"Cannot probe filename support: $!\";\010+};\010+close $probe;\010+unlink $probe_name;\010 \010 use WgetFeature qw(iri);\010 use FTPTest;\010",
            "--- a/tests/Test-ftp-iri-fallback.px\010+++ b/tests/Test-ftp-iri-fallback.px\010@@ -2,6 +2,15 @@\010 \010 use strict;\010 use warnings;\010+\010+# APFS cannot represent the byte-oriented filenames used by this test.\010+my $probe_name = \"wget-filename-$$-\\xE7\";\010+open my $probe, '>', $probe_name or do {\010+    exit 77 if $!{EILSEQ};\010+    die \"Cannot probe filename support: $!\";\010+};\010+close $probe;\010+unlink $probe_name;\010 \010 use WgetFeature qw(iri);\010 use FTPTest;\010",
            "--- a/tests/Test-ftp-iri-recursive.px\010+++ b/tests/Test-ftp-iri-recursive.px\010@@ -2,6 +2,15 @@\010 \010 use strict;\010 use warnings;\010+\010+# APFS cannot represent the byte-oriented filenames used by this test.\010+my $probe_name = \"wget-filename-$$-\\xE7\";\010+open my $probe, '>', $probe_name or do {\010+    exit 77 if $!{EILSEQ};\010+    die \"Cannot probe filename support: $!\";\010+};\010+close $probe;\010+unlink $probe_name;\010 \010 use WgetFeature qw(iri);\010 use FTPTest;\010",
            "--- a/tests/Test-ftp-iri-disabled.px\010+++ b/tests/Test-ftp-iri-disabled.px\010@@ -2,6 +2,15 @@\010 \010 use strict;\010 use warnings;\010+\010+# APFS cannot represent the byte-oriented filenames used by this test.\010+my $probe_name = \"wget-filename-$$-\\xE7\";\010+open my $probe, '>', $probe_name or do {\010+    exit 77 if $!{EILSEQ};\010+    die \"Cannot probe filename support: $!\";\010+};\010+close $probe;\010+unlink $probe_name;\010 \010 use WgetFeature qw(iri);\010 use FTPTest;\010",
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
                    "LIBPSL_LIBS=\"$(pkg-config --static --libs libpsl)\" LIBIDN2_LIBS=\"$(pkg-config --static --libs libidn2)\" ./configure --prefix=/ --with-ssl=openssl --disable-nls --disable-rpath --disable-pcre --disable-pcre2 --without-libiconv-prefix --without-libunistring-prefix",
                },
            },
            build = {
                { "make", "-j{jobs}" },
            },
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
                    "import http.server\010import pathlib\010import ssl\010import subprocess\010import tempfile\010import threading\010\010wget = str(pathlib.Path('src/wget').resolve())\010payload = b'rootbeer-wget\\n' * 4096\010\010class Handler(http.server.BaseHTTPRequestHandler):\010    def log_message(self, *args):\010        pass\010\010    def do_GET(self):\010        if self.path == '/redirect':\010            self.send_response(302)\010            self.send_header('Location', '/payload')\010            self.end_headers()\010            return\010        if self.path != '/payload':\010            self.send_error(404)\010            return\010        start = int(self.headers.get('Range', 'bytes=0-')[6:].split('-')[0])\010        self.send_response(206 if start else 200)\010        self.send_header('Content-Length', str(len(payload) - start))\010        if start:\010            self.send_header('Content-Range', f'bytes {start}-{len(payload)-1}/{len(payload)}')\010        self.end_headers()\010        self.wfile.write(payload[start:])\010\010with tempfile.TemporaryDirectory() as directory:\010    root = pathlib.Path(directory)\010    def run(*args, success=True):\010        result = subprocess.run([wget, '--no-config', '--no-hsts', '--tries=1', '--timeout=5', '-q', *args], cwd=root, capture_output=True, timeout=15)\010        assert (result.returncode == 0) == success, (args, result.returncode, result.stderr)\010        return result.stdout\010\010    server = http.server.ThreadingHTTPServer(('127.0.0.1', 0), Handler)\010    thread = threading.Thread(target=server.serve_forever, daemon=True)\010    thread.start()\010    url = f'http://127.0.0.1:{server.server_port}'\010    try:\010        assert run('-O-', url + '/redirect') == payload\010        run('-O-', url + '/missing', success=False)\010        (root / 'download').write_bytes(payload[:123])\010        run('-c', '-O', 'download', url + '/payload')\010        assert (root / 'download').read_bytes() == payload\010    finally:\010        server.shutdown()\010        server.server_close()\010\010    certificate = root / 'certificate.pem'\010    key = root / 'key.pem'\010    subprocess.run(['openssl', 'req', '-x509', '-newkey', 'rsa:2048', '-nodes', '-days', '1', '-subj', '/CN=localhost', '-addext', 'subjectAltName=DNS:localhost', '-keyout', str(key), '-out', str(certificate)], check=True, capture_output=True)\010    server = http.server.ThreadingHTTPServer(('127.0.0.1', 0), Handler)\010    context = ssl.SSLContext(ssl.PROTOCOL_TLS_SERVER)\010    context.load_cert_chain(certificate, key)\010    server.socket = context.wrap_socket(server.socket, server_side=True)\010    threading.Thread(target=server.serve_forever, daemon=True).start()\010    url = f'https://localhost:{server.server_port}/payload'\010    try:\010        assert run('--ca-certificate=' + str(certificate), '-O-', url) == payload\010        run('-O-', url, success=False)\010    finally:\010        server.shutdown()\010        server.server_close()\010print('HTTP redirects, resume, errors, and HTTPS certificate validation passed')\010",
                },
            },
            install = {
                { "make", "DESTDIR={prefix}", "install" },
            },
        },
    },
    outputs = {
        bins = { "wget" },
        checks = {
            { "wget", "--version" },
            { "wget", "--help" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "1.25.0",
        },
        ["aarch64-macos"] = {
            default_version = "1.25.0",
        },
        ["x86_64-linux"] = {
            default_version = "1.25.0",
        },
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
