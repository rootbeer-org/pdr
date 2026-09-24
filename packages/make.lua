return {
    name = "make",
    description = "Build targets from makefiles",
    homepage = "https://www.gnu.org/software/make/",
    recipe_maintainers = { "tale" },
    default_license = "GPL-3.0-or-later",
    source = {
        url = "https://ftp.gnu.org/gnu/make/make-{version}.tar.gz",
        archive = "tar.gz",
        strip_prefix = "make-{version}",
        patches = {
            "--- a/tests/scripts/features/archives\010+++ b/tests/scripts/features/archives\010@@ -29,13 +29,24 @@\010 \010 # Fallback if configure did not find AR\010 my $ar = get_config('AR') || 'ar';\010+if ($osname eq 'darwin') {\010+  # Keep the SDK lookup cache outside the test's temporary-file assertions.\010+  local $ENV{TMPDIR} = $origENV{TMPDIR} || '/tmp';\010+  $ar = `xcrun --find ar`;\010+  $? == 0 or die \"Cannot locate ar\";\010+  chomp $ar;\010+}\010 \010 my $redir = '2>&1';\010 $redir = '' if $osname eq 'VMS';\010 \010 # This is the value from src/default.c\010 my $arflags = $osname eq 'aix' ? '-Xany -rv' : '-rv';\010-my $arvar = \"AR=\\\"$ar\\\"\";\010+if ($osname eq 'darwin') {\010+  # Apple's ranlib drops the non-object members used by these tests.\010+  $arflags .= 'S';\010+}\010+my $arvar = \"AR=\\\"$ar\\\" ARFLAGS=\\\"$arflags\\\"\";\010 \010 # Newer versions of binutils can be built with --enable-deterministic-archives\010 # which forces all timestamps (among other things) to always be 0, defeating\010@@ -255,6 +266,12 @@\010 utouch(-20, 'a.c', 'b.c');\010 \010 my $cc = get_config('CC') || 'cc';\010+if ($osname eq 'darwin' && ($cc eq 'cc' || $cc eq '/usr/bin/cc')) {\010+  local $ENV{TMPDIR} = $origENV{TMPDIR} || '/tmp';\010+  $cc = `xcrun --find cc`;\010+  $? == 0 or die \"Cannot locate cc\";\010+  chomp $cc;\010+}\010 my $vars = \"CC=\\\"$cc\\\" $arvar\";\010 \010 run_make_test(q!\010",
        },
    },
    build = {
        backend = "autotools",
        configure = { "--disable-nls", "--without-guile" },
    },
    outputs = {
        bins = { "make" },
        checks = {
            { "make", "--version" },
            {
                "make",
                "--no-builtin-rules",
                "--file=/dev/null",
                "--eval=all:;@test '$(MAKE_VERSION)' = {version}",
                "all",
            },
            {
                "make",
                "--no-builtin-rules",
                "--file=/dev/null",
                "--eval=all:; +@set -eu; unset MAKEFLAGS MFLAGS; directory=$$(mktemp -d); trap 'rm -rf \"$$directory\"' EXIT; cd \"$$directory\"; printf '%s\\n' 'all: first second' 'first second &: input; @cp input first; cp input second' 'input:; @printf \"%s\\n\" rootbeer-make-ok > input' > Makefile; \"$(MAKE)\" --no-print-directory -j2; \"$(MAKE)\" --no-print-directory -q; test \"$$(cat first)\" = rootbeer-make-ok; test \"$$(cat second)\" = rootbeer-make-ok; printf '%s\\n' changed > input; \"$(MAKE)\" --no-print-directory -W input; test \"$$(cat first)\" = changed; test \"$$(cat second)\" = changed",
                "all",
            },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "4.4.1",
        },
        ["aarch64-macos"] = {
            default_version = "4.4.1",
        },
        ["x86_64-linux"] = {
            default_version = "4.4.1",
        },
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
