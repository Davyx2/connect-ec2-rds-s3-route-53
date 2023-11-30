#General variables
variable  "region" { 
  description = "region de Paris"
  default     = "eu-west-3"
  type        = string
}

#Volume EBS
variable "server_ami" {
  default = "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-20230907"
}
variable "tags" {
  default = "Project"
}

#Instance
variable "ami_key_pair_project" {
  default = "project_key"
}
variable "pubkey-file" {
  default = "ssh/project.pub"
}
variable "size_ebs" {
  default = 30
  type = number
  description = "la taille de la partition principal"
}
variable "instance_type" {
  default = "t3.small"
}
variable "number_of_instances" {
  description = "number of instances to be created"
  default     = 1
}
variable "user-data-file" {
  default = "ec2-user-data.sh"
}
#Network
variable "subnet_id" {
  description = "The VPC subnet the instance(s) will be created in"
  default     = "subnet-0b1454cccec09906f" # subnet themis
}
variable "db_subnet_group_name" {
  description = " Private subnet name for RDS"
  default = "rds-group-themis"
  type = string
}
variable "vpc_ivi" {
  description = "Existence VPC about default network"
  default     = "vpc-075f347973d5fef90"
}
variable "private-subnet-for-themis" {
  description = "Sous reseaux prive pour la base de donnes" 
  type        = list(string) 
  default = [ 
    "subnet-0c1306e9ec4bcf839",
    "subnet-02c70395969e14ada",
    "subnet-0b84fede92aee5755"
   ]
}

#DNS
variable "zone_id" {
  description = "la zone cloud.iviflo.com"
  default     = "Z025828013G1XMKGY1L5E"
  type        = string
}
variable "dns_private_zone" {
  default = true
  type = bool
}
variable "dns-url-prefix" {
  default = "api"
}
variable "dns_ttl" {
  default = "300"
}

#Security groups
variable "security_group_project" {
  description = "List des ports autorise "
  default     = "security_project"
  type        = string
}
variable "sg-db-project" {
  description = "List des ports autorise "
  default     = "security-db-project"
  type        = string
}
variable "tags-security-group-db" {
  default = "Firewall-connect-instance-db"
} 
variable "sg-allow-outgoing" {
  default = "allow-outgoing-to-rds"
}


# db varibles 
variable "username_project" {
  description = "The master username for the database."
  type        = string
  sensitive   = true
}
variable "password_project" {
  description = "The master password for the database."
  type        = string
  sensitive   = true
}
variable "db-themis_letrot" {
  description = "sg db themis_letrot"
  default     = "sg-db-themis_letrot"
  type        = string
}
variable "rds-tags" {
  default = "db20-themis-letrot-prod"
}
variable "allocated_storage" {
  default = 10
}
variable "parameter_group_name" {
  default = "default.postgres13"
}
variable "engine" {
  default = "postgres"
}
variable "engine_version" {
  default = "13.10"
}
variable "instance_class" {
  default = "db.t3.micro"
}
variable "identifier" {
  default = "db20-project-prod"
}
variable "db_name" {
  default = "db_project"
}
variable "final_snapshot_identifier" {
  default = "prod-project-db-snapshot"
}
variable "maintenance_window" {
  default = "Sun:00:00-Sun:07:00"
}
variable "backup_window" {
  default = "22:30-23:30"
}
variable "backup_retention_period" {
  default = 35
}