# terraform-aws-vpc
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Allows to create vpc setup for using in modules/projects

### example vpc for eks
```hcl
module "vpc" {
  source  = "dasmeta/eks/aws"
  version = "1.0.0"

  name = "dev"
  availability_zones = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]
  private_subnets    = ["10.16.1.0/24", "10.16.2.0/24", "10.16.3.0/24"]
  public_subnets     = ["10.16.4.0/24", "10.16.5.0/24", "10.16.6.0/24"]
  cidr               = "10.16.0.0/16"
  public_subnet_tags = {
    "kubernetes.io/cluster/dev" = "shared"
    "kubernetes.io/role/elb"    = "1"
  }
  private_subnet_tags = {
    "kubernetes.io/cluster/dev"       = "shared"
    "kubernetes.io/role/internal-elb" = "1"
  }
}
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.73 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.73 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_vpc"></a> [vpc](#module\_vpc) | terraform-aws-modules/vpc/aws | 3.16.0 |

## Resources

| Name | Type |
|------|------|
| [aws_availability_zones.available](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_availability_zones"></a> [availability\_zones](#input\_availability\_zones) | List of VPC availability zones, e.g. ['eu-west-1a', 'eu-west-1b', 'eu-west-1c']. Will get all availability zones in current region if not passed | `list(string)` | `null` | no |
| <a name="input_cidr"></a> [cidr](#input\_cidr) | CIDR ip range. | `string` | n/a | yes |
| <a name="input_enable_dns_hostnames"></a> [enable\_dns\_hostnames](#input\_enable\_dns\_hostnames) | Whether or not to enable dns hostnames. | `bool` | `true` | no |
| <a name="input_enable_dns_support"></a> [enable\_dns\_support](#input\_enable\_dns\_support) | Whether or not to enable dns support. | `bool` | `true` | no |
| <a name="input_enable_nat_gateway"></a> [enable\_nat\_gateway](#input\_enable\_nat\_gateway) | Whether or not to enable NAT Gateway. | `bool` | `true` | no |
| <a name="input_name"></a> [name](#input\_name) | VPC name. | `string` | n/a | yes |
| <a name="input_private_subnet_tags"></a> [private\_subnet\_tags](#input\_private\_subnet\_tags) | n/a | `map(any)` | `{}` | no |
| <a name="input_private_subnets"></a> [private\_subnets](#input\_private\_subnets) | Private subnets of VPC. | `list(string)` | n/a | yes |
| <a name="input_public_subnet_tags"></a> [public\_subnet\_tags](#input\_public\_subnet\_tags) | n/a | `map(any)` | `{}` | no |
| <a name="input_public_subnets"></a> [public\_subnets](#input\_public\_subnets) | Public subnets of VPC. | `list(string)` | n/a | yes |
| <a name="input_single_nat_gateway"></a> [single\_nat\_gateway](#input\_single\_nat\_gateway) | Whether or not to enable single NAT Gateway. | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_availability_zones"></a> [availability\_zones](#output\_availability\_zones) | Availability zone names used for vpc creation |
| <a name="output_cidr_block"></a> [cidr\_block](#output\_cidr\_block) | The cidr block of the vpc |
| <a name="output_default_security_group_id"></a> [default\_security\_group\_id](#output\_default\_security\_group\_id) | The ID of default security group created |
| <a name="output_id"></a> [id](#output\_id) | The newly created vpc id |
| <a name="output_nat_public_ips"></a> [nat\_public\_ips](#output\_nat\_public\_ips) | The list of elastic public IPs |
| <a name="output_private_subnets"></a> [private\_subnets](#output\_private\_subnets) | The newly created vpc private subnets IDs list |
| <a name="output_public_subnets"></a> [public\_subnets](#output\_public\_subnets) | The newly created vpc public subnets IDs list |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
