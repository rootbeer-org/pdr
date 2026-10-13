-- Host toolchain stand-ins until toolchains are catalog packages (REDESIGN phase 6).
-- Changing `system` rekeys every source build on that platform.
local linux = "builder-sha256:5004a58ca6f123b9dd58e1ff00ca6044eac2cac7e5be08bef6411d00d8f134c2" -- .github/builder/Dockerfile

return {
    ["aarch64-linux"] = { system = linux },
    ["x86_64-linux"] = { system = linux },
    -- Xcode 16.4, which .github/actions/build-package selects on macos-15.
    ["aarch64-macos"] = { system = "macos-sdk-15.5-clang-1700.0.13.5" },
}
