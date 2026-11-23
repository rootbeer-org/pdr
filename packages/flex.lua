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
            default_version = "2.7.6",
        },
        ["aarch64-macos"] = {
            default_version = "2.7.6",
        },
        ["x86_64-linux"] = {
            default_version = "2.7.6",
        },
    },
    versions = {
        ["2.7.3"] = {
            digests = {
                ["aarch64-linux"] = "b18bbc3622b2b9ebecd0423f4e110adfad8db51d0c5ada3f26660c7cb7c735ec",
                ["aarch64-macos"] = "b18bbc3622b2b9ebecd0423f4e110adfad8db51d0c5ada3f26660c7cb7c735ec",
                ["x86_64-linux"] = "b18bbc3622b2b9ebecd0423f4e110adfad8db51d0c5ada3f26660c7cb7c735ec",
            },
        },
        ["2.7.6"] = {
            digests = {
                ["aarch64-linux"] = "d7aedd600702e6a42d221f799bcd10c274254fbfafab49b6fb9c03573e3d92de",
                ["aarch64-macos"] = "d7aedd600702e6a42d221f799bcd10c274254fbfafab49b6fb9c03573e3d92de",
                ["x86_64-linux"] = "d7aedd600702e6a42d221f799bcd10c274254fbfafab49b6fb9c03573e3d92de",
            },
        },
    },
}
