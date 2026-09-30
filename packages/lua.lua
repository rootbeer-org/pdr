return {
    name = "lua",
    description = "Lightweight embeddable scripting language",
    homepage = "https://www.lua.org",
    recipe_maintainers = { "tale" },
    default_license = "MIT",
    -- Released only on lua.org, so versions are updated by hand.
    source = {
        url = "https://www.lua.org/ftp/lua-{version}.tar.gz",
        archive = "tar.gz",
        strip_prefix = "lua-{version}",
    },
    build = {
        backend = "custom",
        libraries = { "lib/liblua.a" },
        steps = {
            -- Upstream's default target picks the platform from uname: macOS links the system
            -- libedit for line editing, while Linux builds without it until the catalog has
            -- readline.
            build = {
                { "make", "-j{jobs}" },
            },
            -- The release omits upstream's test suite, which ships separately.
            check = {
                { "make", "test" },
                {
                    "src/lua",
                    "-e",
                    "assert(load('return 6 * 7')() == 42); assert(string.pack('>I2', 258) == '\\1\\2'); assert(utf8.char(955) == '\\u{3BB}')",
                },
            },
            install = {
                { "make", "INSTALL_TOP={prefix}", "install" },
            },
        },
    },
    outputs = {
        bins = { "lua", "luac" },
        checks = {
            { "lua", "-v" },
            { "lua", "-e", "print(table.concat({ 1 + 1, math.floor(7 / 2) }, ' '))" },
            { "luac", "-v" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "5.5.1",
        },
        ["aarch64-macos"] = {
            default_version = "5.5.1",
        },
        ["x86_64-linux"] = {
            default_version = "5.5.1",
        },
    },
    versions = {
        ["5.5.1"] = {
            digests = {
                ["aarch64-linux"] = "1c4b4068d67061f2a2231ad2b5422e77acea1487ea9890f6320af614f4373dce",
                ["aarch64-macos"] = "1c4b4068d67061f2a2231ad2b5422e77acea1487ea9890f6320af614f4373dce",
                ["x86_64-linux"] = "1c4b4068d67061f2a2231ad2b5422e77acea1487ea9890f6320af614f4373dce",
            },
        },
    },
}
