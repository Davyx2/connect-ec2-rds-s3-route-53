variable "bucket_name" {
  description = "Le nom du bucket à specifie"
  default     = "s3-bucket"
  type        = string
}

variable "env" {
  default = "Development"
}

variable "acl" {
    default = "private"
}

