return {
    schema = 2,
    name = "trivy",
    description = "Find vulnerabilities and configuration issues",
    default_version = "0.74.0",
    homepage = "https://github.com/aquasecurity/trivy",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "aquasecurity/trivy",
        repository_id = 180687624,
        tag_prefix = "v",
    },
    inputs = {
        source = {
            url = "https://codeload.github.com/aquasecurity/trivy/tar.gz/refs/tags/{tag}",
            archive = "tar.gz",
            strip_prefix = "trivy-{version}",
            patches = {
                "--- a/pkg/x/json/json.go\n+++ b/pkg/x/json/json.go\n@@ -2,6 +2,7 @@\n \n import (\n \t\"bytes\"\n+\t\"errors\"\n \t\"encoding/json/jsontext\"\n \t\"encoding/json/v2\"\n \t\"io\"\n@@ -106,7 +107,7 @@\n \n \t\t// Check visited set to avoid infinity loops\n \t\tif visited.Contains(start) {\n-\t\t\treturn json.SkipFunc\n+\t\t\treturn errors.ErrUnsupported\n \t\t}\n \t\tvisited.Append(start)\n \n--- a/pkg/iac/scanners/cloudformation/parser/parameter.go\n+++ b/pkg/iac/scanners/cloudformation/parser/parameter.go\n@@ -54,7 +54,7 @@\n \t\t}\n \t\treturn nil\n \t}\n-\treturn json.SkipFunc\n+\treturn errors.ErrUnsupported\n }\n \n func (p *Parameter) Type() cftypes.CfType {\n--- a/go.mod\n+++ b/go.mod\n@@ -1,6 +1,6 @@\n module github.com/aquasecurity/trivy\n \n-go 1.26.3\n+go 1.27.0\n \n require (\n \tgithub.com/Azure/azure-sdk-for-go/sdk/azcore v1.22.0\n",
            },
        },
    },
    build = {
        backend = "go",
        go = {
            binaries = { trivy = "./cmd/trivy" },
            variables = { ["github.com/aquasecurity/trivy/pkg/version/app.ver"] = "{version}" },
            experiments = { "jsonv2" },
        },
    },
    outputs = {
        bins = { "trivy" },
        checks = { { "trivy", "--version" }, { "trivy", "filesystem", "--help" } },
    },
    versions = {
        ["0.74.0"] = {
            revision = 3,
            inputs = {
                source = {
                    sha256 = "04268af574690b84bc3474a5f19e002cd6da3e16899fac9fd39c6e84e7843940",
                },
            },
        },
    },
}
