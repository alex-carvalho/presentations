```shell
$ terraform test


s3-bucket-unit.tftest.hcl... in progress
  run "check-required-tags"... fail
╷
│ Error: Test assertion failed
│ 
│   on s3-bucket-unit.tftest.hcl line 8, in run "check-required-tags":
│    8:       condition     = contains(keys(aws_s3_bucket.default.tags), "Name") && contains(keys(aws_s3_bucket.default.tags), "Environment")
│     ├────────────────
│     │ Diff:
│     │ --- actual
│     │ +++ expected
│     │ - true
│     │ + false

│ Check required tags are present
╵
run "check-s3-versioning"... fail
╷
│ Error: Test assertion failed
│ 
│   on s3-bucket-unit.tftest.hcl line 18, in run "check-s3-versioning":
│   18:       condition     = aws_s3_bucket_versioning.default.versioning_configuration[0].status == "Enabled"
│     ├────────────────
│     │ Diff:
│     │ --- actual
│     │ +++ expected
│     │ - "Disabled"
│     │ + "Enabled"
│ 
│ Check s3 versioning is enabled
╵
s3-bucket-unit.tftest.hcl... tearing down
s3-bucket-unit.tftest.hcl... fail
```