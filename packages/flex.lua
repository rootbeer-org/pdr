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
            default_version = "2.7.9",
        },
        ["aarch64-macos"] = {
            default_version = "2.7.9",
        },
        ["x86_64-linux"] = {
            default_version = "2.7.9",
        },
    },
    versions = {
        ["2.7.8"] = {
            digests = {
                ["aarch64-linux"] = "88d80ba91c8f89251cdbef92b4cac598e87ee782a9467eff47715aeac92d6d86",
                ["aarch64-macos"] = "88d80ba91c8f89251cdbef92b4cac598e87ee782a9467eff47715aeac92d6d86",
                ["x86_64-linux"] = "88d80ba91c8f89251cdbef92b4cac598e87ee782a9467eff47715aeac92d6d86",
            },
        },
        ["2.7.9"] = {
            digests = {
                ["aarch64-linux"] = "eda7d158abe845c49956554488a0749a637891124824a77ab16dadbe0ce58eb7",
                ["aarch64-macos"] = "eda7d158abe845c49956554488a0749a637891124824a77ab16dadbe0ce58eb7",
                ["x86_64-linux"] = "eda7d158abe845c49956554488a0749a637891124824a77ab16dadbe0ce58eb7",
            },
        },
    },
}
