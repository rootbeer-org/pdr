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
            default_version = "29.1.3",
        },
        ["aarch64-macos"] = {
            default_version = "29.1.3",
        },
        ["x86_64-linux"] = {
            default_version = "29.1.3",
        },
    },
    versions = {
        ["28.5.0.9"] = {
            digests = {
                ["aarch64-linux"] = "3ecc6abcaed81fa45f17aabe7677136aaf53247d533727fe51a778c369d2142c",
                ["aarch64-macos"] = "3ecc6abcaed81fa45f17aabe7677136aaf53247d533727fe51a778c369d2142c",
                ["x86_64-linux"] = "3ecc6abcaed81fa45f17aabe7677136aaf53247d533727fe51a778c369d2142c",
            },
        },
        ["29.1.3"] = {
            digests = {
                ["aarch64-linux"] = "44d8ee7f0964537ddb328fe2f6307d3338c3fdd1b2826938d490907771ba70d2",
                ["aarch64-macos"] = "44d8ee7f0964537ddb328fe2f6307d3338c3fdd1b2826938d490907771ba70d2",
                ["x86_64-linux"] = "44d8ee7f0964537ddb328fe2f6307d3338c3fdd1b2826938d490907771ba70d2",
            },
        },
    },
}
