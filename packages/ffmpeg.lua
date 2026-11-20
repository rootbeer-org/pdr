return {
    name = "ffmpeg",
    description = "Audio and video converter and processing tools",
    homepage = "https://ffmpeg.org/",
    recipe_maintainers = { "tale" },
    default_license = "GPL-3.0-or-later",
    upstream = {
        github = "FFmpeg/FFmpeg",
        repository_id = 1614410,
        tag = "n{version}",
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
            {
                package = "aom",
                kind = "link_runtime",
            },
            {
                package = "dav1d",
                kind = "link_runtime",
            },
            {
                package = "lame",
                kind = "link_runtime",
            },
            {
                package = "libogg",
                kind = "link_runtime",
            },
            {
                package = "libvorbis",
                kind = "link_runtime",
            },
            {
                package = "libvpx",
                kind = "link",
            },
            {
                package = "libwebp",
                kind = "link_runtime",
            },
            {
                package = "opus",
                kind = "link_runtime",
            },
            {
                package = "svt-av1",
                kind = "link_runtime",
            },
            {
                package = "x264",
                kind = "link_runtime",
            },
            {
                package = "x265",
                kind = "link_runtime",
            },
        },
        steps = {
            configure = {
                -- macOS also gets its hardware codecs, which are system frameworks.
                {
                    "/bin/sh",
                    "-c",
                    'case "$(uname -s)" in Darwin) set -- "$@" --enable-videotoolbox --enable-audiotoolbox ;; esac; exec /bin/sh ./configure "$@"',
                    "sh",
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
                    -- x264 and x265 are GPL, which makes the whole build GPL.
                    "--enable-gpl",
                    "--enable-version3",
                    "--enable-libaom",
                    "--enable-libdav1d",
                    "--enable-libmp3lame",
                    "--enable-libopus",
                    "--enable-libsvtav1",
                    "--enable-libvorbis",
                    "--enable-libvpx",
                    "--enable-libwebp",
                    "--enable-libx264",
                    "--enable-libx265",
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
            -- Each external encoder writes a file that ffprobe then reads back.
            {
                "/bin/sh",
                "-c",
                [[
set -e
d=$(mktemp -d)
video="-f lavfi -i testsrc=duration=1:size=64x64:rate=5 -pix_fmt yuv420p"
audio="-f lavfi -i sine=frequency=440:duration=1"
for pair in libx264:mp4 libx265:mp4 libvpx-vp9:webm libaom-av1:mkv libsvtav1:mkv libwebp:webp; do
    ffmpeg -hide_banner -loglevel error $video -c:v "${pair%%:*}" "$d/v-${pair%%:*}.${pair##*:}"
    ffprobe -v error "$d/v-${pair%%:*}.${pair##*:}"
done
for pair in libopus:opus libmp3lame:mp3 libvorbis:ogg; do
    ffmpeg -hide_banner -loglevel error $audio -c:a "${pair%%:*}" "$d/a-${pair%%:*}.${pair##*:}"
    ffprobe -v error "$d/a-${pair%%:*}.${pair##*:}"
done
# dav1d decodes what an AV1 encoder wrote.
ffmpeg -hide_banner -loglevel error -c:v libdav1d -i "$d/v-libsvtav1.mkv" -f null -
]],
            },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "9.1",
        },
        ["aarch64-macos"] = {
            default_version = "9.1",
        },
        ["x86_64-linux"] = {
            default_version = "9.1",
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
        ["9.1"] = {
            digests = {
                ["aarch64-linux"] = "1a4d394ae63d190a526cd052eb4415c156b5c5e2df37efab41a7de0b8fde2433",
                ["aarch64-macos"] = "1a4d394ae63d190a526cd052eb4415c156b5c5e2df37efab41a7de0b8fde2433",
                ["x86_64-linux"] = "1a4d394ae63d190a526cd052eb4415c156b5c5e2df37efab41a7de0b8fde2433",
            },
        },
    },
}
