return {
    name = "libtiff",
    description = "TIFF image library and tools",
    homepage = "https://libtiff.gitlab.io/libtiff/",
    recipe_maintainers = { "tale" },
    default_license = "libtiff",
    upstream = {
        git = "https://gitlab.com/libtiff/libtiff.git",
        tag = "v{version}",
        exclude_tags = { "v*rc*" },
    },
    source = {
        url = "https://download.osgeo.org/libtiff/tiff-{version}.tar.xz",
        archive = "tar.xz",
        strip_prefix = "tiff-{version}",
    },
    build = {
        backend = "autotools",
        configure = {
            "--enable-static",
            "--enable-shared",
            "--enable-zlib",
            "--enable-jpeg",
            "--enable-lzma",
            "--enable-zstd",
            "--enable-webp",
            "--disable-jbig",
            "--disable-lerc",
            "--disable-libdeflate",
            "--disable-opengl",
            "--disable-docs",
            "--disable-cxx",
        },
        dependencies = {
            {
                package = "zlib",
                kind = "link_runtime",
            },
            {
                package = "libjpeg-turbo",
                kind = "link_runtime",
            },
            {
                package = "xz",
                kind = "link",
            },
            {
                package = "zstd",
                kind = "link_runtime",
            },
            {
                package = "libwebp",
                kind = "link_runtime",
            },
        },
        libraries = { "lib/libtiff.a", "lib/libtiff.{shared_extension}" },
    },
    outputs = {
        bins = {
            "tiffinfo",
            "tiffcp",
            "tiffset",
            "tiffdump",
            "tiffsplit",
            "tiffcmp",
            "tiff2pdf",
            "tiff2ps",
            "tiff2rgba",
            "tiff2bw",
            "tiffcrop",
            "tiffdither",
            "tiffmedian",
            "pal2rgb",
            "ppm2tiff",
            "raw2tiff",
            "fax2tiff",
            "fax2ps",
        },
        checks = {
            { "tiffinfo", "-h" },
            {
                "sh",
                "-c",
                "d=$(mktemp -d) && printf 'SUkqAAgAAAAKAAABAwABAAAAAgAAAAEBAwABAAAAAgAAAAIBAwADAAAAhgAAAAMBAwABAAAAAQAAAAYBAwABAAAAAgAAABEBBAABAAAAjAAAABUBAwABAAAAAwAAABYBAwABAAAAAgAAABcBBAABAAAADAAAABwBAwABAAAAAQAAAAAAAAAIAAgACAD/AAAA/wAAAP////8=' | base64 -d > $d/in.tif && for c in none lzw zstd lzma; do tiffcp -c $c $d/in.tif $d/out.tif && tiffcmp $d/in.tif $d/out.tif && tiffinfo $d/out.tif >/dev/null || exit 1; done && tiffcp -c webp $d/in.tif $d/webp.tif && tiffinfo $d/webp.tif | grep -qi webp && tiff2pdf -o $d/out.pdf $d/in.tif && test -s $d/out.pdf && echo ok",
            },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "4.7.2",
        },
        ["aarch64-macos"] = {
            default_version = "4.7.2",
        },
        ["x86_64-linux"] = {
            default_version = "4.7.2",
        },
    },
    versions = {
        ["4.7.2"] = {
            digests = {
                ["aarch64-linux"] = "4996f0c4f93094719b1ca5c6279b20e588773ba8a247533e486416fb662ddb88",
                ["aarch64-macos"] = "4996f0c4f93094719b1ca5c6279b20e588773ba8a247533e486416fb662ddb88",
                ["x86_64-linux"] = "4996f0c4f93094719b1ca5c6279b20e588773ba8a247533e486416fb662ddb88",
            },
        },
    },
}
