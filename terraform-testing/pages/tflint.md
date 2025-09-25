
```shell
$ tflint
```

```log
3 issue(s) found:

Warning: terraform "required_version" attribute is required (terraform_required_version)

  on main.tf line 1:

Reference: https://github.com/terraform-linters/tflint-ruleset-terraform/blob/v0.13.0/docs/rules/terraform_required_version.md

Warning: `instance_type` variable has no type (terraform_typed_variables)

  on main.tf line 3:
   3: variable "instance_type" {

Reference: https://github.com/terraform-linters/tflint-ruleset-terraform/blob/v0.13.0/docs/rules/terraform_typed_variables.md

Warning: Missing version constraint for provider "aws" in `required_providers` (terraform_required_providers)

  on providers.tf line 1:
   1: provider "aws" {

Reference: https://github.com/terraform-linters/tflint-ruleset-terraform/blob/v0.13.0/docs/rules/terraform_required_providers.md

```