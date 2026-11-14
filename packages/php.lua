return {
    name = "php",
    description = "PHP scripting language, CLI and CGI",
    homepage = "https://www.php.net/",
    recipe_maintainers = { "tale" },
    default_license = "PHP-3.01",
    upstream = {
        github = "php/php-src",
        repository_id = 1903522,
        tag = "php-{version}",
        exclude_tags = { "php-*alpha*", "php-*beta*", "php-*RC*" },
        lines = { by = "minor", keep = 2 },
    },
    source = {
        url = "https://www.php.net/distributions/php-{version}.tar.xz",
        archive = "tar.xz",
        strip_prefix = "php-{version}",
    },
    build = {
        backend = "custom",
        dependencies = {
            {
                package = "pkgconf",
                kind = "build",
            },
            {
                package = "libxml2",
                kind = "link_runtime",
            },
            {
                package = "openssl",
                kind = "link_runtime",
            },
            {
                package = "zlib",
                kind = "link_runtime",
            },
            {
                package = "oniguruma",
                kind = "link_runtime",
            },
            {
                package = "sqlite",
                kind = "link",
            },
            {
                package = "libiconv",
                kind = "link_runtime",
            },
            -- curl is static, so its own libraries are linked here too.
            {
                package = "curl",
                kind = "link",
            },
            {
                package = "brotli",
                kind = "link",
            },
            {
                package = "zstd",
                kind = "link_runtime",
            },
            {
                package = "nghttp2",
                kind = "link",
            },
            {
                package = "nghttp3",
                kind = "link",
            },
            {
                package = "ngtcp2",
                kind = "link",
            },
            {
                package = "libidn2",
                kind = "link_runtime",
            },
            {
                package = "libunistring",
                kind = "link_runtime",
            },
            {
                package = "libpsl",
                kind = "link_runtime",
            },
            {
                package = "libssh2",
                kind = "link",
            },
        },
        steps = {
            configure = {
                -- Static libcurl needs its private libraries, which a plain pkg-config
                -- query leaves out. Configure drops the frameworks among them, so macOS
                -- passes those to the linker itself.
                {
                    "sh",
                    "-c",
                    [[
case "$(uname -s)" in
Darwin) frameworks="-Wl,-framework,SystemConfiguration -Wl,-framework,Security -Wl,-framework,CoreFoundation -Wl,-framework,CoreServices" ;;
*) frameworks= ;;
esac
CURL_LIBS="$(pkgconf --static --libs libcurl)" LDFLAGS="$LDFLAGS $frameworks" exec ./configure "$@"
]],
                    "sh",
                    "--prefix={prefix}",
                    "--with-config-file-path={prefix}/etc",
                    "--enable-mbstring",
                    "--with-openssl",
                    "--with-zlib",
                    "--with-curl",
                    "--enable-bcmath",
                    "--enable-pcntl",
                    "--enable-sockets",
                    "--without-readline",
                    "--without-pear",
                    "--with-iconv={dependencies.libiconv}",
                },
            },
            build = {
                { "make", "-j{jobs}" },
            },
            install = {
                { "make", "install" },
            },
        },
    },
    outputs = {
        bins = { "php", "php-cgi", "phpdbg", "phpize", "php-config", "phar", "phar.phar" },
        checks = {
            { "php", "--version" },
            { "php", "-r", [[echo json_encode(["a" => 1]), PHP_EOL;]] },
            {
                "php",
                "-r",
                [[foreach (["curl", "mbstring", "openssl", "sqlite3", "zlib"] as $e) { if (!extension_loaded($e)) { fwrite(STDERR, $e . PHP_EOL); exit(1); } }]],
            },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "8.5.12",
        },
        ["aarch64-macos"] = {
            default_version = "8.5.12",
        },
        ["x86_64-linux"] = {
            default_version = "8.5.12",
        },
    },
    versions = {
        ["8.4.27"] = {
            digests = {
                ["aarch64-linux"] = "dcf93923b0e38e0d5252b25b796520b5a47761a08b3488b6d0b5d1115764d3f0",
                ["aarch64-macos"] = "dcf93923b0e38e0d5252b25b796520b5a47761a08b3488b6d0b5d1115764d3f0",
                ["x86_64-linux"] = "dcf93923b0e38e0d5252b25b796520b5a47761a08b3488b6d0b5d1115764d3f0",
            },
        },
        ["8.5.12"] = {
            digests = {
                ["aarch64-linux"] = "08bc2eba2a588654ade1357174aa646b761556c862dda0678345ee29ed481209",
                ["aarch64-macos"] = "08bc2eba2a588654ade1357174aa646b761556c862dda0678345ee29ed481209",
                ["x86_64-linux"] = "08bc2eba2a588654ade1357174aa646b761556c862dda0678345ee29ed481209",
            },
        },
    },
}
