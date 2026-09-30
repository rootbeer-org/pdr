return {
    name = "bash",
    description = "GNU Bourne-Again shell",
    homepage = "https://www.gnu.org/software/bash/",
    recipe_maintainers = { "tale" },
    default_license = "GPL-3.0-or-later",
    upstream = {
        git = "https://https.git.savannah.gnu.org/git/bash.git",
        tag = "bash-{version}",
    },
    -- Upstream's numbered patches for 5.3 aren't applied yet.
    source = {
        url = "https://ftp.gnu.org/gnu/bash/bash-{version}.tar.gz",
        archive = "tar.gz",
        strip_prefix = "bash-{version}",
    },
    build = {
        backend = "custom",
        dependencies = {
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
                    "--disable-nls",
                    -- Readline's terminal handling links the catalog ncurses rather than whichever
                    -- termcap library the host offers first.
                    "bash_cv_termcap_lib=libncurses",
                },
            },
            build = {
                { "make", "-j{jobs}" },
            },
            check = {
                { "make", "check" },
            },
            install = {
                { "make", "DESTDIR={prefix}", "install" },
                -- The example loadable builtins carry bare install names that fail the runtime
                -- audit, and enable -f wouldn't find them in the store anyway.
                { "rm", "-rf", "{prefix}/lib/bash" },
            },
        },
    },
    outputs = {
        bins = { "bash" },
        checks = {
            { "bash", "--version" },
            {
                "bash",
                "-c",
                "declare -A m=([a]=1 [b]=2); s=0; for k in \"${!m[@]}\"; do (( s += m[$k] )); done; [[ $s == 3 && ${BASH_VERSINFO[0]} -ge 5 ]] && printf '%s\\n' ok",
            },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "5.3",
        },
        ["aarch64-macos"] = {
            default_version = "5.3",
        },
        ["x86_64-linux"] = {
            default_version = "5.3",
        },
    },
    versions = {
        ["5.3"] = {
            digests = {
                ["aarch64-linux"] = "0d5cd86965f869a26cf64f4b71be7b96f90a3ba8b3d74e27e8e9d9d5550f31ba",
                ["aarch64-macos"] = "0d5cd86965f869a26cf64f4b71be7b96f90a3ba8b3d74e27e8e9d9d5550f31ba",
                ["x86_64-linux"] = "0d5cd86965f869a26cf64f4b71be7b96f90a3ba8b3d74e27e8e9d9d5550f31ba",
            },
        },
    },
}
