# sample-terraform-modules

A sandbox for testing release-please and Renovate with two dummy Terraform modules. The modules do nothing useful.

## Layout

| Path               | What it is                                                        |
|--------------------|-------------------------------------------------------------------|
| `modules/greeting` | Builds a greeting message.                                        |
| `modules/naming`   | Builds a lowercase resource name.                                 |

Each module has the standard module structure, an example in `examples/basic` and a `terraform test` file.

## Checks

```bash
terraform -chdir=modules/greeting test
terraform -chdir=modules/naming test
```

Run `terraform init -backend=false` in a module dir first.

## Releases

release-please runs on every push to `main` and opens one release PR per module. Merging a release PR creates the tag,
for example `greeting-v0.1.0`.

Commit messages decide the bump. release-please picks the module from the files a commit touches, not from the scope.

| Commit                            | Effect                                          |
|-----------------------------------|-------------------------------------------------|
| `feat(greeting): ...`             | minor release of the module whose files changed |
| `fix(naming): ...`                | patch release                                   |
| `chore:`, `ci:`, `docs:`, `test:` | no release                                      |

`versions.tf` in a module must never contain a `vX.Y.Z` string. release-please rewrites them, and CI fails if one
appears.

## Consumer updates

[sample-terraform-modules-consumer](https://github.com/chomatdam/sample-terraform-modules-consumer) pins each module with
a git source, for example
`git::ssh://git@github.com/chomatdam/sample-terraform-modules.git//modules/greeting?ref=greeting-v0.1.0`. Its
`renovate.json` reads the `greeting-v` and `naming-v` prefixes so Renovate can compare the tags. Install the Mend
Renovate GitHub App on both repos to see it open update PRs.

## Publishing one module to the registry

The registry needs one module per repo, named `terraform-<provider>-<name>`, with plain `vX.Y.Z` tags. To publish one
module, copy its directory to the root of such a repo and use a single-package release-please config with
`include-component-in-tag` set to `false`.
