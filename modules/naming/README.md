# naming

Builds a lowercase resource name from a project and an environment. A dummy module for testing release tooling.

## Usage

```hcl
module "naming" {
  source  = "chomatdam/naming/null"
  version = "~> 0.1"

  project     = "sample"
  environment = "dev"
}
```

The registry address above is an example. This repo does not publish to the registry.

## Inputs

| Name        | Description                                                   | Type     | Default | Required |
|-------------|---------------------------------------------------------------|----------|---------|----------|
| project     | Project name. Must not be empty.                              | `string` | n/a     | yes      |
| environment | Environment name, for example dev or prod. Must not be empty. | `string` | n/a     | yes      |
| separator   | Text placed between the project and the environment.          | `string` | `"-"`   | no       |

## Outputs

| Name | Description                                                           |
|------|-----------------------------------------------------------------------|
| name | The resource name, `"<project><separator><environment>"`, lowercased. |
