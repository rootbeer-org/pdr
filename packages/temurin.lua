-- AWT and Sound load these desktop libraries when a program uses them.
local linuxHost = {
    "libasound.so.2",
    "libX11.so.6",
    "libXext.so.6",
    "libXi.so.6",
    "libXrender.so.1",
    "libXtst.so.6",
}

return {
    name = "temurin",
    description = "Eclipse Temurin OpenJDK distribution from Adoptium",
    homepage = "https://adoptium.net",
    recipe_maintainers = { "tale" },
    default_license = "GPL-2.0-only WITH Classpath-exception-2.0",
    upstream = {
        github = "adoptium/temurin25-binaries",
        repository_id = 901810329,
        tag = "jdk-{version}",
    },
    -- Assets spell the tag's `+` as `_`, which no placeholder can do, so the
    -- download goes through the Adoptium API, which redirects to that asset.
    prebuilt = {
        url = "https://api.adoptium.net/v3/binary/version/jdk-{version}/{target}/jdk/hotspot/normal/eclipse",
        install = {
            Archive = {
                format = "TarGz",
                strip_prefix = "jdk-{version}",
            },
        },
        -- Same libjvm fix as macOS, for libraries that name libjvm.so.
        steps = {
            install = {
                { "ln", "-s", "server/libjvm.so", "lib/libjvm.so" },
            },
        },
    },
    outputs = {
        bins = {
            "jar",
            "jarsigner",
            "java",
            "javac",
            "javadoc",
            "javap",
            "jcmd",
            "jconsole",
            "jdb",
            "jdeprscan",
            "jdeps",
            "jfr",
            "jhsdb",
            "jimage",
            "jinfo",
            "jlink",
            "jmap",
            "jmod",
            "jnativescan",
            "jpackage",
            "jps",
            "jrunscript",
            "jshell",
            "jstack",
            "jstat",
            "jstatd",
            "jwebserver",
            "keytool",
            "rmiregistry",
            "serialver",
        },
        checks = {
            { "java", "-version" },
            {
                "sh",
                "-c",
                [[set -e
d=$(mktemp -d)
cd "$d"
cat > Hello.java <<'EOF'
public class Hello {
    public static void main(String[] args) {
        System.out.println("hello from temurin");
    }
}
EOF
javac Hello.java
java -cp . Hello | grep -q "hello from temurin"]],
            },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            target = "linux/aarch64",
            default_version = "25.0.5+8",
            outputs = { host = linuxHost },
        },
        ["aarch64-macos"] = {
            target = "mac/aarch64",
            default_version = "25.0.5+8",
            -- The macOS JDK lives in a bundle.
            prebuilt = {
                url = "https://api.adoptium.net/v3/binary/version/jdk-{version}/{target}/jdk/hotspot/normal/eclipse",
                install = {
                    Archive = {
                        format = "TarGz",
                        strip_prefix = "jdk-{version}/Contents/Home",
                    },
                },
                -- The JDK's libraries name libjvm by @rpath, which only resolves
                -- from lib/, where the JVM is not.
                steps = {
                    install = {
                        { "ln", "-s", "server/libjvm.dylib", "lib/libjvm.dylib" },
                    },
                },
            },
        },
        ["x86_64-linux"] = {
            target = "linux/x64",
            default_version = "25.0.5+8",
            outputs = { host = linuxHost },
        },
    },
    versions = {
        ["25.0.5+8"] = {
            digests = {
                ["aarch64-linux"] = "bb5b2ded252f21c6090cf780b0a408ad0d83bbb557e702955643557f13231880",
                ["aarch64-macos"] = "36dc14d797aaff6d89aab302cd053fdba6207dfdcf772052fa7b023a94b0e857",
                ["x86_64-linux"] = "68982529869257d0ee6b824ec5aa270ff8b118bb438670da0b97ebdab178d7fb",
            },
        },
    },
}
