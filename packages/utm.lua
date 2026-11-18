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
        dependencies = {
            { package = "7zip", kind = "build" },
        },
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
        },
        ["5.0.9"] = {
            digests = {
                ["aarch64-macos"] = "607c3b7eb4ad856163c433232237dfa17a42bf2492d2e8d4b7971aebad2e6b17",
            },
        },
    },
}
