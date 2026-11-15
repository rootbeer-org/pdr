return {
    name = "gnu-sed",
    description = "GNU stream editor for filtering and transforming text",
    homepage = "https://www.gnu.org/software/sed/",
    recipe_maintainers = { "tale" },
    default_license = "GPL-3.0-or-later",
    upstream = {
        git = "https://git.savannah.gnu.org/git/sed.git",
        tag = "v{version}",
    },
    source = {
        url = "https://ftp.gnu.org/gnu/sed/sed-{version}.tar.xz",
        archive = "tar.xz",
        strip_prefix = "sed-{version}",
    },
    build = {
        -- The check suite opens /dev/null through diff, which the build sandbox forbids.
        backend = "custom",
        steps = {
            configure = {
                { "/bin/sh", "./configure", "--prefix={prefix}", "--disable-nls" },
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
        bins = { "sed" },
        checks = {
            { "sed", "--version" },
            {
                "sh",
                "-c",
                [[test "$(printf 'hello world\n' | sed 's/world/rootbeer/')" = "hello rootbeer"]],
            },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "4.10",
        },
        ["aarch64-macos"] = {
            default_version = "4.10",
        },
        ["x86_64-linux"] = {
            default_version = "4.10",
        },
    },
    versions = {
        ["4.10"] = {
            digests = {
                ["aarch64-linux"] = "b8e72182b2ec96a3574e2998c47b7aaa64cc20ce000d8e9ac313cc07cecf28c7",
                ["aarch64-macos"] = "b8e72182b2ec96a3574e2998c47b7aaa64cc20ce000d8e9ac313cc07cecf28c7",
                ["x86_64-linux"] = "b8e72182b2ec96a3574e2998c47b7aaa64cc20ce000d8e9ac313cc07cecf28c7",
            },
        },
    },
}
