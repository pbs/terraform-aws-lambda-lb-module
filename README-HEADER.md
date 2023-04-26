# PBS TF Lambda LB

## Installation

### Using the Repo Source

Use this URL for the source of the module. See the usage examples below for more details.

```hcl
github.com/pbs/terraform-aws-lambda-lb-module?ref=x.y.z
```

### Alternative Installation Methods

More information can be found on these install methods and more in [the documentation here](./docs/general/install).

## Usage

Provisions an AWS Lambda function and an Application Load Balancer to route traffic to it.

Integrate this module like so:

```hcl
module "lambda_lb" {
  source = "github.com/pbs/terraform-aws-lambda-lb-module?ref=x.y.z"

  handler  = "main.lambda_handler"
  filename = "./artifacts/deploy.zip"
  runtime  = "python3.10"

  primary_hosted_zone = var.primary_hosted_zone

  # Tagging Parameters
  organization = var.organization
  environment  = var.environment
  product      = var.product
  repo         = var.repo

  # Optional Parameters
}
```

## Adding This Version of the Module

If this repo is added as a subtree, then the version of the module should be close to the version shown here:

`x.y.z`

Note, however that subtrees can be altered as desired within repositories.

Further documentation on usage can be found [here](./docs).

Below is automatically generated documentation on this Terraform module using [terraform-docs][terraform-docs]

---

[terraform-docs]: https://github.com/terraform-docs/terraform-docs
