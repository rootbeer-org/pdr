return {
    name = "bzip2",
    description = "Block-sorting file compressor",
    homepage = "https://sourceware.org/bzip2/",
    recipe_maintainers = { "tale" },
    default_license = "bzip2-1.0.6",
    upstream = {
        git = "https://sourceware.org/git/bzip2.git",
        tag = "bzip2-{version}",
    },
    source = {
        url = "https://sourceware.org/pub/bzip2/bzip2-{version}.tar.gz",
        archive = "tar.gz",
        strip_prefix = "bzip2-{version}",
    },
    build = {
        backend = "custom",
        libraries = { "lib/libbz2.a", "lib/libbz2.{shared_extension}" },
        steps = {
            build = {
                -- Upstream's Makefile builds the static library and tools, then runs its self test.
                {
                    "make",
                    "-j{jobs}",
                    "libbz2.a",
                    "bzip2",
                    "bzip2recover",
                    "CFLAGS=-Wall -O2 -g -fPIC -D_FILE_OFFSET_BITS=64",
                },
            },
            check = {
                {
                    "make",
                    "test",
                    "CFLAGS=-Wall -O2 -g -fPIC -D_FILE_OFFSET_BITS=64",
                },
            },
            install = {
                { "make", "install", "PREFIX={prefix}" },
                -- The Makefile links the bz* aliases with absolute targets into the prefix.
                {
                    "sh",
                    "-c",
                    'cd "$1/bin" && ln -sf bzgrep bzegrep && ln -sf bzgrep bzfgrep && ln -sf bzmore bzless && ln -sf bzdiff bzcmp',
                    "sh",
                    "{prefix}",
                },
                -- Shared library from the same -fPIC objects as libbz2.a; the binaries stay static.
                {
                    "sh",
                    "-c",
                    [[
case "$(uname -s)" in
Darwin)
    cc -dynamiclib -install_name "$1/lib/libbz2.1.dylib" -compatibility_version 1.0 -current_version 1.0.8 \
        -o libbz2.1.0.8.dylib blocksort.o huffman.o crctable.o randtable.o compress.o decompress.o bzlib.o
    cp libbz2.1.0.8.dylib "$1/lib/"
    cd "$1/lib" && ln -sf libbz2.1.0.8.dylib libbz2.1.dylib && ln -sf libbz2.1.dylib libbz2.dylib
    ;;
*)
    # Upstream's Makefile-libbz2_so makes the soname-versioned Linux library.
    make -f Makefile-libbz2_so
    cp libbz2.so.1.0.8 "$1/lib/"
    cd "$1/lib" && ln -sf libbz2.so.1.0.8 libbz2.so.1.0 && ln -sf libbz2.so.1.0 libbz2.so
    ;;
esac
]],
                    "sh",
                    "{prefix}",
                },
            },
        },
    },
    outputs = {
        bins = {
            "bzip2",
            "bunzip2",
            "bzcat",
            "bzip2recover",
            "bzgrep",
            "bzegrep",
            "bzfgrep",
            "bzmore",
            "bzless",
            "bzdiff",
            "bzcmp",
        },
        checks = {
            { "bzip2", "--help" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "1.0.8",
        },
        ["aarch64-macos"] = {
            default_version = "1.0.8",
        },
        ["x86_64-linux"] = {
            default_version = "1.0.8",
        },
    },
    versions = {
        ["1.0.8"] = {
            digests = {
                ["aarch64-linux"] = "ab5a03176ee106d3f0fa90e381da478ddae405918153cca248e682cd0c4a2269",
                ["aarch64-macos"] = "ab5a03176ee106d3f0fa90e381da478ddae405918153cca248e682cd0c4a2269",
                ["x86_64-linux"] = "ab5a03176ee106d3f0fa90e381da478ddae405918153cca248e682cd0c4a2269",
            },
        },
    },
}
