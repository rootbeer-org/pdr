return {
    name = "nasm",
    description = "Netwide Assembler, an x86 and x86-64 assembler",
    homepage = "https://www.nasm.us/",
    recipe_maintainers = { "tale" },
    default_license = "BSD-2-Clause",
    upstream = {
        github = "netwide-assembler/nasm",
        repository_id = 130599566,
        tag = "nasm-{version}",
        exclude_tags = { "nasm-*rc*" },
    },
    source = {
        url = "https://www.nasm.us/pub/nasm/releasebuilds/{version}/nasm-{version}.tar.xz",
        archive = "tar.xz",
        strip_prefix = "nasm-{version}",
    },
    build = {
        backend = "custom",
        -- The autotools backend runs `make check`, which nasm does not define.
        steps = {
            configure = {
                { "/bin/sh", "./configure", "--prefix={prefix}" },
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
        bins = { "nasm", "ndisasm" },
        checks = {
            { "nasm", "-v" },
            { "ndisasm", "-v" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "3.02",
        },
        ["aarch64-macos"] = {
            default_version = "3.02",
        },
        ["x86_64-linux"] = {
            default_version = "3.02",
        },
    },
    versions = {
        ["3.02"] = {
            digests = {
                ["aarch64-linux"] = "87336eba53b4acfe917424ab5d500d2b0054d9f5148d35c2273ccf2cfb712f0d",
                ["aarch64-macos"] = "87336eba53b4acfe917424ab5d500d2b0054d9f5148d35c2273ccf2cfb712f0d",
                ["x86_64-linux"] = "87336eba53b4acfe917424ab5d500d2b0054d9f5148d35c2273ccf2cfb712f0d",
            },
        },
    },
}
