output "endpoint" {
  value = module.bucket-VYV.bucket-dns
}

output "url-image" {
  value = module.campus.image-url
}

output "public_ip" {
  value = module.instance-module.public_ip
}

output "public_dns" {
  value = module.instance-module.public_dns
}

output "db-endpoint" {
  value = module.instance-module.db_database_project
}

# eks
output "cluster_endpoint" {
  description = "Endpoint for EKS control plane"
  value       = module.eks.cluster_endpoint
}

output "cluster_security_group_id" {
  description = "Security group ids attached to the cluster control plane"
  value       = module.eks.cluster_security_group_id
}

output "cluster_name" {
  description = "Kubernetes Cluster Name"
  value       = module.eks.cluster_name
}