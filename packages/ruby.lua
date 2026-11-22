return {
    name = "ruby",
    description = "Ruby interpreter and standard library",
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
            default_version = "4.0.10",
        },
        ["aarch64-macos"] = {
            default_version = "4.0.10",
        },
        ["x86_64-linux"] = {
            default_version = "4.0.10",
        },
    },
    versions = {
        ["4.0.10"] = {
            digests = {
                ["aarch64-linux"] = "1537f7a6003c436546ecab6b48b6e7725a9af2328f45a8af7f42f41c5df90ab8",
                ["aarch64-macos"] = "1537f7a6003c436546ecab6b48b6e7725a9af2328f45a8af7f42f41c5df90ab8",
                ["x86_64-linux"] = "1537f7a6003c436546ecab6b48b6e7725a9af2328f45a8af7f42f41c5df90ab8",
            },
        },
    },
}
