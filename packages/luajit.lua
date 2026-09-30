return {
    name = "luajit",
    description = "Just-in-time compiler for Lua",
    homepage = "https://luajit.org",
    recipe_maintainers = { "tale" },
    default_license = "MIT",
    -- LuaJIT publishes no releases: each commit on v2.1 is a release, versioned by its commit
    -- time. Git archives carry that time in .relver, so versions are updated by hand.
    source = {
        url = "https://codeload.github.com/LuaJIT/LuaJIT/tar.gz/{commit}",
        archive = "tar.gz",
        strip_prefix = "LuaJIT-{commit}",
    },
    build = {
        backend = "custom",
        libraries = { "lib/libluajit-5.1.a" },
        steps = {
            build = {
                {
                    "/usr/bin/env",
                    -- Upstream refuses to build on macOS without a deployment target; Linux ignores it.
                    "MACOSX_DEPLOYMENT_TARGET=11.0",
                    "make",
                    "-j{jobs}",
                    "PREFIX=/",
                    -- Static only: the shared library would carry an absolute install name.
                    "BUILDMODE=static",
                },
            },
            -- Upstream's test suite lives in a separate repository, so the check exercises the
            -- JIT and FFI with the built interpreter.
            check = {
                {
                    "src/luajit",
                    "-e",
                    "local ffi = require('ffi'); ffi.cdef('int abs(int)'); local s = 0; for i = 1, 1e6 do s = s + ffi.C.abs(-i) % 7 end; assert(s == 2999998); assert(jit.status())",
                },
            },
            install = {
                {
                    "/usr/bin/env",
                    "MACOSX_DEPLOYMENT_TARGET=11.0",
                    "make",
                    "PREFIX=/",
                    "BUILDMODE=static",
                    "DESTDIR={prefix}",
                    "install",
                },
            },
        },
    },
    outputs = {
        bins = { "luajit" },
        checks = {
            { "luajit", "-v" },
            {
                "luajit",
                "-e",
                "local ffi = require('ffi'); ffi.cdef('int abs(int)'); assert(ffi.C.abs(-3) == 3); print(jit.version)",
            },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "2.1.1788856981",
        },
        ["aarch64-macos"] = {
            default_version = "2.1.1788856981",
        },
        ["x86_64-linux"] = {
            default_version = "2.1.1788856981",
        },
    },
    versions = {
        ["2.1.1788856981"] = {
            digests = {
                ["aarch64-linux"] = "6e5fec07750add912e7c3eae0c194d24cd6d023714e1f04a0298a5b4819e4457",
                ["aarch64-macos"] = "6e5fec07750add912e7c3eae0c194d24cd6d023714e1f04a0298a5b4819e4457",
                ["x86_64-linux"] = "6e5fec07750add912e7c3eae0c194d24cd6d023714e1f04a0298a5b4819e4457",
            },
            commit = "c6ffc141a8762b41703f9287d63d93622a13dd8f",
        },
    },
}
