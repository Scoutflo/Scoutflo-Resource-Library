resource "aws_s3_bucket" "patch_logs_bucket" {
  bucket = "sf-production-ftqhri58pj"
}

resource "aws_s3_bucket_policy" "default" {
  bucket = aws_s3_bucket.patch_logs_bucket.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect    = "Allow",
        Principal = "*",
        Action    = ["s3:GetObject"],
        Resource  = "${aws_s3_bucket.patch_logs_bucket.arn}/*"
      }
    ]
  })
}