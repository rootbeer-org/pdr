return {
    name = "libudev-zero",
    description = "Daemonless replacement for libudev",
    homepage = "https://github.com/illiliti/libudev-zero",
    recipe_maintainers = { "tale" },
    default_license = "ISC",
    upstream = {
        github = "illiliti/libudev-zero",
        repository_id = 277056641,
    },
    source = {
        url = "https://github.com/illiliti/libudev-zero/archive/refs/tags/{version}.tar.gz",
        archive = "tar.gz",
        strip_prefix = "libudev-zero-{version}",
    },
    build = {
        backend = "custom",
        libraries = { "lib/libudev.a" },
        steps = {
            build = {
                {
                    "make",
                    "-j{jobs}",
                    "PREFIX=/",
                    -- Optional at runtime: the host's hwdata names USB vendors when it exists.
                    "USB_IDS_PATH=/usr/share/hwdata/usb.ids",
                    "libudev.a",
                    "libudev.pc",
                },
            },
            -- Upstream has no test suite, so the check links and runs an enumeration.
            check = {
                {
                    "/bin/sh",
                    "-ec",
                    "printf '#include \"udev.h\"\\nint main(void) { struct udev *u = udev_new(); struct udev_enumerate *e = udev_enumerate_new(u); int r = udev_enumerate_add_match_subsystem(e, \"hidraw\") || udev_enumerate_scan_devices(e); udev_enumerate_unref(e); udev_unref(u); return r; }\\n' > check.c; ${CC:-cc} -o check check.c libudev.a -pthread; ./check",
                },
            },
            install = {
                { "make", "PREFIX=/", "DESTDIR={prefix}", "install-static" },
            },
        },
    },
    outputs = {},
    platforms = {
        ["aarch64-linux"] = {
            default_version = "1.0.5",
        },
        ["x86_64-linux"] = {
            default_version = "1.0.5",
        },
    },
    versions = {
        ["1.0.5"] = {
            digests = {
                ["aarch64-linux"] = "bf4372f79ddbe6b0e266a3d2994ffac7018a7edf4f87632aecb5176565d96138",
                ["x86_64-linux"] = "bf4372f79ddbe6b0e266a3d2994ffac7018a7edf4f87632aecb5176565d96138",
            },
        },
    },
}
