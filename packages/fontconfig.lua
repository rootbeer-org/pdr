return {
    name = "fontconfig",
    description = "Font configuration and matching library",
    homepage = "https://www.freedesktop.org/wiki/Software/fontconfig/",
    recipe_maintainers = { "tale" },
    default_license = "HPND-sell-variant",
    upstream = {
        git = "https://gitlab.freedesktop.org/fontconfig/fontconfig.git",
        tag = "{version}",
    },
    source = {
        url = "https://gitlab.freedesktop.org/api/v4/projects/890/packages/generic/fontconfig/{version}/fontconfig-{version}.tar.xz",
        archive = "tar.xz",
        strip_prefix = "fontconfig-{version}",
    },
    build = {
        backend = "custom",
        dependencies = {
            {
                package = "pkgconf",
                kind = "build",
            },
            {
                package = "gperf",
                kind = "build",
            },
            -- freetype's pkg-config file requires these, so configure needs them to find freetype.
            {
                package = "zlib",
                kind = "link_runtime",
            },
            {
                package = "libpng",
                kind = "link_runtime",
            },
            {
                package = "bzip2",
                kind = "link_runtime",
            },
            {
                package = "brotli",
                kind = "link_runtime",
            },
            {
                package = "freetype",
                kind = "link_runtime",
            },
            {
                package = "expat",
                kind = "link",
            },
        },
        libraries = {
            "lib/libfontconfig.a",
            "lib/libfontconfig.{shared_extension}",
        },
        -- The check suite writes under /tmp, which the build sandbox forbids.
        steps = {
            configure = {
                {
                    "/bin/sh",
                    "./configure",
                    "--prefix={prefix}",
                    "--enable-static",
                    "--enable-shared",
                    "--disable-docs",
                    "--disable-nls",
                    "--disable-cache-build",
                    "--with-expat={dependencies.expat}",
                    "--sysconfdir={prefix}/etc",
                    "--localstatedir={prefix}/var",
                    "--with-default-fonts=/usr/share/fonts",
                    "--with-add-fonts=/System/Library/Fonts,/Library/Fonts,/usr/local/share/fonts",
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
    outputs = {
        bins = {
            "fc-cache",
            "fc-cat",
            "fc-conflist",
            "fc-list",
            "fc-match",
            "fc-pattern",
            "fc-query",
            "fc-scan",
            "fc-validate",
        },
        checks = {
            { "fc-list", "--version" },
            { "fc-match", "sans" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "2.18.3",
        },
        ["aarch64-macos"] = {
            default_version = "2.18.3",
        },
        ["x86_64-linux"] = {
            default_version = "2.18.3",
        },
    },
    versions = {
        ["2.18.3"] = {
            digests = {
                ["aarch64-linux"] = "4f7b554a38cdf78c033f666c8871f3749e14a094f65a07f630c91ed0b43d35e3",
                ["aarch64-macos"] = "4f7b554a38cdf78c033f666c8871f3749e14a094f65a07f630c91ed0b43d35e3",
                ["x86_64-linux"] = "4f7b554a38cdf78c033f666c8871f3749e14a094f65a07f630c91ed0b43d35e3",
            },
        },
    },
}
