return {
    name = "eza",
    description = "List files with colors, icons, and Git status",
    homepage = "https://eza.rocks/",
    recipe_maintainers = { "tale" },
    default_license = "EUPL-1.2",
    upstream = {
        github = "eza-community/eza",
        repository_id = 671832156,
        tag = "v{version}",
    },
    source = {
        url = "https://codeload.github.com/eza-community/eza/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "eza-{version}",
    },
    build = {
        backend = "rust",
        rust = {
            packages = { "eza" },
            features = { "git", "vendored-libgit2" },
            no_default_features = true,
        },
    },
    outputs = {
        bins = { "eza" },
        checks = {
            { "eza", "--version" },
            { "eza", "--long", "--all", "." },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "0.23.5",
        },
        ["aarch64-macos"] = {
            default_version = "0.23.5",
        },
        ["x86_64-linux"] = {
            default_version = "0.23.5",
        },
    },
    versions = {
        ["0.23.5"] = {
            digests = {
                ["aarch64-linux"] = "bbf179f2611c904014431740b559e8055276c12fcf978a7e31c271663548337f",
                ["aarch64-macos"] = "bbf179f2611c904014431740b559e8055276c12fcf978a7e31c271663548337f",
                ["x86_64-linux"] = "bbf179f2611c904014431740b559e8055276c12fcf978a7e31c271663548337f",
            },
        },
    },
}
