return {
    name = "elixir",
    description = "Functional language that runs on the Erlang VM",
    homepage = "https://elixir-lang.org/",
    recipe_maintainers = { "tale" },
    default_license = "Apache-2.0",
    upstream = {
        github = "elixir-lang/elixir",
        repository_id = 1234714,
        tag = "v{version}",
    },
    source = {
        url = "https://github.com/elixir-lang/elixir/archive/refs/tags/{tag}.tar.gz",
        archive = "tar.gz",
        strip_prefix = "elixir-{version}",
    },
    build = {
        backend = "custom",
        dependencies = {
            {
                package = "erlang",
                kind = "build",
            },
            {
                package = "erlang",
                kind = "runtime",
            },
        },
        steps = {
            build = {
                { "make", "compile" },
            },
            install = {
                { "make", "install", "PREFIX={prefix}" },
                -- The launchers run erl from PATH at run time, so point them at the catalog's erl.
                {
                    "sh",
                    "-c",
                    [[for name in elixir elixirc iex; do f="$2/lib/elixir/bin/$name"; sed "s|^ERTS_BIN=\$|ERTS_BIN=$1/bin/|" "$f" > "$f.tmp" && cat "$f.tmp" > "$f" && rm "$f.tmp"; done]],
                    "sh",
                    "{dependencies.erlang}",
                    "{prefix}",
                },
                -- mix is an escript, and its shebang needs elixir on PATH and fails under a bare
                -- /usr/bin:/bin PATH, so bin/mix becomes a wrapper that runs the installed elixir.
                {
                    "sh",
                    "-c",
                    [[rm -f "$1/bin/mix" && printf '#!/bin/sh\nexec "%s/bin/elixir" "%s/lib/elixir/bin/mix" "$@"\n' "$1" "$1" > "$1/bin/mix" && chmod 755 "$1/bin/mix"]],
                    "sh",
                    "{prefix}",
                },
            },
        },
    },
    outputs = {
        bins = { "elixir", "elixirc", "iex", "mix" },
        checks = {
            { "elixir", "--version" },
            { "elixir", "-e", "IO.puts(1 + 1)" },
            { "mix", "--version" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "1.20.5",
        },
        ["aarch64-macos"] = {
            default_version = "1.20.5",
        },
        ["x86_64-linux"] = {
            default_version = "1.20.5",
        },
    },
    versions = {
        ["1.20.5"] = {
            digests = {
                ["aarch64-linux"] = "3d99f2e129418800817e0e5a3ce4812c34537a32d50e37578189e90c79de7062",
                ["aarch64-macos"] = "3d99f2e129418800817e0e5a3ce4812c34537a32d50e37578189e90c79de7062",
                ["x86_64-linux"] = "3d99f2e129418800817e0e5a3ce4812c34537a32d50e37578189e90c79de7062",
            },
        },
    },
}
