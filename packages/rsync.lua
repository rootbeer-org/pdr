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
            "test-chmod-setid.patch",
            "test-install-strip.patch",
            "test-protected-regular.patch",
            "test-macos-setgid.patch",
        },
    },
    build = {
        backend = "custom",
        -- The daemon tests talk over loopback socket pairs, and the suite locks a file in /tmp.
        allow = { "local-network", "tmp" },
        dependencies = {
            {
                package = "openssl",
                kind = "link_runtime",
            },
            {
                package = "xxhash",
                kind = "link",
            },
            {
                package = "zstd",
                kind = "link_runtime",
            },
            {
                package = "lz4",
                kind = "link_runtime",
            },
            {
                package = "zlib",
                kind = "link_runtime",
            },
            {
                package = "libidn2",
                kind = "link_runtime",
            },
        },
        steps = {
            configure = {
                {
                    "sh",
                    "./configure",
                    "--prefix={prefix}",
                    "--disable-debug",
                    "--disable-md2man",
                },
            },
            build = {
                { "make", "-j{jobs}" },
            },
            check = {
                { "make", "check" },
                {
                    "/bin/sh",
                    "-ec",
                    'PATH="$PWD:$PATH"; export PATH; directory=$(mktemp -d); trap \'rm -rf "$directory"\' EXIT; mkdir "$directory/source" "$directory/destination"; printf rootbeer-rsync > "$directory/source/file"; rsync -a --checksum "$directory/source/" "$directory/destination/"; cmp "$directory/source/file" "$directory/destination/file"; rm "$directory/source/file"; rsync -a --delete "$directory/source/" "$directory/destination/"; test ! -e "$directory/destination/file"',
                },
            },
            install = {
                { "make", "install" },
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
            default_version = "3.5.2",
        },
        ["aarch64-macos"] = {
            default_version = "3.5.2",
        },
        ["x86_64-linux"] = {
            default_version = "3.5.2",
        },
    },
    versions = {
        ["3.5.1"] = {
            digests = {
                ["aarch64-linux"] = "c55f9c9dc10fb8bec397b399a0fdded53cc9a2d8e30891bb0d63724d25c37bef",
                ["aarch64-macos"] = "c55f9c9dc10fb8bec397b399a0fdded53cc9a2d8e30891bb0d63724d25c37bef",
                ["x86_64-linux"] = "c55f9c9dc10fb8bec397b399a0fdded53cc9a2d8e30891bb0d63724d25c37bef",
            },
            revision = 2,
        },
        ["3.5.2"] = {
            digests = {
                ["aarch64-linux"] = "a10d591825251e070f74c98df3daad195def4ed81b4a2de16169026aea33f6c8",
                ["aarch64-macos"] = "a10d591825251e070f74c98df3daad195def4ed81b4a2de16169026aea33f6c8",
                ["x86_64-linux"] = "a10d591825251e070f74c98df3daad195def4ed81b4a2de16169026aea33f6c8",
            },
        },
    },
}
