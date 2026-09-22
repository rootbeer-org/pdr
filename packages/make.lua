return {
    name = "make",
    description = "Build targets with GNU Make",
    homepage = "https://www.gnu.org/software/make/",
    default_license = "NOASSERTION",
    source = {
        url = "https://ftp.gnu.org/gnu/make/make-4.4.1.tar.gz",
        archive = "tar.gz",
        strip_prefix = "make-4.4.1",
        patches = {
            "--- a/tests/scripts/features/archives\n+++ b/tests/scripts/features/archives\n@@ -29,13 +29,24 @@\n \n # Fallback if configure did not find AR\n my $ar = get_config('AR') || 'ar';\n+if ($osname eq 'darwin') {\n+  # Keep the SDK lookup cache outside the test's temporary-file assertions.\n+  local $ENV{TMPDIR} = $origENV{TMPDIR} || '/tmp';\n+  $ar = `xcrun --find ar`;\n+  $? == 0 or die \"Cannot locate ar\";\n+  chomp $ar;\n+}\n \n my $redir = '2>&1';\n $redir = '' if $osname eq 'VMS';\n \n # This is the value from src/default.c\n my $arflags = $osname eq 'aix' ? '-Xany -rv' : '-rv';\n-my $arvar = \"AR=\\\"$ar\\\"\";\n+if ($osname eq 'darwin') {\n+  # Apple's ranlib drops the non-object members used by these tests.\n+  $arflags .= 'S';\n+}\n+my $arvar = \"AR=\\\"$ar\\\" ARFLAGS=\\\"$arflags\\\"\";\n \n # Newer versions of binutils can be built with --enable-deterministic-archives\n # which forces all timestamps (among other things) to always be 0, defeating\n@@ -255,6 +266,12 @@\n utouch(-20, 'a.c', 'b.c');\n \n my $cc = get_config('CC') || 'cc';\n+if ($osname eq 'darwin' && ($cc eq 'cc' || $cc eq '/usr/bin/cc')) {\n+  local $ENV{TMPDIR} = $origENV{TMPDIR} || '/tmp';\n+  $cc = `xcrun --find cc`;\n+  $? == 0 or die \"Cannot locate cc\";\n+  chomp $cc;\n+}\n my $vars = \"CC=\\\"$cc\\\" $arvar\";\n \n run_make_test(q!\n",
        },
    },
    build = { backend = "autotools", configure = { "--disable-nls", "--without-guile" } },
    outputs = {
        bins = { "make" },
        checks = {
            { "make", "--version" },
            {
                "make",
                "--no-builtin-rules",
                "--file=/dev/null",
                "--eval=all:;@test '$(MAKE_VERSION)' = 4.4.1",
                "all",
            },
            {
                "make",
                "--no-builtin-rules",
                "--file=/dev/null",
                '--eval=all:; +@set -eu; unset MAKEFLAGS MFLAGS; directory=$$(mktemp -d); trap \'rm -rf "$$directory"\' EXIT; cd "$$directory"; printf \'%s\\n\' \'all: first second\' \'first second &: input; @cp input first; cp input second\' \'input:; @printf "%s\\n" rootbeer-make-ok > input\' > Makefile; "$(MAKE)" --no-print-directory -j2; "$(MAKE)" --no-print-directory -q; test "$$(cat first)" = rootbeer-make-ok; test "$$(cat second)" = rootbeer-make-ok; printf \'%s\\n\' changed > input; "$(MAKE)" --no-print-directory -W input; test "$$(cat first)" = changed; test "$$(cat second)" = changed',
                "all",
            },
        },
    },
    platforms = {
        ["aarch64-linux"] = { default_version = "4.4.1" },
        ["aarch64-macos"] = { default_version = "4.4.1" },
        ["x86_64-linux"] = { default_version = "4.4.1" },
    },
    versions = {
        ["4.4.1"] = {
            digests = {
                ["aarch64-linux"] = "dd16fb1d67bfab79a72f5e8390735c49e3e8e70b4945a15ab1f81ddb78658fb3",
                ["aarch64-macos"] = "dd16fb1d67bfab79a72f5e8390735c49e3e8e70b4945a15ab1f81ddb78658fb3",
                ["x86_64-linux"] = "dd16fb1d67bfab79a72f5e8390735c49e3e8e70b4945a15ab1f81ddb78658fb3",
            },
        },
    },
}
