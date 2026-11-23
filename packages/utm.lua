return {
    name = "utm",
    description = "Run virtual machines on macOS",
    homepage = "https://mac.getutm.app/",
    recipe_maintainers = { "tale" },
    default_license = "Apache-2.0",
    upstream = {
        github = "utmapp/UTM",
        tag = "v{version}",
    },
    prebuilt = {
        url = "https://github.com/utmapp/UTM/releases/download/v{version}/UTM.dmg",
        install = "Dmg",
        mirror = true,
    },
    outputs = {
        apps = {
            ["UTM.app"] = "UTM.app",
        },
        -- D3DMetal loads these from Apple's Game Porting Toolkit when it's
        -- installed, and works without them.
        host = {
            "@rpath/libmetalirconverter.dylib",
            "@rpath/libdxccontainer.dylib",
            "@rpath/d3dmetal-native.framework/d3dmetal-native",
        },
    },
    platforms = {
        ["aarch64-macos"] = {
            default_version = "5.0.9",
        },
    },
    versions = {
        ["5.0.8"] = {
            digests = {
                ["aarch64-macos"] = "7b2d7b2e2a02b3de1757ef19a8f36573e6d9cceae8c8cca0abcbcaa4a852019a",
            },
            trees = {
                ["aarch64-macos"] = "1e06d09e56833f4b566feb03657ea0d7f5527275790b939c57d1b70c7a0b7013",
            },
        },
        ["5.0.9"] = {
            digests = {
                ["aarch64-macos"] = "607c3b7eb4ad856163c433232237dfa17a42bf2492d2e8d4b7971aebad2e6b17",
            },
            trees = {
                ["aarch64-macos"] = "7318fa75882e4454d18bce67e244900a7978530bf83cb67b4749b7448b094b5f",
            },
        },
    },
}
