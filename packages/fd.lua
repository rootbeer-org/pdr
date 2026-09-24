return {
    name = "fd",
    aliases = { "fd-find" },
    description = "Find files by name",
    homepage = "https://github.com/sharkdp/fd",
    recipe_maintainers = { "tale" },
    default_license = "MIT OR Apache-2.0",
    upstream = {
        github = "sharkdp/fd",
        repository_id = 90793418,
        tag = "v{version}",
    },
    prebuilt = {
        github = "sharkdp/fd",
        tag = "v{version}",
        asset = "fd-{tag}-{target}.tar.gz",
    },
    outputs = {
        bins = { "fd" },
        checks = {
            { "fd", "--version" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            target = "aarch64-unknown-linux-musl",
            default_version = "10.5.0",
        },
        ["aarch64-macos"] = {
            target = "aarch64-apple-darwin",
            default_version = "10.5.0",
        },
        ["x86_64-linux"] = {
            target = "x86_64-unknown-linux-musl",
            default_version = "10.5.0",
        },
    },
    versions = {
        ["10.4.2"] = {
            digests = {
                ["aarch64-linux"] = "f32d3657473fba74e2600babc8db0b93420d51169223b7e8143b2ed55d8fd9e8",
                ["aarch64-macos"] = "623dc0afc81b92e4d4606b380d7bc91916ba7b97814263e554d50923a39e480a",
                ["x86_64-linux"] = "e3257d48e29a6be965187dbd24ce9af564e0fe67b3e73c9bdcd180f4ec11bdde",
            },
            revision = 2,
        },
        ["10.5.0"] = {
            digests = {
                ["aarch64-linux"] = "d76c4317f7d5dba69f8a2a15856c90c777e7f0dd4e85f0de8c76de6992c374d4",
                ["aarch64-macos"] = "b67e1836c468e42e411984b56e52fa7abec08c2bd22c867398e7cc134aac5e12",
                ["x86_64-linux"] = "761c72dc8e120d85b22292063be8a796e2eeb20eb3e4f38b8fa2343ccf3514a7",
            },
            revision = 2,
        },
    },
}
