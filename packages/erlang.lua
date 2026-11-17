return {
    name = "erlang",
    description = "Erlang/OTP runtime, compiler, and tools",
    homepage = "https://www.erlang.org/",
    recipe_maintainers = { "tale" },
    default_license = "Apache-2.0",
    upstream = {
        github = "erlang/otp",
        repository_id = 374927,
        tag = "OTP-{version}",
        lines = { by = "major", keep = 2 },
    },
    source = {
        url = "https://github.com/erlang/otp/releases/download/{tag}/otp_src_{version}.tar.gz",
        archive = "tar.gz",
        strip_prefix = "otp_src_{version}",
    },
    build = {
        backend = "custom",
        dependencies = {
            {
                package = "openssl",
                kind = "link_runtime",
            },
            {
                package = "ncurses",
                kind = "link_runtime",
            },
        },
        steps = {
            configure = {
                {
                    "sh",
                    "-c",
                    -- Linux only: without it OTP adds the host openssl directories to the crypto NIF runpath.
                    'case $(uname -s) in Linux) set -- "$@" --with-ssl-rpath={dependencies.openssl}/lib ;; esac; exec ./configure "$@"',
                    "sh",
                    "--prefix={prefix}",
                    "--with-ssl={dependencies.openssl}",
                    "--without-wx",
                    "--without-odbc",
                    "--without-javac",
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
        bins = { "erl", "erlc", "escript", "dialyzer", "epmd", "ct_run", "typer" },
        checks = {
            { "erl", "-noshell", "-eval", 'io:format("~p~n",[1+1]), halt().' },
            {
                "erl",
                "-noshell",
                "-eval",
                'crypto:start(), io:format("~p~n",[crypto:hash(sha256,<<"a">>) =/= <<>>]), halt().',
            },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "29.1.2",
        },
        ["aarch64-macos"] = {
            default_version = "29.1.2",
        },
        ["x86_64-linux"] = {
            default_version = "29.1.2",
        },
    },
    versions = {
        ["28.5.0.8"] = {
            digests = {
                ["aarch64-linux"] = "8a696e15bcbe5d57197b1f4c03c92d415f9fd9af70f9222a05911c8a5463cba6",
                ["aarch64-macos"] = "8a696e15bcbe5d57197b1f4c03c92d415f9fd9af70f9222a05911c8a5463cba6",
                ["x86_64-linux"] = "8a696e15bcbe5d57197b1f4c03c92d415f9fd9af70f9222a05911c8a5463cba6",
            },
        },
        ["29.1.2"] = {
            digests = {
                ["aarch64-linux"] = "c79966661e35fe4aff8ec003db63682e3b33b10b672220d51bf93c0a9244b049",
                ["aarch64-macos"] = "c79966661e35fe4aff8ec003db63682e3b33b10b672220d51bf93c0a9244b049",
                ["x86_64-linux"] = "c79966661e35fe4aff8ec003db63682e3b33b10b672220d51bf93c0a9244b049",
            },
        },
    },
}
