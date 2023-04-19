/**
* ## create vpc setup for using in modules/projects
*
* ### example vpc for eks
*```hcl
*module "vpc" {
*  source  = "dasmeta/eks/aws"
*  version = "0.1.0"
*
*  name = "dev"
*  availability_zones = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]
*  private_subnets    = ["10.16.1.0/24", "10.16.2.0/24", "10.16.3.0/24"]
*  public_subnets     = ["10.16.4.0/24", "10.16.5.0/24", "10.16.6.0/24"]
*  cidr               = "10.16.0.0/16"
*  public_subnet_tags = {
*    "kubernetes.io/cluster/dev" = "shared"
*    "kubernetes.io/role/elb"    = "1"
*  }
*  private_subnet_tags = {
*    "kubernetes.io/cluster/dev"       = "shared"
*    "kubernetes.io/role/internal-elb" = "1"
*  }
*}
*```
**/

data "aws_availability_zones" "available" {
  count = var.availability_zones == null ? 1 : 0
}

locals {
  availability_zones = var.availability_zones == null ? data.aws_availability_zones.available[0].names : var.availability_zones
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "4.0.1"

  name                 = var.name
  cidr                 = var.cidr
  azs                  = local.availability_zones
  private_subnets      = var.private_subnets
  public_subnets       = var.public_subnets
  enable_nat_gateway   = var.enable_nat_gateway
  single_nat_gateway   = var.single_nat_gateway
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support

  public_subnet_tags  = var.public_subnet_tags
  private_subnet_tags = var.private_subnet_tags
}
