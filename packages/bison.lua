return {
    name = "bison",
    description = "GNU parser generator",
    homepage = "https://www.gnu.org/software/bison/",
    recipe_maintainers = { "tale" },
    default_license = "GPL-3.0-or-later",
    upstream = {
        git = "https://git.savannah.gnu.org/git/bison.git",
        tag = "v{version}",
    },
    source = {
        url = "https://ftp.gnu.org/gnu/bison/bison-{version}.tar.xz",
        archive = "tar.xz",
        strip_prefix = "bison-{version}",
    },
    build = {
        -- Bison shells out to m4 at run time, so it is pointed at the catalog m4 rather than PATH.
        backend = "custom",
        dependencies = {
            {
                package = "m4",
                kind = "build",
            },
            {
                package = "m4",
                kind = "runtime",
            },
        },
        libraries = { "lib/liby.a" },
        steps = {
            configure = {
                {
                    "/bin/sh",
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
        bins = { "bison", "yacc" },
        checks = {
            { "bison", "--version" },
            {
                "sh",
                "-c",
                [[d=$(mktemp -d) && cd "$d" && cat > g.y <<'EOF'
%token A
%%
start: A ;
EOF
bison g.y && test -s g.tab.c]],
            },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "3.8.2",
        },
        ["aarch64-macos"] = {
            default_version = "3.8.2",
        },
        ["x86_64-linux"] = {
            default_version = "3.8.2",
        },
    },
    versions = {
        ["3.8.2"] = {
            digests = {
                ["aarch64-linux"] = "9bba0214ccf7f1079c5d59210045227bcf619519840ebfa80cd3849cff5a5bf2",
                ["aarch64-macos"] = "9bba0214ccf7f1079c5d59210045227bcf619519840ebfa80cd3849cff5a5bf2",
                ["x86_64-linux"] = "9bba0214ccf7f1079c5d59210045227bcf619519840ebfa80cd3849cff5a5bf2",
            },
        },
    },
}
