return {
    name = "gettext",
    description = "GNU internationalization tools and libraries",
    homepage = "https://www.gnu.org/software/gettext/",
    recipe_maintainers = { "tale" },
    default_license = "GPL-3.0-or-later",
    upstream = {
        git = "https://git.savannah.gnu.org/git/gettext.git",
        tag = "v{version}",
    },
    source = {
        url = "https://ftp.gnu.org/gnu/gettext/gettext-{version}.tar.xz",
        archive = "tar.xz",
        strip_prefix = "gettext-{version}",
    },
    build = {
        backend = "custom",
        dependencies = {
            {
                package = "libiconv",
                kind = "link_runtime",
            },
            {
                package = "libunistring",
                kind = "link_runtime",
            },
            {
                package = "libxml2",
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
                    "/bin/sh",
                    "./configure",
                    "--prefix={prefix}",
                    "--disable-java",
                    "--disable-csharp",
                    "--disable-acl",
                    "--disable-rpath",
                    "--disable-openmp",
                    "--without-emacs",
                    "--without-git",
                    "--without-cvs",
                    "--with-libiconv-prefix={dependencies.libiconv}",
                    "--with-libunistring-prefix={dependencies.libunistring}",
                    "--with-libxml2-prefix={dependencies.libxml2}",
                    "--with-libncurses-prefix={dependencies.ncurses}",
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
        bins = { "gettext", "msgfmt", "msgunfmt", "msgmerge", "xgettext", "msgcat" },
        checks = {
            { "msgfmt", "--version" },
            {
                "sh",
                "-ec",
                [[
d=$(mktemp -d)
cd "$d"
printf 'msgid ""\nmsgstr "Content-Type: text/plain; charset=UTF-8\\n"\n\nmsgid "hello"\nmsgstr "bonjour"\n' > demo.po
msgfmt -o demo.mo demo.po
msgunfmt demo.mo | grep -q 'msgstr "bonjour"'
]],
            },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "1.0",
        },
        ["aarch64-macos"] = {
            default_version = "1.0",
        },
        ["x86_64-linux"] = {
            default_version = "1.0",
        },
    },
    versions = {
        ["1.0"] = {
            digests = {
                ["aarch64-linux"] = "71132a3fb71e68245b8f2ac4e9e97137d3e5c02f415636eb508ae607bc01add7",
                ["aarch64-macos"] = "71132a3fb71e68245b8f2ac4e9e97137d3e5c02f415636eb508ae607bc01add7",
                ["x86_64-linux"] = "71132a3fb71e68245b8f2ac4e9e97137d3e5c02f415636eb508ae607bc01add7",
            },
        },
    },
}
