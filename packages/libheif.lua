return {
    name = "libheif",
    description = "HEIF, HEIC and AVIF image library and tools",
    homepage = "https://github.com/strukturag/libheif",
    recipe_maintainers = { "tale" },
    default_license = "LGPL-3.0-or-later",
    upstream = {
        github = "strukturag/libheif",
        repository_id = 115012280,
        tag = "v{version}",
    },
    source = {
        url = "https://github.com/strukturag/libheif/releases/download/v{version}/libheif-{version}.tar.gz",
        archive = "tar.gz",
        strip_prefix = "libheif-{version}",
    },
    build = {
        backend = "custom",
        dependencies = {
            {
                package = "cmake",
                kind = "all",
            },
            {
                package = "pkgconf",
                kind = "build",
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
                package = "libpng",
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
        libraries = { "lib/libheif.{shared_extension}" },
        steps = {
            configure = {
                {
                    "cmake",
                    "-S",
                    ".",
                    "-B",
                    "build",
                    "-DCMAKE_BUILD_TYPE=Release",
                    "-DCMAKE_INSTALL_PREFIX={prefix}",
                    "-DCMAKE_INSTALL_LIBDIR=lib",
                    "-DCMAKE_INSTALL_INCLUDEDIR=include",
                    "-DCMAKE_INSTALL_BINDIR=bin",
                    "-DBUILD_SHARED_LIBS=ON",
                    "-DBUILD_TESTING=OFF",
                    "-DBUILD_DOCUMENTATION=OFF",
                    "-DENABLE_PLUGIN_LOADING=OFF",
                    "-DWITH_EXAMPLES=ON",
                    "-DWITH_EXAMPLE_HEIF_THUMB=OFF",
                    "-DWITH_EXAMPLE_HEIF_VIEW=OFF",
                    "-DWITH_GDK_PIXBUF=OFF",
                    "-DWITH_LIBDE265=ON",
                    "-DWITH_AOM_DECODER=ON",
                    "-DWITH_AOM_ENCODER=ON",
                    "-DWITH_X265=OFF",
                    "-DWITH_X264=OFF",
                    "-DWITH_OpenH264_DECODER=OFF",
                    "-DWITH_DAV1D=OFF",
                    "-DWITH_RAV1E=OFF",
                    "-DWITH_SvtEnc=OFF",
                    "-DWITH_KVAZAAR=OFF",
                    "-DWITH_FFMPEG_DECODER=OFF",
                    "-DWITH_OpenJPEG_ENCODER=OFF",
                    "-DWITH_OpenJPEG_DECODER=OFF",
                    "-DWITH_OPENJPH_ENCODER=OFF",
                    "-DWITH_UNCOMPRESSED_CODEC=OFF",
                    "-DWITH_LIBSHARPYUV=OFF",
                },
            },
            build = {
                { "cmake", "--build", "build", "--parallel", "{jobs}" },
            },
            install = {
                { "cmake", "--install", "build" },
            },
        },
    },
    outputs = {
        bins = { "heif-enc", "heif-dec", "heif-info", "heif-convert" },
        checks = {
            { "heif-dec", "--version" },
            {
                "sh",
                "-c",
                "d=$(mktemp -d) && printf 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAIAAACQkWg2AAABlklEQVR4nBXRURVEIQhFUSMYgQhGMAIRiGCEE8EIRiACEYhABCLMG7/ZrMt1jMEcyGAN9kAHNjgDBnfwBj6IQQ5q0IMxJnMikzXZE53Y5EyY3Mmb+CQmOalJzw8IUxBhCVtQwYQjIFzhCS6EkEIJLR9YzIUs1mIvdGGLs2BxF2/hi1jkoha9PrCZG9mszd7oxjZnw+Zu3sY3sclNbXp/QJmKKEvZiiqmHAXlKk9xJZRUSmn9gDENMZaxDTXMOAbGNZ7hRhhplNH2gcM8yGEd9kEPdjgHDvfwDn6IQx7q0OcD/wK/Sr4jv9hfkG/1N/x/Fx44BCQU9Pc94zIvclmXfdGLXc79j9/Lu/glLnmpS98PPOZDHuuxH/qwx3n/5ffxHv6IRz7q0e8DznTEWc521DHn+D/KdZ7jTjjplNP+gWAGEqxgBxpYcOIf/AYv8CCCDCro+EAyE0lWshNNLDn5P/MmL/Ekkkwq6fxAMQspVrELLaw49S/lFq/wIoosquj6QDMbaVazG22sOf2v8Dav8SaabKrp5geIAnAQEbP2+wAAAABJRU5ErkJggg==' | base64 -d > $d/in.png && heif-enc --avif -o $d/out.avif $d/in.png >/dev/null 2>&1 && heif-info $d/out.avif >/dev/null 2>&1 && heif-dec -o $d/back.png $d/out.avif >/dev/null 2>&1 && test -s $d/back.png && echo ok",
            },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "1.23.7",
        },
        ["aarch64-macos"] = {
            default_version = "1.23.7",
        },
        ["x86_64-linux"] = {
            default_version = "1.23.7",
        },
    },
    versions = {
        ["1.23.7"] = {
            digests = {
                ["aarch64-linux"] = "f7483e818503ea6224c8863e4a56ac02c7089021a98472c811c12aa19faf2475",
                ["aarch64-macos"] = "f7483e818503ea6224c8863e4a56ac02c7089021a98472c811c12aa19faf2475",
                ["x86_64-linux"] = "f7483e818503ea6224c8863e4a56ac02c7089021a98472c811c12aa19faf2475",
            },
        },
    },
}
