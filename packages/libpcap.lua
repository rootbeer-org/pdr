return {
    name = "libpcap",
    description = "Packet capture library",
    homepage = "https://www.tcpdump.org",
    recipe_maintainers = { "tale" },
    default_license = "BSD-3-Clause",
    upstream = {
        github = "the-tcpdump-group/libpcap",
        repository_id = 9435887,
        tag = "libpcap-{version}",
    },
    source = {
        url = "https://www.tcpdump.org/release/libpcap-{version}.tar.gz",
        archive = "tar.gz",
        strip_prefix = "libpcap-{version}",
    },
    build = {
        backend = "custom",
        dependencies = {
            {
                package = "flex",
                kind = "build",
            },
            {
                package = "bison",
                kind = "build",
            },
        },
        libraries = { "lib/libpcap.a", "lib/libpcap.{shared_extension}" },
        steps = {
            configure = {
                {
                    "sh",
                    "./configure",
                    "--prefix={prefix}",
                    -- Pinned off so no host capture backend or its library links in.
                    "--disable-bluetooth",
                    "--disable-dbus",
                    "--disable-netmap",
                    "--disable-rdma",
                    "--disable-usb",
                    "--without-dag",
                    "--without-libnl",
                    "--without-snf",
                },
            },
            build = {
                { "make", "-j{jobs}" },
            },
            check = {
                { "make", "check" },
            },
            install = {
                { "make", "install" },
            },
        },
    },
    outputs = {
        bins = { "pcap-config" },
        checks = {
            { "pcap-config", "--version" },
            { "pcap-config", "--libs" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "1.11.1",
        },
        ["aarch64-macos"] = {
            default_version = "1.11.1",
        },
        ["x86_64-linux"] = {
            default_version = "1.11.1",
        },
    },
    versions = {
        ["1.11.0"] = {
            digests = {
                ["aarch64-linux"] = "596389bc8560ea027dff9db8aaf6c173d992366d9aef4baf5d7c6d180b4d49ad",
                ["aarch64-macos"] = "596389bc8560ea027dff9db8aaf6c173d992366d9aef4baf5d7c6d180b4d49ad",
                ["x86_64-linux"] = "596389bc8560ea027dff9db8aaf6c173d992366d9aef4baf5d7c6d180b4d49ad",
            },
        },
        ["1.11.1"] = {
            digests = {
                ["aarch64-linux"] = "7985b1d20ff82c1e384115038046e0b15034648c6f45c92e08601d4ee1b369ed",
                ["aarch64-macos"] = "7985b1d20ff82c1e384115038046e0b15034648c6f45c92e08601d4ee1b369ed",
                ["x86_64-linux"] = "7985b1d20ff82c1e384115038046e0b15034648c6f45c92e08601d4ee1b369ed",
            },
        },
    },
}
