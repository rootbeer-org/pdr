return {
    name = "libwebp",
    description = "WebP image codec library and tools",
    homepage = "https://developers.google.com/speed/webp",
    recipe_maintainers = { "tale" },
    default_license = "BSD-3-Clause",
    upstream = {
        github = "webmproject/libwebp",
        repository_id = 23368445,
        tag = "v{version}",
        exclude_tags = { "v*rc*" },
    },
    source = {
        url = "https://storage.googleapis.com/downloads.webmproject.org/releases/webp/libwebp-{version}.tar.gz",
        archive = "tar.gz",
        strip_prefix = "libwebp-{version}",
    },
    build = {
        backend = "autotools",
        configure = {
            "--enable-static",
            "--enable-shared",
            "--enable-libwebpmux",
            "--enable-libwebpdemux",
            "--enable-libwebpdecoder",
            "--enable-png",
            "--enable-jpeg",
            "--disable-tiff",
            "--disable-gif",
            "--disable-gl",
            "--disable-sdl",
            "--disable-wic",
        },
        dependencies = {
            {
                package = "libpng",
                kind = "link_runtime",
            },
            {
                package = "libjpeg-turbo",
                kind = "link_runtime",
            },
        },
        libraries = {
            "lib/libwebp.a",
            "lib/libwebp.{shared_extension}",
            "lib/libwebpmux.a",
            "lib/libwebpmux.{shared_extension}",
            "lib/libwebpdemux.a",
            "lib/libwebpdemux.{shared_extension}",
            "lib/libwebpdecoder.a",
            "lib/libwebpdecoder.{shared_extension}",
            "lib/libsharpyuv.a",
            "lib/libsharpyuv.{shared_extension}",
        },
    },
    outputs = {
        bins = { "cwebp", "dwebp", "webpmux", "webpinfo", "img2webp" },
        checks = {
            { "cwebp", "-version" },
            { "dwebp", "-version" },
            {
                "sh",
                "-c",
                "d=$(mktemp -d) && printf 'iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mNkYPhfDwAChwGA60e6kgAAAABJRU5ErkJggg==' | base64 -d > $d/in.png && cwebp -q 80 $d/in.png -o $d/out.webp >/dev/null 2>&1 && webpinfo $d/out.webp >/dev/null 2>&1 && dwebp $d/out.webp -o $d/back.png >/dev/null 2>&1 && test -s $d/back.png && echo ok",
            },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "1.6.0",
        },
        ["aarch64-macos"] = {
            default_version = "1.6.0",
        },
        ["x86_64-linux"] = {
            default_version = "1.6.0",
        },
    },
    versions = {
        ["1.6.0"] = {
            digests = {
                ["aarch64-linux"] = "e4ab7009bf0629fd11982d4c2aa83964cf244cffba7347ecd39019a9e38c4564",
                ["aarch64-macos"] = "e4ab7009bf0629fd11982d4c2aa83964cf244cffba7347ecd39019a9e38c4564",
                ["x86_64-linux"] = "e4ab7009bf0629fd11982d4c2aa83964cf244cffba7347ecd39019a9e38c4564",
            },
        },
    },
}
