return {
    name = "trivy",
    description = "Find vulnerabilities and configuration issues",
    homepage = "https://trivy.dev",
    recipe_maintainers = { "tale" },
    default_license = "Apache-2.0",
    upstream = {
        github = "aquasecurity/trivy",
        repository_id = 180687624,
        tag = "v{version}",
    },
    source = {
        url = "https://codeload.github.com/aquasecurity/trivy/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "trivy-{version}",
        patches = {
            "--- a/pkg/x/json/json.go\010+++ b/pkg/x/json/json.go\010@@ -2,6 +2,7 @@\010 \010 import (\010 \009\"bytes\"\010+\009\"errors\"\010 \009\"encoding/json/jsontext\"\010 \009\"encoding/json/v2\"\010 \009\"io\"\010@@ -106,7 +107,7 @@\010 \010 \009\009// Check visited set to avoid infinity loops\010 \009\009if visited.Contains(start) {\010-\009\009\009return json.SkipFunc\010+\009\009\009return errors.ErrUnsupported\010 \009\009}\010 \009\009visited.Append(start)\010 \010--- a/pkg/iac/scanners/cloudformation/parser/parameter.go\010+++ b/pkg/iac/scanners/cloudformation/parser/parameter.go\010@@ -54,7 +54,7 @@\010 \009\009}\010 \009\009return nil\010 \009}\010-\009return json.SkipFunc\010+\009return errors.ErrUnsupported\010 }\010 \010 func (p *Parameter) Type() cftypes.CfType {\010--- a/go.mod\010+++ b/go.mod\010@@ -1,6 +1,6 @@\010 module github.com/aquasecurity/trivy\010 \010-go 1.26.3\010+go 1.27.0\010 \010 require (\010 \009github.com/Azure/azure-sdk-for-go/sdk/azcore v1.22.0\010",
        },
    },
    build = {
        backend = "go",
        go = {
            binaries = {
                trivy = "./cmd/trivy",
            },
            experiments = { "jsonv2" },
            variables = {
                ["github.com/aquasecurity/trivy/pkg/version/app.ver"] = "{version}",
            },
        },
    },
    outputs = {
        bins = { "trivy" },
        checks = {
            { "trivy", "--version" },
            { "trivy", "filesystem", "--help" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "0.74.0",
        },
        ["aarch64-macos"] = {
            default_version = "0.74.0",
        },
        ["x86_64-linux"] = {
            default_version = "0.74.0",
        },
    },
    versions = {
        ["0.74.0"] = {
            digests = {
                ["aarch64-linux"] = "04268af574690b84bc3474a5f19e002cd6da3e16899fac9fd39c6e84e7843940",
                ["aarch64-macos"] = "04268af574690b84bc3474a5f19e002cd6da3e16899fac9fd39c6e84e7843940",
                ["x86_64-linux"] = "04268af574690b84bc3474a5f19e002cd6da3e16899fac9fd39c6e84e7843940",
            },
            revision = 3,
        },
    },
}
