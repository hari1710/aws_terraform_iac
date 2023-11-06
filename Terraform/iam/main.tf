resource "aws_s3_bucket" "example" {
  bucket = "your-bucket-name"
  acl    = "private"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"  # You can use other encryption methods if desired
      }
    }
  }
}