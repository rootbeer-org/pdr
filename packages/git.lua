return {
    name = "git",
    description = "Distributed version control system",
    homepage = "https://git-scm.com/",
    default_license = "NOASSERTION",
    source = {
        url = "https://www.kernel.org/pub/software/scm/git/git-{version}.tar.xz",
        archive = "tar.xz",
        strip_prefix = "git-{version}",
        patches = {
            '--- a/exec-cmd.c\n+++ b/exec-cmd.c\n@@ -143,7 +143,8 @@\n \t\ttrace_printf(\n \t\t\t"trace: resolved executable path from Darwin stack: %s\\n",\n \t\t\tpath);\n-\t\tstrbuf_addstr(buf, path);\n+\t\tif (!strbuf_realpath(buf, path, 0))\n+\t\t\treturn -1;\n \t\treturn 0;\n \t}\n \treturn -1;\n',
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
                    'printf \'%s\' "$1" > config.mak; printf "CURL_LDFLAGS = %s\\nCURL_CFLAGS = %s\\n" "$(pkg-config --static --libs libcurl)" "$(pkg-config --cflags libcurl)" >> config.mak',
                    "rootbeer-git",
                    "prefix = /\nRUNTIME_PREFIX = YesPlease\nINSTALL_SYMLINKS = YesPlease\nNO_GETTEXT = YesPlease\nNEEDS_LIBICONV = YesPlease\nNO_RUST = YesPlease\nNO_TCLTK = YesPlease\nPERL_PATH = /usr/bin/perl\nPYTHON_PATH = /usr/bin/python3\nUSE_LIBPCRE =\n",
                },
            },
            build = { { "make", "-j{jobs}" } },
            check = {
                {
                    "make",
                    "-j{jobs}",
                    "test",
                    "NO_SVN_TESTS=YesPlease",
                    "T=t0000-basic.sh t0001-init.sh t1300-config.sh t1500-rev-parse.sh t5500-fetch-pack.sh t5601-clone.sh t5700-protocol-v1.sh",
                },
            },
            install = { { "make", "DESTDIR={prefix}", "install" } },
        },
    },
    outputs = {
        bins = { "git", "git-receive-pack", "git-upload-pack", "git-upload-archive" },
        checks = {
            { "git", "--version" },
            {
                "git",
                "-c",
                'alias.rootbeer-check=!set -eu; directory=$(mktemp -d); trap \'rm -rf "$directory"\' EXIT; git init -q "$directory/repository"; git -C "$directory/repository" -c user.name=Rootbeer -c user.email=rootbeer@example.invalid commit -qm initial --allow-empty; git clone -q "$directory/repository" "$directory/clone"; git -C "$directory/clone" fsck --strict; test -x "$(git --exec-path)/git-remote-https"',
                "rootbeer-check",
            },
        },
    },
    platforms = {
        ["aarch64-linux"] = { default_version = "2.55.0" },
        ["aarch64-macos"] = { default_version = "2.55.0" },
        ["x86_64-linux"] = { default_version = "2.55.0" },
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
