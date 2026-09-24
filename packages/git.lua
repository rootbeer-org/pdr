return {
    name = "git",
    description = "Distributed version control system",
    homepage = "https://git-scm.com/",
    recipe_maintainers = { "tale" },
    default_license = "GPL-2.0-only",
    upstream = {
        github = "git/git",
        repository_id = 36502,
        tag = "v{version}",
    },
    source = {
        url = "https://www.kernel.org/pub/software/scm/git/git-{version}.tar.xz",
        archive = "tar.xz",
        strip_prefix = "git-{version}",
        patches = {
            "--- a/exec-cmd.c\010+++ b/exec-cmd.c\010@@ -143,7 +143,8 @@\010 \009\009trace_printf(\010 \009\009\009\"trace: resolved executable path from Darwin stack: %s\\n\",\010 \009\009\009path);\010-\009\009strbuf_addstr(buf, path);\010+\009\009if (!strbuf_realpath(buf, path, 0))\010+\009\009\009return -1;\010 \009\009return 0;\010 \009}\010 \009return -1;\010",
        },
    },
    build = {
        backend = "custom",
        dependencies = {
            "curl@8.22.0",
            "expat@2.8.4",
            "openssl@4.0.2",
            "zlib@1.3.2",
            "libiconv@1.19",
            "pkgconf@3.0.7",
        },
        steps = {
            configure = {
                {
                    "/bin/sh",
                    "-ec",
                    "printf '%s' \"$1\" > config.mak; printf \"CURL_LDFLAGS = %s\\nCURL_CFLAGS = %s\\n\" \"$(pkg-config --static --libs libcurl)\" \"$(pkg-config --cflags libcurl)\" >> config.mak",
                    "rootbeer-git",
                    "prefix = /\010RUNTIME_PREFIX = YesPlease\010INSTALL_SYMLINKS = YesPlease\010NO_GETTEXT = YesPlease\010NEEDS_LIBICONV = YesPlease\010NO_RUST = YesPlease\010NO_TCLTK = YesPlease\010PERL_PATH = /usr/bin/perl\010PYTHON_PATH = /usr/bin/python3\010USE_LIBPCRE =\010",
                },
            },
            build = {
                { "make", "-j{jobs}" },
            },
            check = {
                {
                    "make",
                    "-j{jobs}",
                    "test",
                    "NO_SVN_TESTS=YesPlease",
                    "T=t0000-basic.sh t0001-init.sh t1300-config.sh t1500-rev-parse.sh t5500-fetch-pack.sh t5601-clone.sh t5700-protocol-v1.sh",
                },
            },
            install = {
                { "make", "DESTDIR={prefix}", "install" },
            },
        },
    },
    outputs = {
        bins = { "git", "git-receive-pack", "git-upload-pack", "git-upload-archive" },
        checks = {
            { "git", "--version" },
            {
                "git",
                "-c",
                "alias.rootbeer-check=!set -eu; directory=$(mktemp -d); trap 'rm -rf \"$directory\"' EXIT; git init -q \"$directory/repository\"; git -C \"$directory/repository\" -c user.name=Rootbeer -c user.email=rootbeer@example.invalid commit -qm initial --allow-empty; git clone -q \"$directory/repository\" \"$directory/clone\"; git -C \"$directory/clone\" fsck --strict; test -x \"$(git --exec-path)/git-remote-https\"",
                "rootbeer-check",
            },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "2.55.0",
        },
        ["aarch64-macos"] = {
            default_version = "2.55.0",
        },
        ["x86_64-linux"] = {
            default_version = "2.55.0",
        },
    },
    versions = {
        ["2.55.0"] = {
            digests = {
                ["aarch64-linux"] = "457fdb04dc8728e007d4688695e6912e6f680727920f2a40bf11eacc17505357",
                ["aarch64-macos"] = "457fdb04dc8728e007d4688695e6912e6f680727920f2a40bf11eacc17505357",
                ["x86_64-linux"] = "457fdb04dc8728e007d4688695e6912e6f680727920f2a40bf11eacc17505357",
            },
            revision = 4,
        },
    },
}
