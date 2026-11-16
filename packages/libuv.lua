return {
    name = "libuv",
    description = "Cross-platform asynchronous I/O library",
    homepage = "https://libuv.org",
    recipe_maintainers = { "tale" },
    default_license = "MIT",
    upstream = {
        github = "libuv/libuv",
        repository_id = 14812739,
        tag = "v{version}",
    },
    source = {
        url = "https://github.com/libuv/libuv/archive/refs/tags/{tag}.tar.gz",
        archive = "tar.gz",
        strip_prefix = "libuv-{version}",
    },
    build = {
        backend = "custom",
        -- The unit tests open loopback sockets and create their files in /tmp.
        allow = { "local-network", "tmp" },
        dependencies = {
            {
                package = "cmake",
                kind = "build",
            },
        },
        libraries = { "lib/libuv.a", "lib/libuv.{shared_extension}" },
        steps = {
            configure = {
                {
                    "cmake",
                    "-S",
                    ".",
                    "-B",
                    "build",
                    "-DCMAKE_BUILD_TYPE=Release",
                    -- One build produces the shared library and the static archive.
                    "-DLIBUV_BUILD_SHARED=ON",
                    "-DCMAKE_POSITION_INDEPENDENT_CODE=ON",
                    "-DBUILD_TESTING=ON",
                    "-DLIBUV_BUILD_TESTS=ON",
                    "-DLIBUV_BUILD_BENCH=OFF",
                    "-DCMAKE_INSTALL_PREFIX={prefix}",
                    "-DCMAKE_INSTALL_LIBDIR=lib",
                    "-DCMAKE_INSTALL_INCLUDEDIR=include",
                },
            },
            build = {
                { "cmake", "--build", "build", "--parallel", "{jobs}" },
            },
            check = {
                -- The runner takes one test name per run and has no exclude option, so this runs
                -- every name in test-list.h except the ones the build sandbox breaks. Exit status
                -- 7 is the runner's skip. Every test runs before failing so one build reports all
                -- failures.
                {
                    "sh",
                    "-ec",
                    [[
# tty tests need a terminal, emfile hits the descriptor limit, the fs_event watches never fire,
# the bind tests get a different errno from the socket rules, link-local and multicast
# addresses are not loopback, and setuid and setgid return EINVAL on Linux.
skip='tty.*|emfile|fs_event_close_in_callback|fs_event_watch_delete_dir|fs_event_watch_dir|fs_event_watch_dir_recursive'
skip="$skip|tcp_bind6_error_addrnotavail|tcp_bind_error_addrnotavail_1|tcp_bind_error_addrnotavail_2"
skip="$skip|tcp_create_early_bad_bind|udp_create_early_bad_bind|tcp_connect6_link_local|udp_multicast_.*"
skip="$skip|spawn_setuid_fails|spawn_setgid_fails"

names=$(cc -E -P -Iinclude -x c test/test-list.h | sed -n 's/^ *TEST_ENTRY *(\(.*\))$/\1/p' | grep -vxE "$skip")
failed=
for name in $names; do
    ./build/uv_run_tests "$name" || [ $? -eq 7 ] || failed="$failed $name"
done
if [ -n "$failed" ]; then
    echo "failed:$failed"
    exit 1
fi
]],
                },
            },
            install = {
                { "cmake", "--install", "build" },
            },
        },
    },
    outputs = {},
    platforms = {
        ["aarch64-linux"] = {
            default_version = "1.53.0",
        },
        ["aarch64-macos"] = {
            default_version = "1.53.0",
        },
        ["x86_64-linux"] = {
            default_version = "1.53.0",
        },
    },
    versions = {
        ["1.53.0"] = {
            digests = {
                ["aarch64-linux"] = "279f3f67a24bb9921fe999ca6cd5e332fade8d515873ef9ba054b70e70a31d9e",
                ["aarch64-macos"] = "279f3f67a24bb9921fe999ca6cd5e332fade8d515873ef9ba054b70e70a31d9e",
                ["x86_64-linux"] = "279f3f67a24bb9921fe999ca6cd5e332fade8d515873ef9ba054b70e70a31d9e",
            },
        },
    },
}
