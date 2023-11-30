module "vyllage" {
  source   = "./modules/ecr"
  ecr-name = "vyllage"
  tags-ecr = "VYV"
}

module "campus" {
  source   = "./modules/ecr"
  ecr-name = "campus"
  tags-ecr = "CAMPUS"
}

module "bucket-VYV" {
  source      = "./modules/bucket"
  bucket_name = "vyv.iviplay.io"
  acl         = "private"
}

module "instance-module" {
  source = "./modules/instance"
  #db
  username_project          = "postgres"
  password_project          =  var.pass
  rds-tags                  = "db21-instance-module-prod"
  identifier                = "db21-instance-module-prod"
  db_name                   = var.db-name
  final_snapshot_identifier = "prod-instance-db-snapshot"
  #network
  security_group_project = "allow-https-ssh"
  sg-db-project          = "security-db-instance-module"
  tags-security-group-db = "Firewall-connect-instance-module-db"
  sg-allow-outgoing      = "allow-outgoing-from-instance-module-rds"
  #dns
  dns-url-prefix = "api-instance-module"
  #instance
  ami_key_pair_project = "instance_module_key"
  tags                 = "Instance-module"
  pubkey-file          = "/home/seidou/TERRAFORM/learn-terraform-aws-instance/design-new-themis/main/ssh/project.pub"
  user-data-file       = "/home/seidou/TERRAFORM/learn-terraform-aws-instance/design-new-themis/main/ec2-user-data.sh"
}