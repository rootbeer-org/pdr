-- Host toolchain stand-ins until toolchains are catalog packages (REDESIGN phase 6).
-- Changing `system` rekeys every source build on that platform.
local linux = "builder-sha256:d6d343632516b9700159808c0fd57756858fff61a4e637d68b173cdcf7fba32a" -- .github/builder/Dockerfile

return {
    ["aarch64-linux"] = { system = linux },
    ["x86_64-linux"] = { system = linux },
    -- Xcode 16.4, which .github/actions/build-package selects on macos-15.
    ["aarch64-macos"] = { system = "macos-sdk-15.5-clang-1700.0.13.5" },
}
