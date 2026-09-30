# greeting

Builds a greeting message. A dummy module for testing release tooling.

## Usage

```hcl
module "greeting" {
  source  = "chomatdam/greeting/null"
  version = "~> 0.1"

  name = "world"
}
```

The registry address above is an example. This repo does not publish to the registry.

## Inputs

| Name   | Description                      | Type     | Default   | Required |
|--------|----------------------------------|----------|-----------|----------|
| name   | Who to greet. Must not be empty. | `string` | n/a       | yes      |
| prefix | Word that starts the greeting.   | `string` | `"Hello"` | no       |

## Outputs

| Name    | Description                          |
|---------|--------------------------------------|
| message | The greeting, `"<prefix>, <name>!"`. |
