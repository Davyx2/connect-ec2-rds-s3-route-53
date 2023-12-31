output "public_ip" {
  value = aws_instance.main.associate_public_ip_address
}

output "public_dns" {
  value = aws_instance.main.public_dns
}

output "db_database_project" {
  value = aws_db_instance.main.endpoint
} 