
resource "aws_s3_bucket" "default" {
    bucket = "my-s3-bucket"

    tags = {
        Name        = "ExampleBucket"
        # Environment = "Dev"
    }
}

resource "aws_s3_bucket_versioning" "default" {
    bucket = aws_s3_bucket.default.id

    versioning_configuration {
        status = "Disabled"
    }
}