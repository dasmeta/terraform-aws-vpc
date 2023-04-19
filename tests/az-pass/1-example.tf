module "this" {
  source = "../../"

  name               = "module-test-vpc-az-pass"
  availability_zones = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]
  private_subnets    = ["10.16.1.0/24", "10.16.2.0/24", "10.16.3.0/24"]
  public_subnets     = ["10.16.4.0/24", "10.16.5.0/24", "10.16.6.0/24"]
  cidr               = "10.16.0.0/16"
}
