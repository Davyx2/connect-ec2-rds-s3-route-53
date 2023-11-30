output "bucket-dns" {
  value = aws_s3_bucket.main.website_endpoint
}