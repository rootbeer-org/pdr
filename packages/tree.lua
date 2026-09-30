return {
    name = "tree",
    description = "List directory contents as a tree",
    homepage = "https://oldmanprogrammer.net/source.php?dir=projects/tree",
    recipe_maintainers = { "tale" },
    default_license = "GPL-2.0-or-later",
    -- Released only on gitlab.com, so versions are updated by hand.
    source = {
        url = "https://gitlab.com/OldManProgrammer/unix-tree/-/archive/{version}/unix-tree-{version}.tar.gz",
        archive = "tar.gz",
        strip_prefix = "unix-tree-{version}",
    },
    build = {
        backend = "custom",
        steps = {
            build = {
                -- Replaces upstream's default of -ggdb with an optimized build.
                { "make", "-j{jobs}", "CFLAGS=-O2 -std=c11 -Wall" },
            },
            -- Upstream ships no test suite, so the check lists the source tree as JSON.
            check = {
                { "./tree", "-J", "-L", "1", "." },
            },
            install = {
                {
                    "make",
                    "CFLAGS=-O2 -std=c11 -Wall",
                    "PREFIX={prefix}",
                    "MANDIR={prefix}/share/man",
                    "install",
                },
            },
        },
    },
    outputs = {
        bins = { "tree" },
        checks = {
            { "tree", "--version" },
            { "tree", "-a", "-J", "-L", "1", "/" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "2.3.2",
        },
        ["aarch64-macos"] = {
            default_version = "2.3.2",
        },
        ["x86_64-linux"] = {
            default_version = "2.3.2",
        },
    },
    versions = {
        ["2.3.2"] = {
            digests = {
                ["aarch64-linux"] = "513a53cbc42ca1f4ea06af2bab1f5283524a3848266b1d162416f8033afc4985",
                ["aarch64-macos"] = "513a53cbc42ca1f4ea06af2bab1f5283524a3848266b1d162416f8033afc4985",
                ["x86_64-linux"] = "513a53cbc42ca1f4ea06af2bab1f5283524a3848266b1d162416f8033afc4985",
            },
        },
    },
}
