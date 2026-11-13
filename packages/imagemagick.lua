return {
    name = "imagemagick",
    description = "Create, edit, and convert bitmap images",
    homepage = "https://imagemagick.org/",
    recipe_maintainers = { "tale" },
    default_license = "ImageMagick",
    upstream = {
        github = "ImageMagick/ImageMagick",
        repository_id = 35780977,
        tag = "{version}",
    },
    source = {
        url = "https://github.com/ImageMagick/ImageMagick/archive/refs/tags/{tag}.tar.gz",
        archive = "tar.gz",
        strip_prefix = "ImageMagick-{version}",
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
                package = "bzip2",
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
                package = "libpng",
                kind = "link_runtime",
            },
            {
                package = "libjpeg-turbo",
                kind = "link_runtime",
            },
            {
                package = "libtiff",
                kind = "link_runtime",
            },
            {
                package = "libwebp",
                kind = "link_runtime",
            },
            {
                package = "freetype",
                kind = "link_runtime",
            },
            {
                package = "lcms2",
                kind = "link_runtime",
            },
            {
                package = "openjpeg",
                kind = "link_runtime",
            },
            {
                package = "libxml2",
                kind = "link_runtime",
            },
            {
                package = "libheif",
                kind = "link_runtime",
            },
            {
                package = "libjxl",
                kind = "link_runtime",
            },
            {
                package = "libraw",
                kind = "link_runtime",
            },
            {
                package = "openexr",
                kind = "link_runtime",
            },
            {
                package = "fontconfig",
                kind = "link_runtime",
            },
            {
                package = "libde265",
                kind = "link_runtime",
            },
            {
                package = "aom",
                kind = "link_runtime",
            },
            {
                package = "kvazaar",
                kind = "link_runtime",
            },
            {
                package = "imath",
                kind = "link_runtime",
            },
            {
                package = "libdeflate",
                kind = "link_runtime",
            },
            {
                package = "highway",
                kind = "link_runtime",
            },
            {
                package = "brotli",
                kind = "link_runtime",
            },
        },
        libraries = {
            "lib/libMagickCore-7.Q16HDRI.a",
            "lib/libMagickCore-7.Q16HDRI.{shared_extension}",
            "lib/libMagickWand-7.Q16HDRI.a",
            "lib/libMagickWand-7.Q16HDRI.{shared_extension}",
            "lib/libMagick++-7.Q16HDRI.a",
            "lib/libMagick++-7.Q16HDRI.{shared_extension}",
        },
        steps = {
            configure = {
                {
                    "/bin/sh",
                    "./configure",
                    "--prefix={prefix}",
                    "--enable-shared",
                    "--enable-static",
                    "--without-modules",
                    "--disable-docs",
                    "--disable-dependency-tracking",
                    "--enable-hdri",
                    "--with-quantum-depth=16",
                    "--disable-openmp",
                    "--without-x",
                    "--without-perl",
                    "--with-magick-plus-plus",
                    "--with-fontconfig",
                    "--without-gslib",
                    "--without-gvc",
                    "--with-heic",
                    "--with-jxl",
                    "--with-raw",
                    "--with-openexr",
                    "--without-pango",
                    "--without-rsvg",
                    "--without-djvu",
                    "--without-fftw",
                    "--without-lqr",
                    "--without-wmf",
                    "--without-raqm",
                    "--without-jbig",
                    "--without-dps",
                    "--without-fpx",
                    "--without-flif",
                    "--without-zip",
                    "--without-ltdl",
                    "--without-autotrace",
                    "--without-dmr",
                    "--without-uhdr",
                    "--with-zlib",
                    "--with-bzlib",
                    "--with-lzma",
                    "--with-zstd",
                    "--with-png",
                    "--with-jpeg",
                    "--with-tiff",
                    "--with-webp",
                    "--with-freetype",
                    "--with-lcms",
                    "--with-openjp2",
                    "--with-xml",
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
        bins = {
            "magick",
            "convert",
            "identify",
            "mogrify",
            "composite",
            "montage",
            "compare",
            "stream",
            "conjure",
            "magick-script",
        },
        checks = {
            { "magick", "-version" },
            -- kvazaar only encodes 8-bit, and the Q16 build reads the PNG as 16-bit.
            {
                "sh",
                "-c",
                "d=$(mktemp -d) && magick -size 32x32 gradient:red-blue $d/a.png && magick $d/a.png -resize 16x16 $d/b.jpg && magick $d/b.jpg $d/c.webp && magick $d/c.webp $d/d.tiff && magick identify $d/d.tiff | grep -q 16x16 && magick $d/d.tiff $d/e.jxl && magick $d/e.jxl $d/f.avif && magick $d/f.avif $d/g.exr && magick identify $d/g.exr | grep -q 16x16 && magick $d/a.png -depth 8 $d/h.heic && magick identify $d/h.heic | grep -q 32x32 && echo ok",
            },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "7.1.2-35",
        },
        ["aarch64-macos"] = {
            default_version = "7.1.2-35",
        },
        ["x86_64-linux"] = {
            default_version = "7.1.2-35",
        },
    },
    versions = {
        ["7.1.2-35"] = {
            digests = {
                ["aarch64-linux"] = "40b6fefa88fe16ca5a4b3d3db5133eaebfb0157f21f98530bde8aec5dd5b0776",
                ["aarch64-macos"] = "40b6fefa88fe16ca5a4b3d3db5133eaebfb0157f21f98530bde8aec5dd5b0776",
                ["x86_64-linux"] = "40b6fefa88fe16ca5a4b3d3db5133eaebfb0157f21f98530bde8aec5dd5b0776",
            },
        },
    },
}
