return {
    name = "libyaml",
    description = "YAML 1.1 parser and emitter library",
    homepage = "https://github.com/yaml/libyaml",
    recipe_maintainers = { "tale" },
    default_license = "MIT",
    upstream = {
        github = "yaml/libyaml",
        repository_id = 2699072,
        tag = "{version}",
    },
    source = {
        url = "https://github.com/yaml/libyaml/releases/download/{tag}/yaml-{version}.tar.gz",
        archive = "tar.gz",
        strip_prefix = "yaml-{version}",
    },
    build = {
        backend = "autotools",
        configure = {
            "--enable-shared",
            "--enable-static",
            "--with-pic",
            "--disable-rpath",
        },
        libraries = { "lib/libyaml.a", "lib/libyaml.{shared_extension}" },
    },
    outputs = {},
    platforms = {
        ["aarch64-linux"] = {
            default_version = "0.2.6",
        },
        ["aarch64-macos"] = {
            default_version = "0.2.6",
        },
        ["x86_64-linux"] = {
            default_version = "0.2.6",
        },
    },
    versions = {
        ["0.2.5"] = {
            digests = {
                ["aarch64-linux"] = "c642ae9b75fee120b2d96c712538bd2cf283228d2337df2cf2988e3c02678ef4",
                ["aarch64-macos"] = "c642ae9b75fee120b2d96c712538bd2cf283228d2337df2cf2988e3c02678ef4",
                ["x86_64-linux"] = "c642ae9b75fee120b2d96c712538bd2cf283228d2337df2cf2988e3c02678ef4",
            },
        },
        ["0.2.6"] = {
            digests = {
                ["aarch64-linux"] = "43b393a117bd4fe39812fddc94e3d654359a3ae05653dcf0110a1122d1747e61",
                ["aarch64-macos"] = "43b393a117bd4fe39812fddc94e3d654359a3ae05653dcf0110a1122d1747e61",
                ["x86_64-linux"] = "43b393a117bd4fe39812fddc94e3d654359a3ae05653dcf0110a1122d1747e61",
            },
        },
    },
}
