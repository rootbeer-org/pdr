return {
    name = "gengetopt",
    description = "Generate C command line option parsers",
    homepage = "https://www.gnu.org/software/gengetopt/",
    recipe_maintainers = { "tale" },
    default_license = "GPL-3.0-or-later",
    upstream = {
        git = "https://https.git.savannah.gnu.org/git/gengetopt.git",
        tag = "rel_{version}",
        separator = "_",
    },
    source = {
        url = "https://ftp.gnu.org/gnu/gengetopt/gengetopt-{version}.tar.xz",
        archive = "tar.xz",
        strip_prefix = "gengetopt-{version}",
    },
    -- Skips doc/, which needs makeinfo (texinfo) to render the manual.
    build = {
        backend = "custom",
        steps = {
            configure = {
                { "sh", "./configure", "--prefix={prefix}" },
            },
            build = {
                { "make", "-C", "gl", "-j{jobs}" },
                { "make", "-C", "src", "-j{jobs}" },
            },
            check = {
                { "make", "-C", "tests", "check" },
            },
            install = {
                { "make", "-C", "src", "install" },
            },
        },
    },
    outputs = {
        bins = { "gengetopt" },
        checks = {
            { "gengetopt", "--version" },
            {
                "gengetopt",
                "--show-required",
                "--input=/dev/null",
                "--output-dir=.",
                "--file-name=rootbeer-check",
            },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "2.23.1",
        },
        ["aarch64-macos"] = {
            default_version = "2.23.1",
        },
        ["x86_64-linux"] = {
            default_version = "2.23.1",
        },
    },
    versions = {
        ["2.23.1"] = {
            digests = {
                ["aarch64-linux"] = "3b9def48422bd45f78af95936200b7f9287369a3db76c4907c42fe10f4922ab6",
                ["aarch64-macos"] = "3b9def48422bd45f78af95936200b7f9287369a3db76c4907c42fe10f4922ab6",
                ["x86_64-linux"] = "3b9def48422bd45f78af95936200b7f9287369a3db76c4907c42fe10f4922ab6",
            },
        },
    },
}
