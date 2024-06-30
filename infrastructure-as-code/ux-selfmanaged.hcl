# S3 bucket for frontend assets
resource "aws_s3_bucket" "frontend_bucket" {
  bucket = "frontend-assets"
  acl    = "public-read"

  website {
    index_document = "index.html"
    error_document = "index.html"
  }
}

# CloudFront distribution
resource "aws_cloudfront_distribution" "frontend_distribution" {
  origin {
    domain_name = aws_s3_bucket.frontend_bucket.website_endpoint
    origin_id   = "S3-frontend"
  }

  enabled             = true
  default_root_object = "index.html"

  # Specify any necessary settings like caching behaviors, SSL/TLS, etc.
}