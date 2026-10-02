-- Helpers are found on PATH rather than by compiled-in paths, since the store
-- location is unknown at build time: ssh-sk-helper, ssh-pkcs11-helper, and
-- sftp-server are exported commands. sshd execs sshd-session and sshd-auth by absolute
-- path, so its configuration must set SshdSessionPath and SshdAuthPath until rb
-- manages services.
return {
    name = "openssh",
    description = "OpenBSD Secure Shell client, server, and key tools",
    homepage = "https://www.openssh.com/",
    recipe_maintainers = { "tale" },
    default_license = "SSH-OpenSSH",
    source = {
        url = "https://cdn.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-{version}.tar.gz",
        archive = "tar.gz",
        strip_prefix = "openssh-{version}",
    },
    build = {
        backend = "custom",
        dependencies = {
            {
                package = "pkgconf",
                version = "3.0.7",
                kind = "build",
            },
            {
                package = "openssl",
                version = "4.0.2",
                kind = "link_runtime",
            },
            {
                package = "zlib",
                version = "1.3.2",
                kind = "link_runtime",
            },
            {
                package = "libfido2",
                version = "1.17.0",
                kind = "link_runtime",
            },
            {
                package = "ldns",
                version = "1.9.2",
                kind = "link_runtime",
            },
            {
                package = "libedit",
                version = "20260512-3.1",
                kind = "link",
            },
            {
                package = "ncurses",
                version = "6.6",
                kind = "link",
            },
            {
                package = "krb5",
                version = "1.22.2",
                kind = "link_runtime",
            },
            {
                package = "libxcrypt",
                version = "4.5.2",
                kind = "link",
            },
        },
        steps = {
            configure = {
                {
                    "sh",
                    "./configure",
                    "--prefix=/",
                    "--sysconfdir=/etc/ssh",
                    "--with-mantype=doc",
                    "--with-ssl-dir={dependencies.openssl}",
                    "--with-zlib={dependencies.zlib}",
                    "--with-security-key-builtin",
                    "--with-ldns={dependencies.ldns}",
                    "--with-libedit",
                    "LIBS=-lncurses",
                    "--with-kerberos5={dependencies.krb5}",
                    -- Linux builds without PAM until rb owns more of the login stack; sshd checks
                    -- /etc/shadow through the bundled libxcrypt. Without PAM it skips session
                    -- setup, limits, and 2FA or directory modules, so it is not yet a replacement
                    -- for the system sshd; link the host's libpam once rb runs sshd as a service.
                    "--with-privsep-path=/run/sshd",
                },
            },
            build = {
                {
                    "make",
                    "-j{jobs}",
                    -- Static libedit needs ncurses after it on the link line, and the helper names
                    -- make them PATH lookups; these apply to the build, not to install destinations.
                    "LIBEDIT=-ledit -lncurses",
                    "SSH_PROGRAM=ssh",
                    "SSH_SK_HELPER=ssh-sk-helper",
                    "SSH_PKCS11_HELPER=ssh-pkcs11-helper",
                    "ASKPASS_PROGRAM=ssh-askpass",
                },
            },
            check = {
                { "make", "-j{jobs}", "unit" },
                {
                    "make",
                    "t-exec",
                    -- The agent test binds a socket under the build directory, which must stay within
                    -- the 104-byte macOS limit.
                    "LTESTS=connect connect-privsep keytype cert-userkey sftp scp agent",
                },
                {
                    "/bin/sh",
                    "-ec",
                    "make DESTDIR=\"$PWD/stage\" \"$@\" install-nokeys\010root=\"$PWD/stage\"\010work=$(mktemp -d)\010trap 'kill \"$pid\" 2>/dev/null || true; rm -rf \"$work\"' EXIT\010unset SSH_SK_HELPER SSH_PKCS11_HELPER SSH_ASKPASS\010PATH=\"$root/bin:$root/sbin:$root/libexec:$PATH\"\010\010ssh -V\010if ssh-keygen -q -t ed25519-sk -N '' -f \"$work/sk\" >\"$work/sk.log\" 2>&1; then\010    echo \"security key enrollment unexpectedly succeeded\" >&2\010    exit 1\010fi\010cat \"$work/sk.log\"\010grep -q 'device not found' \"$work/sk.log\"\010\010ssh-keygen -q -t ed25519 -N '' -f \"$work/host\"\010ssh-keygen -q -t ed25519 -N '' -f \"$work/user\"\010cp \"$work/user.pub\" \"$work/authorized_keys\"\010port=$((20000 + $$ % 20000))\010cat >\"$work/sshd_config\" <<CONFIG\010Port $port\010ListenAddress 127.0.0.1\010HostKey $work/host\010AuthorizedKeysFile $work/authorized_keys\010PidFile $work/sshd.pid\010StrictModes no\010SshdSessionPath $root/libexec/sshd-session\010SshdAuthPath $root/libexec/sshd-auth\010Subsystem sftp $root/libexec/sftp-server\010CONFIG\010sshd -t -f \"$work/sshd_config\"\010\"$root/sbin/sshd\" -D -e -f \"$work/sshd_config\" 2>\"$work/sshd.log\" &\010pid=$!\010for i in 1 2 3 4 5 6 7 8 9 10; do\010    ssh-keyscan -p \"$port\" 127.0.0.1 >\"$work/keyscan\" 2>/dev/null && break\010    sleep 1\010done\010grep -q ssh-ed25519 \"$work/keyscan\" || { cat \"$work/sshd.log\"; exit 1; }\010set -- -F /dev/null -i \"$work/user\" -o BatchMode=yes -o StrictHostKeyChecking=no -o UserKnownHostsFile=\"$work/known_hosts\"\010ssh \"$@\" -p \"$port\" 127.0.0.1 echo ok | grep -qx ok || { cat \"$work/sshd.log\"; exit 1; }\010echo put \"$work/user.pub\" \"$work/copied\" | sftp -b - \"$@\" -P \"$port\" 127.0.0.1\010cmp \"$work/user.pub\" \"$work/copied\"\010scp \"$@\" -P \"$port\" \"$work/user.pub\" \"127.0.0.1:$work/scp-copied\"\010cmp \"$work/user.pub\" \"$work/scp-copied\"\010",
                },
            },
            install = {
                { "make", "DESTDIR={prefix}", "install-nokeys" },
                -- ssh-keysign needs setuid and a compiled-in path, which a user store cannot give it.
                { "rm", "{prefix}/libexec/ssh-keysign", "{prefix}/share/man/man8/ssh-keysign.8" },
            },
        },
    },
    outputs = {
        bins = {
            scp = "bin/scp",
            sftp = "bin/sftp",
            ["sftp-server"] = "libexec/sftp-server",
            ssh = "bin/ssh",
            ["ssh-add"] = "bin/ssh-add",
            ["ssh-agent"] = "bin/ssh-agent",
            ["ssh-keygen"] = "bin/ssh-keygen",
            ["ssh-keyscan"] = "bin/ssh-keyscan",
            ["ssh-pkcs11-helper"] = "libexec/ssh-pkcs11-helper",
            ["ssh-sk-helper"] = "libexec/ssh-sk-helper",
            sshd = "sbin/sshd",
        },
        checks = {
            { "ssh", "-V" },
            { "ssh", "-G", "-F", "/dev/null", "example.com" },
            { "ssh-keygen", "-q", "-t", "ed25519", "-N", "", "-f", "rootbeer-check-key" },
            { "sshd", "-V" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "10.5p1",
        },
        ["aarch64-macos"] = {
            default_version = "10.5p1",
            build = {
                backend = "custom",
                dependencies = {
                    {
                        package = "pkgconf",
                        version = "3.0.7",
                        kind = "build",
                    },
                    {
                        package = "openssl",
                        version = "4.0.2",
                        kind = "link_runtime",
                    },
                    {
                        package = "zlib",
                        version = "1.3.2",
                        kind = "link_runtime",
                    },
                    {
                        package = "libfido2",
                        version = "1.17.0",
                        kind = "link_runtime",
                    },
                    {
                        package = "ldns",
                        version = "1.9.2",
                        kind = "link_runtime",
                    },
                    {
                        package = "libedit",
                        version = "20260512-3.1",
                        kind = "link",
                    },
                    {
                        package = "ncurses",
                        version = "6.6",
                        kind = "link",
                    },
                },
                steps = {
                    configure = {
                        {
                            "sh",
                            "./configure",
                            "--prefix=/",
                            "--sysconfdir=/etc/ssh",
                            "--with-mantype=doc",
                            "--with-ssl-dir={dependencies.openssl}",
                            "--with-zlib={dependencies.zlib}",
                            "--with-security-key-builtin",
                            "--with-ldns={dependencies.ldns}",
                            "--with-libedit",
                            "LIBS=-lncurses",
                            "--with-pam",
                            "--with-kerberos5=/usr",
                            -- The Darwin sandbox's kSBXProfilePureComputation SIGKILLs processes on macOS 27;
                            -- upstream d4b4c304 disables it there too.
                            "--with-sandbox=no",
                        },
                    },
                    build = {
                        {
                            "make",
                            "-j{jobs}",
                            -- Static libedit needs ncurses after it on the link line, and the helper names
                            -- make them PATH lookups; these apply to the build, not to install destinations.
                            "LIBEDIT=-ledit -lncurses",
                            "SSH_PROGRAM=ssh",
                            "SSH_SK_HELPER=ssh-sk-helper",
                            "SSH_PKCS11_HELPER=ssh-pkcs11-helper",
                            "ASKPASS_PROGRAM=ssh-askpass",
                        },
                    },
                    check = {
                        { "make", "-j{jobs}", "unit" },
                        {
                            "make",
                            "t-exec",
                            -- The agent test binds a socket under the build directory, which must stay within
                            -- the 104-byte macOS limit.
                            "LTESTS=connect connect-privsep keytype cert-userkey sftp scp agent",
                        },
                        {
                            "/bin/sh",
                            "-ec",
                            "make DESTDIR=\"$PWD/stage\" \"$@\" install-nokeys\010root=\"$PWD/stage\"\010work=$(mktemp -d)\010trap 'kill \"$pid\" 2>/dev/null || true; rm -rf \"$work\"' EXIT\010unset SSH_SK_HELPER SSH_PKCS11_HELPER SSH_ASKPASS\010PATH=\"$root/bin:$root/sbin:$root/libexec:$PATH\"\010\010ssh -V\010if ssh-keygen -q -t ed25519-sk -N '' -f \"$work/sk\" >\"$work/sk.log\" 2>&1; then\010    echo \"security key enrollment unexpectedly succeeded\" >&2\010    exit 1\010fi\010cat \"$work/sk.log\"\010grep -q 'device not found' \"$work/sk.log\"\010\010ssh-keygen -q -t ed25519 -N '' -f \"$work/host\"\010ssh-keygen -q -t ed25519 -N '' -f \"$work/user\"\010cp \"$work/user.pub\" \"$work/authorized_keys\"\010port=$((20000 + $$ % 20000))\010cat >\"$work/sshd_config\" <<CONFIG\010Port $port\010ListenAddress 127.0.0.1\010HostKey $work/host\010AuthorizedKeysFile $work/authorized_keys\010PidFile $work/sshd.pid\010StrictModes no\010SshdSessionPath $root/libexec/sshd-session\010SshdAuthPath $root/libexec/sshd-auth\010Subsystem sftp $root/libexec/sftp-server\010CONFIG\010sshd -t -f \"$work/sshd_config\"\010\"$root/sbin/sshd\" -D -e -f \"$work/sshd_config\" 2>\"$work/sshd.log\" &\010pid=$!\010for i in 1 2 3 4 5 6 7 8 9 10; do\010    ssh-keyscan -p \"$port\" 127.0.0.1 >\"$work/keyscan\" 2>/dev/null && break\010    sleep 1\010done\010grep -q ssh-ed25519 \"$work/keyscan\" || { cat \"$work/sshd.log\"; exit 1; }\010set -- -F /dev/null -i \"$work/user\" -o BatchMode=yes -o StrictHostKeyChecking=no -o UserKnownHostsFile=\"$work/known_hosts\"\010ssh \"$@\" -p \"$port\" 127.0.0.1 echo ok | grep -qx ok || { cat \"$work/sshd.log\"; exit 1; }\010echo put \"$work/user.pub\" \"$work/copied\" | sftp -b - \"$@\" -P \"$port\" 127.0.0.1\010cmp \"$work/user.pub\" \"$work/copied\"\010scp \"$@\" -P \"$port\" \"$work/user.pub\" \"127.0.0.1:$work/scp-copied\"\010cmp \"$work/user.pub\" \"$work/scp-copied\"\010",
                        },
                    },
                    install = {
                        { "make", "DESTDIR={prefix}", "install-nokeys" },
                        {
                            "rm",
                            -- ssh-keysign needs setuid and a compiled-in path, which a user store cannot give it.
                            "{prefix}/libexec/ssh-keysign",
                            "{prefix}/share/man/man8/ssh-keysign.8",
                        },
                    },
                },
            },
        },
        ["x86_64-linux"] = {
            default_version = "10.5p1",
        },
    },
    versions = {
        ["10.5p1"] = {
            digests = {
                ["aarch64-linux"] = "d44d28a839ea9daf969cc69150fde59910b2b39361dad81a3bd6cbd19218db11",
                ["aarch64-macos"] = "d44d28a839ea9daf969cc69150fde59910b2b39361dad81a3bd6cbd19218db11",
                ["x86_64-linux"] = "d44d28a839ea9daf969cc69150fde59910b2b39361dad81a3bd6cbd19218db11",
            },
        },
    },
}
