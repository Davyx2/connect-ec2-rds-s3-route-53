data "aws_db_subnet_group" "main" {
  name = var.db_subnet_group_name
}

resource "aws_db_instance" "main" {
  allocated_storage      = var.allocated_storage
  parameter_group_name   = var.parameter_group_name
  engine                 = var.engine
  engine_version         = var.engine_version
  instance_class         = var.instance_class
  identifier             = var.identifier

  db_name                = var.db_name
  username               = var.username_project
  password               = var.password_project


  publicly_accessible    = false
  skip_final_snapshot    = false
  max_allocated_storage  = 100
  delete_automated_backups = false
  deletion_protection      = true
  performance_insights_enabled  = true
  snapshot_identifier       = null
  final_snapshot_identifier = var.final_snapshot_identifier
  maintenance_window       = var.maintenance_window
  backup_window            = var.backup_window
  backup_retention_period  = var.backup_retention_period
  #monitoring_interval      = 5


   lifecycle {
    prevent_destroy = true
  } 

  db_subnet_group_name   = data.aws_db_subnet_group.main.id
  vpc_security_group_ids = [aws_security_group.sg-db_project.id]

  tags = {
    Name  = var.rds-tags
  }
}

