resource "aws_s3_bucket" "frontend_bucket" {
  bucket = "${var.project_name}-frontend"
  force_destroy = true
}

resource "aws_s3_bucket_website_configuration" "website_config" {
  bucket = aws_s3_bucket.frontend_bucket.id
  index_document {
    suffix = "index.html"
  }
}
