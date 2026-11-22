return {
    name = "tailscale-app",
    description = "Connect devices on a private WireGuard network from the menu bar",
    homepage = "https://tailscale.com/",
    recipe_maintainers = { "tale" },
    default_license = "LicenseRef-Proprietary",
    upstream = {
        github = "tailscale/tailscale",
        repository_id = 237523442,
        tag = "v{version}",
    },
    prebuilt = {
        url = "https://pkgs.tailscale.com/stable/Tailscale-{version}-macos.pkg",
        dependencies = {
            { package = "rb-unpack", kind = "build" },
        },
        mirror = true,
        steps = {
            install = {
                -- The CLI finds its bundle from the path it runs as, so a link
                -- into the app fails and this wrapper runs it by its real path.
                {
                    "/bin/sh",
                    "-c",
                    [[mkdir bin && printf '#!/bin/sh\nexec "%s/Tailscale.app/Contents/MacOS/Tailscale" "$@"\n' "$1" > bin/tailscale && chmod 755 bin/tailscale]],
                    "sh",
                    "{prefix}",
                },
            },
        },
    },
    outputs = {
        bins = { "tailscale" },
        apps = {
            -- Its network extension only loads from /Applications.
            ["Tailscale.app"] = { path = "Tailscale.app", updates = "self", location = "system" },
        },
        -- The wrapper's interpreter.
        host = { "/bin/sh" },
        checks = {
            { "tailscale", "version" },
        },
    },
    platforms = {
        ["aarch64-macos"] = {
            default_version = "1.104.7",
        },
    },
    versions = {
        ["1.104.7"] = {
            digests = {
                ["aarch64-macos"] = "0ecab60e098d31f9cbd334867474293dc08978154665da75c3f3fe1f8215d6e7",
            },
        },
    },
}
