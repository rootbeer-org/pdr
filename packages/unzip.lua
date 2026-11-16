return {
    name = "unzip",
    description = "Extract ZIP archives",
    homepage = "https://infozip.sourceforge.net/UnZip.html",
    recipe_maintainers = { "tale" },
    default_license = "Info-ZIP",
    -- Info-ZIP publishes no git tags, so versions are bumped by hand.
    source = {
        url = "https://downloads.sourceforge.net/project/infozip/UnZip%206.x%20%28latest%29/UnZip%20{version}/unzip{major}{minor}.tar.gz",
        archive = "tar.gz",
        strip_prefix = "unzip{major}{minor}",
        -- Info-ZIP stopped releasing, so these are the fixes Debian carries in unzip 6.0-31,
        -- without its man page, branding, and kFreeBSD patches.
        patches = {
            "handle-pkware-verification-bit.patch",
            "fix-uid-gid-handling.patch",
            "initialize-the-symlink-flag.patch",
            "increase-size-of-cfactorstr.patch",
            "allow-greater-hostver-values.patch",
            "cve-2014-8139-crc-overflow.patch",
            "cve-2014-8140-test-compr-eb.patch",
            "cve-2014-8141-getzip64data.patch",
            "cve-2014-9636-test-compr-eb.patch",
            "remove-build-date.patch",
            "cve-2015-7696.patch",
            "cve-2015-7697.patch",
            "fix-integer-underflow-csiz-decrypted.patch",
            "restore-unix-timestamps-accurately.patch",
            "cve-2014-9913-unzip-buffer-overflow.patch",
            "cve-2016-9844-zipinfo-buffer-overflow.patch",
            "cve-2018-1000035-unzip-buffer-overflow.patch",
            "fix-warning-messages-on-big-files.patch",
            "cve-2019-13232-fix-bug-in-undefer-input.patch",
            "cve-2019-13232-zip-bomb-with-overlapped-entries.patch",
            "cve-2019-13232-do-not-raise-alert-for-misplaced-central-directory.patch",
            "cve-2019-13232-fix-bug-in-uzbunzip2.patch",
            "cve-2019-13232-fix-bug-in-uzinflate.patch",
            "zipgrep-avoid-test-errors.patch",
            "cve-2022-0529-and-cve-2022-0530.patch",
            "handle-windows-zip64-files.patch",
            "drop-conflicting-declarations.patch",
            "fix-zipgrep.patch",
            "can-2026-2034440.patch",
            "can-2026-2034443.patch",
            "can-2026-2034442.patch",
        },
    },
    build = {
        backend = "custom",
        steps = {
            build = {
                -- Modern compilers reject the implicit declarations in these K&R sources, and
                -- that fails configure's memset probe, which then breaks the build.
                {
                    "make",
                    "-f",
                    "unix/Makefile",
                    "generic",
                    "CC=cc -Wno-implicit-function-declaration",
                },
            },
            -- testmake.zip ships in the source tree, so the check reads a real archive without zip.
            check = {
                { "./unzip", "-tq", "testmake.zip" },
                {
                    "sh",
                    "-c",
                    "./unzip -p testmake.zip notes | grep -q testmake",
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
        bins = { "unzip", "zipinfo" },
        checks = {
            { "unzip", "-v" },
            { "zipinfo", "-h" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "6.0",
        },
        ["aarch64-macos"] = {
            default_version = "6.0",
        },
        ["x86_64-linux"] = {
            default_version = "6.0",
        },
    },
    versions = {
        ["6.0"] = {
            digests = {
                ["aarch64-linux"] = "036d96991646d0449ed0aa952e4fbe21b476ce994abc276e49d30e686708bd37",
                ["aarch64-macos"] = "036d96991646d0449ed0aa952e4fbe21b476ce994abc276e49d30e686708bd37",
                ["x86_64-linux"] = "036d96991646d0449ed0aa952e4fbe21b476ce994abc276e49d30e686708bd37",
            },
        },
    },
}
