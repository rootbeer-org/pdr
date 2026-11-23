return {
    name = "deno",
    description = "JavaScript and TypeScript runtime",
    homepage = "https://deno.com",
    recipe_maintainers = { "tale" },
    default_license = "MIT",
    upstream = {
        github = "denoland/deno",
        repository_id = 133442384,
        tag = "v{version}",
    },
    prebuilt = {
        github = "denoland/deno",
        tag = "v{version}",
        asset = "deno-{target}.zip",
    },
    outputs = {
        bins = { "deno" },
        checks = {
            { "deno", "--version" },
            { "deno", "eval", "console.log(1+1)" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            target = "aarch64-unknown-linux-gnu",
            default_version = "2.9.8",
        },
        ["aarch64-macos"] = {
            target = "aarch64-apple-darwin",
            default_version = "2.9.8",
        },
        ["x86_64-linux"] = {
            target = "x86_64-unknown-linux-gnu",
            default_version = "2.9.8",
        },
    },
    versions = {
        ["2.9.8"] = {
            digests = {
                ["aarch64-linux"] = "d49596c20b9788cf8f5d8ddf644103d4bde56ed239753f0bdb92ba9361d51905",
                ["aarch64-macos"] = "9f0bf660393da2eaff044cdc7444cb08c73f235849b61d224d825a194ce7c98e",
                ["x86_64-linux"] = "e890975bc2549807bbcc0b584ffafda72cc7c93349dd99c80483dd784f6c4609",
            },
            trees = {
                ["aarch64-linux"] = "eda18205faa5d6246f3103e1bb603c2deffc8415d4e3a200a16a1fa60c86083e",
                ["aarch64-macos"] = "429ef334a451161e87b0da1cce9000e38ab3ec5dfcf9e3931c32da8ba43e0713",
                ["x86_64-linux"] = "98620a83611ff6be839c3b94f76e031676d6177046c6afe7d5df28be27dc20fa",
            },
        },
    },
}
