module "this" {
  source = "../../"

  name            = "module-test-vpc-no-az-pass"
  private_subnets = ["10.16.1.0/24", "10.16.2.0/24", "10.16.3.0/24"]
  public_subnets  = ["10.16.4.0/24", "10.16.5.0/24", "10.16.6.0/24"]
  cidr            = "10.16.0.0/16"
}
