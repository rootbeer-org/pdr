return {
    name = "telnet",
    description = "Connect to remote hosts using the Telnet protocol",
    homepage = "https://www.gnu.org/software/inetutils/",
    recipe_maintainers = { "tale" },
    default_license = "GPL-3.0-or-later",
    source = {
        url = "https://ftp.gnu.org/gnu/inetutils/inetutils-{version}.tar.gz",
        archive = "tar.gz",
        strip_prefix = "inetutils-{version}",
    },
    build = {
        backend = "autotools",
        configure = {
            "--disable-servers",
            "--disable-clients",
            "--enable-telnet",
            "--disable-nls",
            "--disable-rpath",
            "--without-idn",
            "--without-libreadline-prefix",
            "--with-ncurses-include-dir={dependencies}/include",
        },
        dependencies = { "ncurses@6.6" },
    },
    outputs = {
        bins = { "telnet" },
        checks = {
            { "telnet", "--version" },
            { "telnet", "--help" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "2.8",
        },
        ["aarch64-macos"] = {
            default_version = "2.8",
        },
        ["x86_64-linux"] = {
            default_version = "2.8",
        },
    },
    versions = {
        ["2.8"] = {
            digests = {
                ["aarch64-linux"] = "57b3cf4f77555992881e5ba2a09a63b05aa2c56342a60ed4305b5f45938390b5",
                ["aarch64-macos"] = "57b3cf4f77555992881e5ba2a09a63b05aa2c56342a60ed4305b5f45938390b5",
                ["x86_64-linux"] = "57b3cf4f77555992881e5ba2a09a63b05aa2c56342a60ed4305b5f45938390b5",
            },
        },
    },
}
