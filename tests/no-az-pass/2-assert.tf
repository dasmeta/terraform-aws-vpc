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

  equal "not_created_when_disabled" {
    description = "The S3 Gateway endpoint can be disabled."
    got         = module.this.s3_gateway_endpoint_id
    want        = null
  }
}
