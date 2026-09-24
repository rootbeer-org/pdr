return {
    name = "rsync",
    description = "Synchronize files with incremental transfers",
    homepage = "https://rsync.samba.org/",
    recipe_maintainers = { "tale" },
    default_license = "GPL-3.0-or-later",
    upstream = {
        github = "RsyncProject/rsync",
        repository_id = 266877886,
        tag = "v{version}",
    },
    source = {
        url = "https://download.samba.org/pub/rsync/src/rsync-{version}.tar.gz",
        archive = "tar.gz",
        strip_prefix = "rsync-{version}",
        patches = {
            "--- a/testsuite/chmod-setid_test.py\010+++ b/testsuite/chmod-setid_test.py\010@@ -8,6 +8,9 @@\010 from rsyncfns import SCRATCHDIR, run_rsync, test_fail\010 \010 base = SCRATCHDIR / 'chmod_setid'\010+base.mkdir(parents=True, exist_ok=True)\010+# macOS clears setgid when the inherited directory group is not ours.\010+os.chown(base, -1, os.getgid())\010 src = base / 'src'\010 dst = base / 'dst'\010 src.mkdir(parents=True, exist_ok=True)\010",
        },
    },
    build = {
        backend = "custom",
        dependencies = {
            "openssl@4.0.2",
            "xxhash@0.8.3",
            "zstd@1.5.7",
            "lz4@1.10.0",
            "zlib@1.3.2",
        },
        steps = {
            configure = {
                { "sh", "./configure", "--prefix=/", "--disable-debug", "--disable-md2man" },
            },
            build = {
                { "make", "-j{jobs}" },
            },
            check = {
                { "make", "check" },
                {
                    "/bin/sh",
                    "-ec",
                    "PATH=\"$PWD:$PATH\"; export PATH; directory=$(mktemp -d); trap 'rm -rf \"$directory\"' EXIT; mkdir \"$directory/source\" \"$directory/destination\"; printf rootbeer-rsync > \"$directory/source/file\"; rsync -a --checksum \"$directory/source/\" \"$directory/destination/\"; cmp \"$directory/source/file\" \"$directory/destination/file\"; rm \"$directory/source/file\"; rsync -a --delete \"$directory/source/\" \"$directory/destination/\"; test ! -e \"$directory/destination/file\"",
                },
            },
            install = {
                { "make", "DESTDIR={prefix}", "install" },
            },
        },
    },
    outputs = {
        bins = { "rsync" },
        checks = {
            { "rsync", "--version" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "3.5.1",
        },
        ["aarch64-macos"] = {
            default_version = "3.5.1",
        },
        ["x86_64-linux"] = {
            default_version = "3.5.1",
        },
    },
    versions = {
        ["3.5.0"] = {
            digests = {
                ["aarch64-linux"] = "c7ffd1ef653e99540f661e47cb00b7f9cad1ee6b972399b16f93d672656e0d33",
                ["aarch64-macos"] = "c7ffd1ef653e99540f661e47cb00b7f9cad1ee6b972399b16f93d672656e0d33",
                ["x86_64-linux"] = "c7ffd1ef653e99540f661e47cb00b7f9cad1ee6b972399b16f93d672656e0d33",
            },
        },
        ["3.5.1"] = {
            digests = {
                ["aarch64-linux"] = "c55f9c9dc10fb8bec397b399a0fdded53cc9a2d8e30891bb0d63724d25c37bef",
                ["aarch64-macos"] = "c55f9c9dc10fb8bec397b399a0fdded53cc9a2d8e30891bb0d63724d25c37bef",
                ["x86_64-linux"] = "c55f9c9dc10fb8bec397b399a0fdded53cc9a2d8e30891bb0d63724d25c37bef",
            },
        },
    },
}
