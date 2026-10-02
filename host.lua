-- Host toolchain stand-ins until toolchains are catalog packages (REDESIGN phase 6).
-- Changing `system` rekeys every source build on that platform; `rust` rekeys Rust builds.
local linux = "builder-sha256:d6d343632516b9700159808c0fd57756858fff61a4e637d68b173cdcf7fba32a" -- .github/builder/Dockerfile
local rust = "1.98.1" -- .github/actions/setup-package-tools

return {
    ["aarch64-linux"] = { system = linux, rust = rust },
    ["x86_64-linux"] = { system = linux, rust = rust },
    -- TODO: Pin Xcode in CI and use its version; the runner image is all that's pinned today.
    ["aarch64-macos"] = { system = "macos-15", rust = rust },
}
