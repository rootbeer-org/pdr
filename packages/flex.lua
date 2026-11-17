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
                -- Flex runs m4 when it generates scanners, so the installed flex must find it by path.
                package = "m4",
                kind = "all",
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
            default_version = "2.6.15",
        },
        ["aarch64-macos"] = {
            default_version = "2.6.15",
        },
        ["x86_64-linux"] = {
            default_version = "2.6.15",
        },
    },
    versions = {
        ["2.6.13"] = {
            digests = {
                ["aarch64-linux"] = "a54de3a79dc191d9d9a3acd07b8981be160d1be588261ef7687ccfdaeb1190ed",
                ["aarch64-macos"] = "a54de3a79dc191d9d9a3acd07b8981be160d1be588261ef7687ccfdaeb1190ed",
                ["x86_64-linux"] = "a54de3a79dc191d9d9a3acd07b8981be160d1be588261ef7687ccfdaeb1190ed",
            },
        },
        ["2.6.15"] = {
            digests = {
                ["aarch64-linux"] = "ba38801d12d38782e36f2ddd66c118aa9ed3cbed9849194c4e68d9894cd739d9",
                ["aarch64-macos"] = "ba38801d12d38782e36f2ddd66c118aa9ed3cbed9849194c4e68d9894cd739d9",
                ["x86_64-linux"] = "ba38801d12d38782e36f2ddd66c118aa9ed3cbed9849194c4e68d9894cd739d9",
            },
        },
    },
}
