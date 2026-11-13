return {
    name = "freetype",
    description = "Font rendering library",
    homepage = "https://freetype.org/",
    recipe_maintainers = { "tale" },
    default_license = "FTL OR GPL-2.0-or-later",
    upstream = {
        git = "https://gitlab.freedesktop.org/freetype/freetype.git",
        tag = "VER-{version}",
        separator = "-",
    },
    source = {
        url = "https://download.savannah.gnu.org/releases/freetype/freetype-{version}.tar.xz",
        archive = "tar.xz",
        strip_prefix = "freetype-{version}",
    },
    build = {
        backend = "custom",
        dependencies = {
            {
                package = "pkgconf",
                kind = "build",
            },
            {
                package = "zlib",
                kind = "link_runtime",
            },
            {
                package = "libpng",
                kind = "link_runtime",
            },
            {
                package = "bzip2",
                kind = "link_runtime",
            },
            {
                package = "brotli",
                kind = "link_runtime",
            },
        },
        libraries = { "lib/libfreetype.a", "lib/libfreetype.{shared_extension}" },
        steps = {
            configure = {
                {
                    "/bin/sh",
                    "./configure",
                    "--prefix={prefix}",
                    "--enable-static",
                    "--enable-shared",
                    "--with-zlib=yes",
                    "--with-png=yes",
                    "--with-bzip2=yes",
                    "--with-brotli=yes",
                    "--with-harfbuzz=no",
                    "--enable-freetype-config",
                    -- pkg-config reports only libbrotlidec for the decoder, but it also needs libbrotlicommon when linked.
                    "BROTLI_LIBS=-lbrotlidec -lbrotlicommon",
                },
            },
            build = {
                { "make", "-j{jobs}" },
            },
            check = {
                { "make", "check" },
            },
            install = {
                { "make", "install" },
            },
        },
    },
    outputs = {
        bins = { "freetype-config" },
        checks = {
            { "freetype-config", "--ftversion" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "2.15.0",
        },
        ["aarch64-macos"] = {
            default_version = "2.15.0",
        },
        ["x86_64-linux"] = {
            default_version = "2.15.0",
        },
    },
    versions = {
        ["2.15.0"] = {
            digests = {
                ["aarch64-linux"] = "93cd47eb719c325107f2d3cf087d06299e944c3b48a40b55537302304dea1dd5",
                ["aarch64-macos"] = "93cd47eb719c325107f2d3cf087d06299e944c3b48a40b55537302304dea1dd5",
                ["x86_64-linux"] = "93cd47eb719c325107f2d3cf087d06299e944c3b48a40b55537302304dea1dd5",
            },
        },
    },
}
