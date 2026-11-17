return {
    name = "libvorbis",
    description = "Vorbis audio codec library",
    homepage = "https://xiph.org/vorbis/",
    recipe_maintainers = { "tale" },
    default_license = "BSD-3-Clause",
    upstream = {
        github = "xiph/vorbis",
        repository_id = 35348574,
        tag = "v{version}",
    },
    source = {
        url = "https://downloads.xiph.org/releases/vorbis/libvorbis-{version}.tar.xz",
        archive = "tar.xz",
        strip_prefix = "libvorbis-{version}",
    },
    build = {
        backend = "custom",
        dependencies = {
            {
                package = "libogg",
                kind = "link_runtime",
            },
            {
                package = "pkgconf",
                kind = "build",
            },
        },
        libraries = {
            "lib/libvorbis.a",
            "lib/libvorbis.{shared_extension}",
            "lib/libvorbisenc.a",
            "lib/libvorbisenc.{shared_extension}",
            "lib/libvorbisfile.a",
            "lib/libvorbisfile.{shared_extension}",
        },
        steps = {
            -- Drop the obsolete macOS flag ld rejects. -ffast-math vectorizes libm calls into glibc's libmvec, which the Linux scan rejects.
            prepare = {
                {
                    "/bin/sh",
                    "-c",
                    "sed -e 's/ -force_cpusubtype_ALL//g' -e 's/-ffast-math/-ffast-math -fno-tree-vectorize/g' configure > configure.new && cat configure.new > configure && rm configure.new",
                },
            },
            configure = {
                {
                    "/bin/sh",
                    "./configure",
                    "--prefix={prefix}",
                    "--enable-shared",
                    "--enable-static",
                    "--with-pic",
                    "--disable-docs",
                    "--disable-examples",
                    "--disable-oggtest",
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
    outputs = {},
    platforms = {
        ["aarch64-linux"] = {
            default_version = "1.3.7",
        },
        ["aarch64-macos"] = {
            default_version = "1.3.7",
        },
        ["x86_64-linux"] = {
            default_version = "1.3.7",
        },
    },
    versions = {
        ["1.3.7"] = {
            digests = {
                ["aarch64-linux"] = "b33cc4934322bcbf6efcbacf49e3ca01aadbea4114ec9589d1b1e9d20f72954b",
                ["aarch64-macos"] = "b33cc4934322bcbf6efcbacf49e3ca01aadbea4114ec9589d1b1e9d20f72954b",
                ["x86_64-linux"] = "b33cc4934322bcbf6efcbacf49e3ca01aadbea4114ec9589d1b1e9d20f72954b",
            },
        },
    },
}
