return {
    name = "libpng",
    description = "PNG reference library",
    homepage = "http://www.libpng.org/pub/png/libpng.html",
    recipe_maintainers = { "tale" },
    default_license = "libpng-2.0",
    upstream = {
        github = "pnggroup/libpng",
        repository_id = 3768025,
        tag = "v{version}",
        exclude_tags = { "v*beta*", "v*rc*" },
    },
    source = {
        url = "https://download.sourceforge.net/libpng/libpng-{version}.tar.xz",
        archive = "tar.xz",
        strip_prefix = "libpng-{version}",
    },
    build = {
        backend = "autotools",
        configure = {
            "--enable-shared",
            "--enable-static",
        },
        dependencies = {
            {
                package = "zlib",
                kind = "link_runtime",
            },
        },
        libraries = { "lib/libpng16.a", "lib/libpng16.{shared_extension}" },
    },
    outputs = {
        bins = { "pngfix", "png-fix-itxt", "libpng-config", "libpng16-config" },
        checks = {
            { "libpng16-config", "--version" },
            {
                "sh",
                "-c",
                'png=$(mktemp) && printf %s \'iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mNkYPhfDwAChwGA60e6kgAAAABJRU5ErkJggg==\' | base64 -d > "$png" && pngfix --quiet "$png"; status=$?; rm -f "$png"; exit $status',
            },
            { "png-fix-itxt", "--help" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "1.6.59",
        },
        ["aarch64-macos"] = {
            default_version = "1.6.59",
        },
        ["x86_64-linux"] = {
            default_version = "1.6.59",
        },
    },
    versions = {
        ["1.6.59"] = {
            digests = {
                ["aarch64-linux"] = "d80dd2a38a37f803cb9b6ac7b14bd6e74ddc3b654780a8380bdf93523fdb4389",
                ["aarch64-macos"] = "d80dd2a38a37f803cb9b6ac7b14bd6e74ddc3b654780a8380bdf93523fdb4389",
                ["x86_64-linux"] = "d80dd2a38a37f803cb9b6ac7b14bd6e74ddc3b654780a8380bdf93523fdb4389",
            },
        },
    },
}
