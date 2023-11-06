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

# backend.hcl
#below bucket and dynamo table is for storing terraform.tfstate safely
terraform {
  backend "s3" {
    bucket         = var.backendbucketname
    dynamodb_table = var.backenddynamodbtable
    key            = "terraform.tfstate"
    region         = var.backenddynamodbtable
    encrypt        = true  # Set this to true to ensure that state files are encrypted by default
  }
}