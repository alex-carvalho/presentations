run "check-required-tags" {

  command = plan

  assert {
      condition     = contains(keys(aws_s3_bucket.default.tags), "Name") && contains(keys(aws_s3_bucket.default.tags), "Environment")
      error_message = "Check required tags are present"
  }
}

run "check-s3-versioning" {

  command = plan

  assert {
      condition     = aws_s3_bucket_versioning.default.versioning_configuration[0].status == "Enabled"
      error_message = "Check s3 versioning is enabled"
  }
}
