return {
    name = "keyutils",
    description = "Linux key management library and keyctl utility",
    homepage = "https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/keyutils.git",
    recipe_maintainers = { "tale" },
    default_license = "GPL-2.0-or-later AND LGPL-2.1-or-later",
    -- Upstream publishes only kernel.org cgit snapshots; the people.redhat.com
    -- tarballs are gone. Versions are updated by hand.
    source = {
        url = "https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/keyutils.git/snapshot/keyutils-{version}.tar.gz",
        archive = "tar.gz",
        strip_prefix = "keyutils-{version}",
    },
    build = {
        backend = "custom",
        libraries = { "lib/libkeyutils.a" },
        steps = {
            build = {
                {
                    "make",
                    "-j{jobs}",
                    "NO_SOLIB=1",
                    -- Replaces the build date upstream embeds with a fixed one, and builds only the
                    -- library and keyctl: key.dns_resolver would link the host's libresolv.
                    "VCPPFLAGS=-DPKGBUILD=\\\"1970-01-01\\\" -DPKGVERSION=\\\"keyutils-{version}\\\" -DAPIVERSION=\\\"libkeyutils-1.10\\\"",
                    "libkeyutils.a",
                    "keyctl",
                },
            },
            check = {
                { "./keyctl", "--version" },
            },
            install = {
                { "install", "-D", "-m", "0644", "libkeyutils.a", "{prefix}/lib/libkeyutils.a" },
                { "install", "-D", "-m", "0644", "keyutils.h", "{prefix}/include/keyutils.h" },
                { "install", "-D", "keyctl", "{prefix}/bin/keyctl" },
                {
                    "install",
                    "-D",
                    "-m",
                    "0644",
                    "man/keyctl.1",
                    "{prefix}/share/man/man1/keyctl.1",
                },
            },
        },
    },
    outputs = {
        bins = { "keyctl" },
        checks = {
            { "keyctl", "--version" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "1.6.3",
        },
        ["x86_64-linux"] = {
            default_version = "1.6.3",
        },
    },
    versions = {
        ["1.6.3"] = {
            digests = {
                ["aarch64-linux"] = "a61d5706136ae4c05bd48f86186bcfdbd88dd8bd5107e3e195c924cfc1b39bb4",
                ["x86_64-linux"] = "a61d5706136ae4c05bd48f86186bcfdbd88dd8bd5107e3e195c924cfc1b39bb4",
            },
        },
    },
}
