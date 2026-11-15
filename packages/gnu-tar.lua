return {
    name = "gnu-tar",
    aliases = { "tar" },
    description = "GNU tar archiving utility",
    homepage = "https://www.gnu.org/software/tar/",
    recipe_maintainers = { "tale" },
    default_license = "GPL-3.0-or-later",
    upstream = {
        git = "https://git.savannah.gnu.org/git/tar.git",
        tag = "v{version}",
    },
    source = {
        url = "https://ftp.gnu.org/gnu/tar/tar-{version}.tar.xz",
        archive = "tar.xz",
        strip_prefix = "tar-{version}",
    },
    build = {
        backend = "custom",
        steps = {
            configure = {
                { "sh", "./configure", "--prefix={prefix}", "--disable-nls" },
            },
            build = {
                { "make", "-j{jobs}" },
            },
            -- Upstream's suite needs xattr support the build sandbox lacks, so it is not run.
            install = {
                { "make", "install" },
            },
        },
    },
    outputs = {
        bins = { "tar" },
        checks = {
            { "tar", "--version" },
            {
                "sh",
                "-c",
                'd=$(mktemp -d) && echo hello > "$d/file.txt" && tar -C "$d" -cf "$d/archive.tar" file.txt && tar -tf "$d/archive.tar" | grep -qx file.txt',
            },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "1.35",
        },
        ["aarch64-macos"] = {
            default_version = "1.35",
            build = {
                backend = "custom",
                -- AM_ICONV finds -liconv, but tar links only $(LIBS).
                steps = {
                    configure = {
                        {
                            "sh",
                            "./configure",
                            "--prefix={prefix}",
                            "--disable-nls",
                            "LIBS=-liconv",
                        },
                    },
                    build = {
                        { "make", "-j{jobs}" },
                    },
                    install = {
                        { "make", "install" },
                    },
                },
            },
        },
        ["x86_64-linux"] = {
            default_version = "1.35",
        },
    },
    versions = {
        ["1.35"] = {
            digests = {
                ["aarch64-linux"] = "4d62ff37342ec7aed748535323930c7cf94acf71c3591882b26a7ea50f3edc16",
                ["aarch64-macos"] = "4d62ff37342ec7aed748535323930c7cf94acf71c3591882b26a7ea50f3edc16",
                ["x86_64-linux"] = "4d62ff37342ec7aed748535323930c7cf94acf71c3591882b26a7ea50f3edc16",
            },
        },
    },
}
