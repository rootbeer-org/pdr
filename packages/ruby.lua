return {
    name = "ruby",
    description = "Dynamic, object-oriented programming language",
    homepage = "https://www.ruby-lang.org",
    recipe_maintainers = { "tale" },
    default_license = "Ruby OR BSD-2-Clause",
    upstream = {
        github = "ruby/ruby",
        repository_id = 538746,
        tag = "v{version}",
        lines = { by = "minor", keep = 2 },
    },
    source = {
        url = "https://cache.ruby-lang.org/pub/ruby/{major}.{minor}/ruby-{version}.tar.xz",
        archive = "tar.xz",
        strip_prefix = "ruby-{version}",
    },
    build = {
        backend = "custom",
        dependencies = {
            {
                package = "openssl",
                kind = "link_runtime",
            },
            {
                package = "zlib",
                kind = "link_runtime",
            },
            {
                package = "libyaml",
                kind = "link_runtime",
            },
            {
                package = "libffi",
                kind = "link_runtime",
            },
        },
        libraries = { "lib/libruby.{shared_extension}" },
        steps = {
            configure = {
                {
                    "./configure",
                    "--prefix={prefix}",
                    "--enable-shared",
                    "--disable-install-doc",
                    "--without-gmp",
                    "--with-openssl-dir={dependencies.openssl}",
                    "--with-libyaml-dir={dependencies.libyaml}",
                    "--with-libffi-dir={dependencies.libffi}",
                    "--with-zlib-dir={dependencies.zlib}",
                    -- Keeps the host libcrypt.so.1 out of the link; ruby uses its bundled crypt().
                    "ac_cv_lib_crypt_crypt=no",
                    -- The sandbox links with -Wl,-S, which breaks miniruby at startup when built with -g.
                    "debugflags=",
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
        bins = {
            "ruby",
            "gem",
            "irb",
            "bundle",
            "bundler",
            "rake",
            "rdoc",
            "ri",
            "erb",
            "racc",
            "rbs",
            "rdbg",
            "typeprof",
            "minitest",
            "syntax_suggest",
            "test-unit",
        },
        checks = {
            { "ruby", "--version" },
            {
                "ruby",
                "-e",
                'require "openssl"; require "psych"; require "zlib"; require "fiddle"; puts OpenSSL::OPENSSL_LIBRARY_VERSION',
            },
            { "gem", "--version" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "4.0.9",
        },
        ["aarch64-macos"] = {
            default_version = "4.0.9",
        },
        ["x86_64-linux"] = {
            default_version = "4.0.9",
        },
    },
    versions = {
        ["4.0.9"] = {
            digests = {
                ["aarch64-linux"] = "a8057adb39f51ad6dc3106237504c93dd792bb515837b4fe7817ae21ed7e51f4",
                ["aarch64-macos"] = "a8057adb39f51ad6dc3106237504c93dd792bb515837b4fe7817ae21ed7e51f4",
                ["x86_64-linux"] = "a8057adb39f51ad6dc3106237504c93dd792bb515837b4fe7817ae21ed7e51f4",
            },
        },
    },
}
