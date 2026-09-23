return {
    name = "lz4",
    description = "Fast compression library and command-line tools",
    homepage = "https://lz4.org/",
    default_license = "NOASSERTION",
    source = {
        url = "https://github.com/lz4/lz4/releases/download/v1.10.0/lz4-1.10.0.tar.gz",
        archive = "tar.gz",
        strip_prefix = "lz4-1.10.0",
    },
    build = {
        backend = "custom",
        libraries = { "lib/liblz4.a" },
        steps = {
            configure = {
                {
                    "sed",
                    "-i.bak",
                    "-e",
                    "s/ffm = self.cvinfo.file_frame_map\\[i\\]/ffm = os.path.basename(self.cvinfo.file_frame_map[i])/",
                    "-e",
                    "s/if start != 0 and end != 0:/if end != 0:/",
                    "tests/test-lz4-list.py",
                },
            },
            build = {
                { "make", "-j{jobs}", "BUILD_SHARED=no", "PREFIX=/" },
            },
            check = {
                { "make", "BUILD_SHARED=no", "PREFIX=/", "test" },
            },
            install = {
                { "make", "BUILD_SHARED=no", "PREFIX=/", "DESTDIR={prefix}", "install" },
            },
        },
    },
    outputs = {
        bins = { "lz4", "lz4c", "lz4cat", "unlz4" },
        checks = {
            { "lz4", "--version" },
            { "lz4c", "--version" },
            { "lz4cat", "--version" },
            { "unlz4", "--version" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "1.10.0",
        },
        ["aarch64-macos"] = {
            default_version = "1.10.0",
        },
        ["x86_64-linux"] = {
            default_version = "1.10.0",
        },
    },
    versions = {
        ["1.10.0"] = {
            digests = {
                ["aarch64-linux"] = "537512904744b35e232912055ccf8ec66d768639ff3abe5788d90d792ec5f48b",
                ["aarch64-macos"] = "537512904744b35e232912055ccf8ec66d768639ff3abe5788d90d792ec5f48b",
                ["x86_64-linux"] = "537512904744b35e232912055ccf8ec66d768639ff3abe5788d90d792ec5f48b",
            },
            revision = 2,
        },
    },
}
