return {
    name = "rush",
    description = "Run a POSIX shell with interactive editing and completions",
    homepage = "https://rush.horse",
    recipe_maintainers = { "tale" },
    default_license = "MIT",
    source = {
        url = "https://codeload.github.com/rockorager/rush/tar.gz/294212ebd35f5b755062186a66bcfd6436d3627a",
        archive = "tar.gz",
        strip_prefix = "rush-294212ebd35f5b755062186a66bcfd6436d3627a",
        patches = {
            "--- a/build.zig\010+++ b/build.zig\010@@ -23,7 +23,7 @@\010         \"lto\",\010         \"Link-time optimization (none, thin, full; default: none)\",\010     ) orelse .none;\010-    const version = versionString(b);\010+    const version = b.option([]const u8, \"version\", \"Exact version for source snapshot builds\") orelse versionString(b);\010     const build_config = b.addOptions();\010     build_config.addOption([]const u8, \"version\", version);\010 \010--- a/src/file_util.zig\010+++ b/src/file_util.zig\010@@ -22,3 +22,16 @@\010     }\010     return bytes.toOwnedSlice(allocator);\010 }\010+\010+/// Returns an owned executable-relative data directory when available.\010+pub fn executableDataDir(allocator: std.mem.Allocator) !?[]u8 {\010+    if (comptime @import(\"builtin\").cpu.arch.isWasm()) return null;\010+\010+    const io = std.Io.Threaded.global_single_threaded.io();\010+    var executable_buffer: [std.fs.max_path_bytes]u8 = undefined;\010+    const executable_len = std.process.executablePath(io, &executable_buffer) catch return null;\010+    var real_buffer: [std.fs.max_path_bytes]u8 = undefined;\010+    const real_len = std.Io.Dir.cwd().realPathFile(io, executable_buffer[0..executable_len], &real_buffer) catch return null;\010+    const bin_dir = std.fs.path.dirname(real_buffer[0..real_len]) orelse return null;\010+    return try std.fs.path.resolve(allocator, &.{ bin_dir, \"..\", \"share\" });\010+}\010--- a/src/function_autoload.zig\010+++ b/src/function_autoload.zig\010@@ -4,6 +4,7 @@\010 const build_config = @import(\"build_config\");\010 \010 const host = @import(\"host.zig\");\010+const file_util = @import(\"file_util.zig\");\010 const shell = @import(\"shell.zig\");\010 \010 const max_function_source_bytes = 1024 * 1024;\010@@ -87,6 +88,10 @@\010     try appendUserDataDir(allocator, sh, &data_dirs);\010     try appendXdgDataDirs(allocator, sh, &data_dirs);\010     try appendPath(allocator, &data_dirs, &.{ build_config.datadir, \"rush\", \"functions\" });\010+    if (try file_util.executableDataDir(allocator)) |data_dir| {\010+        defer allocator.free(data_dir);\010+        try appendPath(allocator, &data_dirs, &.{ data_dir, \"rush\", \"functions\" });\010+    }\010 \010     var paths: std.ArrayList([]const u8) = .empty;\010     errdefer freePathList(allocator, &paths);\010--- a/src/completion.zig\010+++ b/src/completion.zig\010@@ -9,6 +9,7 @@\010 const extensions = @import(\"extensions.zig\");\010 const history = @import(\"history.zig\");\010 const host = @import(\"host.zig\");\010+const file_util = @import(\"file_util.zig\");\010 const shell = @import(\"shell.zig\");\010 \010 pub const Application = editor_completion.Application;\010@@ -1114,6 +1115,10 @@\010         if (try findCompletionFileUnder(allocator, sh, part, file_name)) |path| return path;\010     }\010     if (try findCompletionFileUnder(allocator, sh, build_config.datadir, file_name)) |path| return path;\010+    if (try file_util.executableDataDir(allocator)) |data_dir| {\010+        defer allocator.free(data_dir);\010+        if (try findCompletionFileUnder(allocator, sh, data_dir, file_name)) |path| return path;\010+    }\010     return null;\010 }\010 \010",
        },
    },
    build = {
        backend = "zig",
        args = {
            "-Doptimize=ReleaseSafe",
            "-Dregister-shell=false",
            "-Dsysconfdir=/etc",
            "-Ddatadir=/usr/share",
            "-Dversion=0.1.0-dev.20260909+g294212ebd35f5b755062186a66bcfd6436d3627a",
        },
        dependencies = { "zig@0.16.0" },
    },
    outputs = {
        bins = { "rush" },
        checks = {
            { "rush", "--version" },
            {
                "rush",
                "-ec",
                "[ \"$((2 + 3))\" = 5 ]; value=$(printf \"%s\" \"a b\"); [ \"$value\" = \"a b\" ]; path_prepend /usr/bin; [ \"${PATH%%:*}\" = /usr/bin ]",
            },
            {
                "rush",
                "-ec",
                "[ \"$(\"$0\" --version)\" = \"rush 0.1.0-dev.20260909+g294212ebd35f5b755062186a66bcfd6436d3627a\" ]",
            },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "0.1.0-dev.20260909+g294212ebd35f5b755062186a66bcfd6436d3627a",
        },
        ["aarch64-macos"] = {
            default_version = "0.1.0-dev.20260909+g294212ebd35f5b755062186a66bcfd6436d3627a",
        },
        ["x86_64-linux"] = {
            default_version = "0.1.0-dev.20260909+g294212ebd35f5b755062186a66bcfd6436d3627a",
        },
    },
    versions = {
        ["0.1.0-dev.20260909+g294212ebd35f5b755062186a66bcfd6436d3627a"] = {
            digests = {
                ["aarch64-linux"] = "b7eb240c58b7de30a80f1a2f27d1273effa1a1785d670ea6917995e5803422b6",
                ["aarch64-macos"] = "b7eb240c58b7de30a80f1a2f27d1273effa1a1785d670ea6917995e5803422b6",
                ["x86_64-linux"] = "b7eb240c58b7de30a80f1a2f27d1273effa1a1785d670ea6917995e5803422b6",
            },
            revision = 2,
        },
    },
}
