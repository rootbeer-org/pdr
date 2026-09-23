return {
    name = "libpsl",
    description = "Public suffix list library and tools",
    homepage = "https://github.com/rockdaboot/libpsl",
    default_license = "NOASSERTION",
    source = {
        url = "https://github.com/rockdaboot/libpsl/releases/download/{version}/libpsl-{version}.tar.gz",
        archive = "tar.gz",
        strip_prefix = "libpsl-{version}",
        patches = {
            "--- a/configure\010+++ b/configure\010@@ -17475,7 +17475,7 @@\010   e)\010     acl_saved_LIBS=\"$LIBS\"\010                                 case \" $LIBUNISTRING\" in\010-      *\" -l\"*) LIBS=\"$LIBS $LIBUNISTRING\" ;;\010+      *\" -l\"*) LIBS=\"$LIBUNISTRING $LIBS\" ;;\010       *)       LIBS=\"$LIBUNISTRING $LIBS\" ;;\010     esac\010     cat confdefs.h - <<_ACEOF >conftest.$ac_ext\010@@ -18063,7 +18063,7 @@\010   e)\010     acl_saved_LIBS=\"$LIBS\"\010                                 case \" $LIBUNISTRING\" in\010-      *\" -l\"*) LIBS=\"$LIBS $LIBUNISTRING\" ;;\010+      *\" -l\"*) LIBS=\"$LIBUNISTRING $LIBS\" ;;\010       *)       LIBS=\"$LIBUNISTRING $LIBS\" ;;\010     esac\010     cat confdefs.h - <<_ACEOF >conftest.$ac_ext\010@@ -18654,7 +18654,7 @@\010   e)\010     acl_saved_LIBS=\"$LIBS\"\010                                 case \" $LIBUNISTRING\" in\010-      *\" -l\"*) LIBS=\"$LIBS $LIBUNISTRING\" ;;\010+      *\" -l\"*) LIBS=\"$LIBUNISTRING $LIBS\" ;;\010       *)       LIBS=\"$LIBUNISTRING $LIBS\" ;;\010     esac\010     cat confdefs.h - <<_ACEOF >conftest.$ac_ext\010",
        },
    },
    build = {
        backend = "autotools",
        configure = {
            "--disable-shared",
            "--enable-static",
            "--disable-nls",
            "--disable-rpath",
            "--without-libiconv-prefix",
            "--enable-runtime=libidn2",
            "--enable-builtin",
            "--without-libunistring-prefix",
        },
        dependencies = { "libiconv@1.19", "libidn2@2.3.8", "libunistring@1.4.2", "pkgconf@3.0.7" },
        libraries = { "lib/libpsl.a" },
    },
    outputs = {
        bins = { "psl" },
        checks = {
            { "psl", "--version" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "0.23.3",
        },
        ["aarch64-macos"] = {
            default_version = "0.23.3",
        },
        ["x86_64-linux"] = {
            default_version = "0.23.3",
        },
    },
    versions = {
        ["0.23.3"] = {
            digests = {
                ["aarch64-linux"] = "93941f85a1e7bd593fa94f299233cb5dfc91cd144fd9a78a6ceb75001c5b03be",
                ["aarch64-macos"] = "93941f85a1e7bd593fa94f299233cb5dfc91cd144fd9a78a6ceb75001c5b03be",
                ["x86_64-linux"] = "93941f85a1e7bd593fa94f299233cb5dfc91cd144fd9a78a6ceb75001c5b03be",
            },
        },
    },
}
