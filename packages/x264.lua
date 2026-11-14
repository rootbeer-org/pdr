return {
    name = "x264",
    description = "H.264/AVC video encoder library and command-line tool",
    homepage = "https://www.videolan.org/developers/x264.html",
    recipe_maintainers = { "tale" },
    default_license = "GPL-2.0-or-later",
    -- No upstream tags or releases: bumped by hand from the stable branch.
    source = {
        url = "https://code.videolan.org/videolan/x264/-/archive/{commit}/x264-{commit}.tar.gz",
        archive = "tar.gz",
        strip_prefix = "x264-{commit}",
    },
    build = {
        backend = "custom",
        dependencies = {
            {
                package = "nasm",
                kind = "build",
            },
        },
        libraries = { "lib/libx264.a", "lib/libx264.{shared_extension}" },
        steps = {
            -- version.sh reads the revision from .git, which the archive lacks.
            prepare = {
                {
                    "/bin/sh",
                    "-c",
                    [[sed "s/^ver=\"x\"/ver=\"$1\"/" version.sh > version.sh.new && cat version.sh.new > version.sh && rm version.sh.new && grep -q "^ver=\"$1\"" version.sh]],
                    "sh",
                    "{patch}",
                },
            },
            configure = {
                {
                    "/bin/sh",
                    "./configure",
                    "--prefix={prefix}",
                    "--enable-shared",
                    "--enable-static",
                    "--enable-pic",
                    "--disable-lavf",
                    "--disable-swscale",
                    "--disable-ffms",
                    "--disable-gpac",
                    "--disable-lsmash",
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
        bins = { "x264" },
        checks = {
            { "x264", "--version" },
            -- Two 64x64 4:2:0 frames: 64 * 64 * 3 / 2 * 2 = 12288 bytes.
            {
                "/bin/sh",
                "-c",
                'd=$(mktemp -d) && head -c 12288 /dev/zero > "$d/in.yuv" && x264 --input-res 64x64 --fps 30 -o "$d/out.264" "$d/in.yuv" && test -s "$d/out.264"',
            },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "0.165.3222",
        },
        ["aarch64-macos"] = {
            default_version = "0.165.3222",
        },
        ["x86_64-linux"] = {
            default_version = "0.165.3222",
        },
    },
    versions = {
        ["0.165.3222"] = {
            digests = {
                ["aarch64-linux"] = "cd71a7515b0e9a012e1ac9b1f8415bebcaf6fc97d4db32286642ac4c0fbe24f9",
                ["aarch64-macos"] = "cd71a7515b0e9a012e1ac9b1f8415bebcaf6fc97d4db32286642ac4c0fbe24f9",
                ["x86_64-linux"] = "cd71a7515b0e9a012e1ac9b1f8415bebcaf6fc97d4db32286642ac4c0fbe24f9",
            },
            commit = "b35605ace3ddf7c1a5d67a2eb553f034aef41d55",
        },
    },
}
