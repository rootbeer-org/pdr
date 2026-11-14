return {
    name = "ffmpeg",
    description = "Audio and video converter and processing tools",
    homepage = "https://ffmpeg.org/",
    recipe_maintainers = { "tale" },
    default_license = "LGPL-3.0-or-later",
    upstream = {
        github = "FFmpeg/FFmpeg",
        repository_id = 1614410,
        tag = "n{version}",
        exclude_tags = { "n*-dev*" },
    },
    source = {
        url = "https://ffmpeg.org/releases/ffmpeg-{version}.tar.xz",
        archive = "tar.xz",
        strip_prefix = "ffmpeg-{version}",
    },
    build = {
        backend = "custom",
        dependencies = {
            {
                package = "nasm",
                kind = "build",
            },
            {
                package = "pkgconf",
                kind = "build",
            },
            {
                package = "openssl",
                kind = "link_runtime",
            },
            {
                package = "zlib",
                kind = "link_runtime",
            },
            {
                package = "xz",
                kind = "link",
            },
            {
                package = "bzip2",
                kind = "link_runtime",
            },
        },
        steps = {
            configure = {
                {
                    "/bin/sh",
                    "./configure",
                    "--prefix={prefix}",
                    -- Autodetection would pick up host frameworks and libraries, so every
                    -- external library is named explicitly.
                    "--disable-autodetect",
                    "--disable-debug",
                    "--disable-doc",
                    "--disable-ffplay",
                    "--disable-sdl2",
                    "--disable-xlib",
                    "--disable-libxcb",
                    "--enable-zlib",
                    "--enable-lzma",
                    "--enable-bzlib",
                    "--enable-openssl",
                    "--enable-version3",
                    "--enable-pic",
                    "--enable-static",
                    "--disable-shared",
                },
                -- The configure line is compiled into the binary and names the build paths.
                {
                    "/bin/sh",
                    "-c",
                    "sed 's|^#define FFMPEG_CONFIGURATION .*|#define FFMPEG_CONFIGURATION \"\"|' config.h > config.h.new && mv config.h.new config.h",
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
        bins = { "ffmpeg", "ffprobe" },
        checks = {
            { "ffmpeg", "-version" },
            { "ffprobe", "-version" },
            {
                "ffmpeg",
                "-hide_banner",
                "-f",
                "lavfi",
                "-i",
                "testsrc=duration=1:size=64x64:rate=5",
                "-f",
                "null",
                "-",
            },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "9.0.2",
        },
        ["aarch64-macos"] = {
            default_version = "9.0.2",
        },
        ["x86_64-linux"] = {
            default_version = "9.0.2",
        },
    },
    versions = {
        ["9.0.2"] = {
            digests = {
                ["aarch64-linux"] = "8c3850283eb25fa026482078a04051e0be17347b09ef81a0849bec15a96e002e",
                ["aarch64-macos"] = "8c3850283eb25fa026482078a04051e0be17347b09ef81a0849bec15a96e002e",
                ["x86_64-linux"] = "8c3850283eb25fa026482078a04051e0be17347b09ef81a0849bec15a96e002e",
            },
        },
    },
}
