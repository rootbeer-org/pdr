return {
    name = "zip",
    description = "Create ZIP archives",
    homepage = "https://infozip.sourceforge.net/Zip.html",
    recipe_maintainers = { "tale" },
    default_license = "Info-ZIP",
    -- Info-ZIP publishes no git tags, so versions are bumped by hand.
    source = {
        url = "https://downloads.sourceforge.net/project/infozip/Zip%203.x%20%28latest%29/{version}/zip{major}{minor}.tar.gz",
        archive = "tar.gz",
        strip_prefix = "zip{major}{minor}",
        -- Info-ZIP stopped releasing, so these are the fixes Debian carries in zip 3.0-16,
        -- without its typo, man page, and packaging patches.
        patches = {
            "stack-markings-to-avoid-executable-stack.patch",
            "fclose-in-file-not-fclose-x.patch",
            "hardening-build-fix-1.patch",
            "hardening-build-fix-2.patch",
            "remove-build-date.patch",
            "fix-build-with-gcc-14.patch",
            "buffer-overflow-unicode-filename.patch",
            "buffer-overflow-cve-2018-13410.patch",
            "fix-symlink-update-detection.patch",
            "fix-command-injection.patch",
        },
    },
    build = {
        backend = "custom",
        steps = {
            build = {
                {
                    "make",
                    "-f",
                    "unix/Makefile",
                    "generic",
                    -- Naming a directory skips the probe that links the host's libbz2 on macOS
                    -- and finds none on Linux, so neither platform gets the bzip2 method.
                    "IZ_BZIP2=none",
                },
            },
            install = {
                {
                    "make",
                    "-f",
                    "unix/Makefile",
                    "install",
                    "prefix={prefix}",
                    "MANDIR={prefix}/share/man/man1",
                },
            },
        },
    },
    outputs = {
        bins = { "zip", "zipcloak", "zipnote", "zipsplit" },
        checks = {
            { "zip", "-v" },
            {
                "sh",
                "-c",
                [[set -e
d=$(mktemp -d)
cd "$d"
printf 'rootbeer\n' > a.txt
zip -q a.zip a.txt
zip -T a.zip | grep -q 'test of a.zip OK'
rm -rf "$d"
printf '%s\n' ok]],
            },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "3.0",
        },
        ["aarch64-macos"] = {
            default_version = "3.0",
        },
        ["x86_64-linux"] = {
            default_version = "3.0",
        },
    },
    versions = {
        ["3.0"] = {
            digests = {
                ["aarch64-linux"] = "f0e8bb1f9b7eb0b01285495a2699df3a4b766784c1765a8f1aeedf63c0806369",
                ["aarch64-macos"] = "f0e8bb1f9b7eb0b01285495a2699df3a4b766784c1765a8f1aeedf63c0806369",
                ["x86_64-linux"] = "f0e8bb1f9b7eb0b01285495a2699df3a4b766784c1765a8f1aeedf63c0806369",
            },
        },
    },
}
