return {
    name = "iproute2mac",
    description = "Inspect and configure macOS networking with ip, bridge, and ss (requires Python 3.10+)",
    homepage = "https://github.com/brona/iproute2mac",
    recipe_maintainers = { "tale" },
    default_license = "MIT",
    upstream = {
        github = "brona/iproute2mac",
        repository_id = 24814763,
        tag = "v{version}",
        exclude_tags = { "v.1.2.3", "v.1.4.2" },
    },
    source = {
        url = "https://codeload.github.com/brona/iproute2mac/tar.gz/refs/tags/{tag}",
        git = {
            github = "brona/iproute2mac",
            branch = "master",
        },
        archive = "tar.gz",
        strip_prefix = "iproute2mac-{version}",
    },
    build = {
        backend = "custom",
        steps = {
            -- Upstream scripts use /usr/bin/env python3; the interpreter is supplied by the host.
            build = {
                {
                    "python3",
                    "-c",
                    "import pathlib; [compile(p.read_bytes(), str(p), 'exec') for p in pathlib.Path('src').glob('*.py')]",
                },
            },
            -- The full upstream suite changes routes and interfaces and requires sudo.
            check = {
                { "python3", "src/ip.py", "-j", "addr", "show", "lo0" },
                { "python3", "src/bridge.py", "-j", "link", "show" },
                { "python3", "src/ss.py", "-j", "-n", "-t" },
            },
            install = {
                { "mkdir", "-p", "{prefix}/libexec/iproute2mac" },
                {
                    "install",
                    "-m",
                    "755",
                    "src/ip.py",
                    "src/bridge.py",
                    "src/ss.py",
                    "{prefix}/libexec/iproute2mac/",
                },
                { "install", "-m", "644", "src/iproute2mac.py", "{prefix}/libexec/iproute2mac/" },
            },
        },
    },
    outputs = {
        -- Keeping the entry points beside their module also works through profile symlinks.
        bins = {
            bridge = "libexec/iproute2mac/bridge.py",
            ip = "libexec/iproute2mac/ip.py",
            ss = "libexec/iproute2mac/ss.py",
        },
        checks = {
            { "ip", "-V" },
            { "bridge", "-V" },
            { "ss", "-V" },
            { "ip", "-j", "addr", "show", "lo0" },
            { "bridge", "-j", "link", "show" },
            { "ss", "-j", "-n", "-t" },
        },
    },
    platforms = {
        ["aarch64-macos"] = {
            default_version = "1.7.5",
        },
    },
    versions = {
        ["1.7.5"] = {
            digests = {
                ["aarch64-macos"] = "ebc2c6e09a2f2d95cdfc8f66c1e14b9a432fb75f3162f7420a8a1ecfbf6ade22",
            },
        },
    },
}
