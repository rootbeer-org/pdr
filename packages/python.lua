return {
    name = "python",
    description = "High-level, general-purpose programming language",
    homepage = "https://www.python.org",
    recipe_maintainers = { "tale" },
    default_license = "PSF-2.0",
    -- Releases are tagged by build date, not by version, so the updater cannot
    -- follow them. Bump by hand: rb drv bump python <version> --serial <date>
    prebuilt = {
        url = "https://github.com/astral-sh/python-build-standalone/releases/download/{serial}/cpython-{version}+{serial}-{target}-install_only_stripped.tar.gz",
        install = {
            Archive = {
                format = "TarGz",
                strip_prefix = "python",
            },
        },
        steps = {
            -- Tcl/Tk libraries carry a build-host RUNPATH, and only _tkinter loads them.
            install = {
                {
                    "sh",
                    "-c",
                    "rm -rf bin/idle3* lib/libtcl* lib/libtk* lib/tcl9* lib/tk9* lib/thread3* lib/itcl* lib/python3.*/lib-dynload/_tkinter*.so lib/python3.*/tkinter lib/python3.*/idlelib lib/python3.*/turtledemo lib/python3.*/turtle.py",
                },
            },
        },
    },
    outputs = {
        bins = { "python3", "pip3", "python", "pip" },
        -- The stable-ABI stub's DT_NEEDED is a literal $ORIGIN path the scan cannot follow.
        host = { "$ORIGIN/../lib/libpython3.15.so.1.0" },
        checks = {
            { "python3", "--version" },
            {
                "python3",
                "-c",
                "import ssl, sqlite3, zlib, bz2, lzma, ctypes, readline; print(ssl.OPENSSL_VERSION)",
            },
            { "python3", "-m", "pip", "--version" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            target = "aarch64-unknown-linux-gnu",
            default_version = "3.15.2",
        },
        ["aarch64-macos"] = {
            target = "aarch64-apple-darwin",
            default_version = "3.15.2",
        },
        ["x86_64-linux"] = {
            target = "x86_64-unknown-linux-gnu",
            default_version = "3.15.2",
        },
    },
    versions = {
        ["3.15.2"] = {
            serial = 20261110,
            digests = {
                ["aarch64-linux"] = "d1367a6c3cd86a9e35712072841f1376859f3b47a2a54e224421a0f9fd169047",
                ["aarch64-macos"] = "7e58607647b5b4832092a339ff1c55eeeccee128221232509b8fc8d27957065e",
                ["x86_64-linux"] = "ad23d1b73fac26440b0306ae06911031344c49a90ec19716c8362e7fa40cae43",
            },
        },
    },
}
