return {
    name = "node",
    description = "JavaScript runtime built on V8",
    homepage = "https://nodejs.org",
    recipe_maintainers = { "tale" },
    default_license = "MIT",
    upstream = {
        github = "nodejs/node",
        repository_id = 27193779,
        tag = "v{version}",
        -- Odd majors are short-lived releases, not LTS lines.
        exclude_tags = { "v[13579].*", "v[1-9][13579].*" },
        lines = { by = "major", keep = 2 },
    },
    prebuilt = {
        url = "https://nodejs.org/dist/v{version}/node-v{version}-{target}.tar.xz",
        install = {
            Archive = {
                format = "TarXz",
                strip_prefix = "node-v{version}-{target}",
            },
        },
        steps = {
            -- npm's bash completion hardcodes /bin/bash, which the scan rejects.
            install = {
                { "rm", "-f", "lib/node_modules/npm/lib/utils/completion.sh" },
            },
        },
    },
    outputs = {
        bins = { "node", "npm", "npx" },
        -- Upstream's Linux binaries load the host's libatomic.
        host = { "libatomic.so.1" },
        checks = {
            { "node", "--version" },
            { "node", "-e", "console.log(1+1)" },
            { "npm", "--version" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            target = "linux-arm64",
            default_version = "26.13.1",
        },
        ["aarch64-macos"] = {
            target = "darwin-arm64",
            default_version = "26.13.1",
        },
        ["x86_64-linux"] = {
            target = "linux-x64",
            default_version = "26.13.1",
        },
    },
    versions = {
        ["24.22.3"] = {
            digests = {
                ["aarch64-linux"] = "6e51a2ada00f0011cc266f65d98922b403d7ad88f809ca2aa615a5fe1ce6e86c",
                ["aarch64-macos"] = "1d64136c8a43d648d1b3bad10797a4c995b1ca032d2bde8799de43b37f058fe5",
                ["x86_64-linux"] = "4f2b175a6d53a5c617a80dba2676238a0688cef28c6da4eba35c7d844e66fcfb",
            },
        },
        ["26.13.1"] = {
            digests = {
                ["aarch64-linux"] = "89e1853138db51e8b82d3e98ba9c0d3f2956a28e5e55ea1b7e12d25aae92d5dd",
                ["aarch64-macos"] = "af6202f5370a3a5209e85dc543758dfd9f44c8726626a236730cd603a67a8559",
                ["x86_64-linux"] = "5c063e46bab0fbc1c17cc445d7ff129cbdcd0471be6ed83b6ab864f8143bc864",
            },
        },
    },
}
