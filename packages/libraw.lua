return {
    name = "libraw",
    description = "Camera RAW decoding library",
    homepage = "https://www.libraw.org/",
    recipe_maintainers = { "tale" },
    default_license = "LGPL-2.1-only OR CDDL-1.0",
    upstream = {
        github = "LibRaw/LibRaw",
        repository_id = 979192,
        tag = "{version}",
        exclude_tags = { "*Beta*", "*RC*", "*Release", "*b" },
    },
    source = {
        url = "https://www.libraw.org/data/LibRaw-{version}.tar.gz",
        archive = "tar.gz",
        strip_prefix = "LibRaw-{version}",
    },
    build = {
        backend = "autotools",
        configure = {
            "--enable-static",
            "--enable-shared",
            "--enable-lcms",
            "--enable-jpeg",
            "--enable-zlib",
            "--disable-openmp",
            "--disable-examples",
        },
        dependencies = {
            {
                package = "pkgconf",
                kind = "build",
            },
            {
                package = "lcms2",
                kind = "link_runtime",
            },
            {
                package = "libjpeg-turbo",
                kind = "link_runtime",
            },
            {
                package = "zlib",
                kind = "link_runtime",
            },
        },
        libraries = {
            "lib/libraw.a",
            "lib/libraw_r.a",
            "lib/libraw.{shared_extension}",
            "lib/libraw_r.{shared_extension}",
        },
    },
    outputs = {},
    platforms = {
        ["aarch64-linux"] = {
            default_version = "0.22.3",
        },
        ["aarch64-macos"] = {
            default_version = "0.22.3",
        },
        ["x86_64-linux"] = {
            default_version = "0.22.3",
        },
    },
    versions = {
        ["0.22.3"] = {
            digests = {
                ["aarch64-linux"] = "789f3c33466210a1a0907f747a97c715d21bbf4af712f257fcbbd90111b227e4",
                ["aarch64-macos"] = "789f3c33466210a1a0907f747a97c715d21bbf4af712f257fcbbd90111b227e4",
                ["x86_64-linux"] = "789f3c33466210a1a0907f747a97c715d21bbf4af712f257fcbbd90111b227e4",
            },
        },
    },
}
