resource "test_assertions" "dummy" {
  component = "this"

  equal "scheme" {
    description = "As module does not have any output and data just make sure the case runs. Probably can be thrown away."
    got         = "all good"
    want        = "all good"
  }
}

resource "test_assertions" "s3_gateway_endpoint" {
  component = "s3_gateway_endpoint"

  equal "created_by_default" {
    description = "The S3 Gateway endpoint is created by default."
    got         = module.this.s3_gateway_endpoint_id != null
    want        = true
  }
}
