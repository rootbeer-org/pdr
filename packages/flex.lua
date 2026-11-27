return {
    name = "flex",
    description = "Fast lexical analyzer generator",
    homepage = "https://github.com/westes/flex",
    recipe_maintainers = { "tale" },
    default_license = "BSD-2-Clause",
    upstream = {
        github = "westes/flex",
        repository_id = 14521001,
        tag = "v{version}",
    },
    source = {
        url = "https://github.com/westes/flex/releases/download/{tag}/flex-{version}.tar.gz",
        archive = "tar.gz",
        strip_prefix = "flex-{version}",
    },
    build = {
        backend = "custom",
        dependencies = {
            {
                package = "m4",
                kind = "build",
            },
            {
                -- Flex runs m4 when it generates scanners, so the installed flex must find it by path.
                package = "m4",
                kind = "runtime",
            },
        },
        libraries = { "lib/libfl.a", "lib/libfl.{shared_extension}" },
        steps = {
            configure = {
                {
                    "sh",
                    "./configure",
                    "--prefix={prefix}",
                    "--disable-nls",
                    "M4={dependencies.m4}/bin/m4",
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
        bins = { "flex", "flex++", "lex" },
        checks = {
            { "flex", "--version" },
            {
                "sh",
                "-c",
                [[set -e
d=$(mktemp -d "$TMPDIR/flex-check.XXXXXX")
cd "$d"
printf '%%%%\nhello  printf("rootbeer\\n");\n%%%%\nint main(void) { return yylex(); }\n' > check.l
flex check.l
test -s lex.yy.c]],
            },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "2.7.11",
        },
        ["aarch64-macos"] = {
            default_version = "2.7.11",
        },
        ["x86_64-linux"] = {
            default_version = "2.7.11",
        },
    },
    versions = {
        ["2.7.10"] = {
            digests = {
                ["aarch64-linux"] = "d303c2956792acd8bf3601effef76cadc85a7876852cb66da411c0d5d2f868f4",
                ["aarch64-macos"] = "d303c2956792acd8bf3601effef76cadc85a7876852cb66da411c0d5d2f868f4",
                ["x86_64-linux"] = "d303c2956792acd8bf3601effef76cadc85a7876852cb66da411c0d5d2f868f4",
            },
        },
        ["2.7.11"] = {
            digests = {
                ["aarch64-linux"] = "99a3ede5f61b63bef3136c5cae16d0f453e8d887c18ddc9e50bb01a4db561ace",
                ["aarch64-macos"] = "99a3ede5f61b63bef3136c5cae16d0f453e8d887c18ddc9e50bb01a4db561ace",
                ["x86_64-linux"] = "99a3ede5f61b63bef3136c5cae16d0f453e8d887c18ddc9e50bb01a4db561ace",
            },
        },
    },
}
