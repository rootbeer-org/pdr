return {
    name = "icu4c",
    aliases = { "icu" },
    description = "Unicode and globalization libraries for C and C++",
    homepage = "https://icu.unicode.org/",
    recipe_maintainers = { "tale" },
    default_license = "Unicode-3.0",
    upstream = {
        github = "unicode-org/icu",
        repository_id = 49244766,
        tag = "release-{version}",
        exclude_tags = { "*rc*" },
    },
    source = {
        url = "https://github.com/unicode-org/icu/releases/download/{tag}/icu4c-{version}-sources.tgz",
        archive = "tar.gz",
        strip_prefix = "icu",
    },
    build = {
        backend = "custom",
        libraries = {
            "lib/libicudata.a",
            "lib/libicudata.{shared_extension}",
            "lib/libicui18n.a",
            "lib/libicui18n.{shared_extension}",
            "lib/libicuio.a",
            "lib/libicuio.{shared_extension}",
            "lib/libicutest.a",
            "lib/libicutest.{shared_extension}",
            "lib/libicutu.a",
            "lib/libicutu.{shared_extension}",
            "lib/libicuuc.a",
            "lib/libicuuc.{shared_extension}",
        },
        steps = {
            configure = {
                {
                    "sh",
                    "-c",
                    -- The tarball unpacks to icu/, and configure lives in icu/source.
                    'cd source && exec ./configure "$@"',
                    "sh",
                    "--prefix={prefix}",
                    "--enable-static",
                    "--enable-shared",
                    -- Absolute install names, so the libraries resolve from the store and pass the scan.
                    "--enable-rpath",
                    "--disable-samples",
                    "--disable-tests",
                },
            },
            build = {
                { "make", "-C", "source", "-j{jobs}" },
            },
            install = {
                { "make", "-C", "source", "install" },
            },
        },
    },
    outputs = {
        bins = {
            "derb",
            "escapesrc",
            "genbrk",
            "genccode",
            "gencfu",
            "gencmn",
            "gencnval",
            "gendict",
            "gennorm2",
            "genrb",
            "gensprep",
            "icu-config",
            "icuexportdata",
            "icuinfo",
            "icupkg",
            "makeconv",
            "pkgdata",
            "uconv",
        },
        checks = {
            { "icuinfo" },
            { "uconv", "--version" },
            {
                "sh",
                "-c",
                "printf 'caf\\303\\251' | uconv -f UTF-8 -t ISO-8859-1 | od -An -tx1 | tr -d ' \\n' | grep -q '^636166e9$' && printf '%s\\n' ok",
            },
            {
                "sh",
                "-c",
                "printf 'caf\\303\\251' | uconv -f UTF-8 -t UTF-16BE | od -An -tx1 | tr -d ' \\n' | grep -q '^00630061006600e9$' && printf '%s\\n' ok",
            },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "79.1",
        },
        ["aarch64-macos"] = {
            default_version = "79.1",
        },
        ["x86_64-linux"] = {
            default_version = "79.1",
        },
    },
    versions = {
        ["79.1"] = {
            digests = {
                ["aarch64-linux"] = "06fa63ecb521048f8082f12ad988f6b678d90cbd88aafce24cbc94902b191d99",
                ["aarch64-macos"] = "06fa63ecb521048f8082f12ad988f6b678d90cbd88aafce24cbc94902b191d99",
                ["x86_64-linux"] = "06fa63ecb521048f8082f12ad988f6b678d90cbd88aafce24cbc94902b191d99",
            },
        },
    },
}
