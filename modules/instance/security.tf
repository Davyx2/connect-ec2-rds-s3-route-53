resource "aws_security_group" "main" {
  name = var.security_group_project
  #description = "creation d'une reglen firewall pour les traffics entrans et sortants"

  vpc_id = var.vpc_ivi

  ingress {
    description = "Traffic  entrants ssl"
    from_port   = 443
    to_port     = 443
    protocol    = "6"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Traffic sortants ssl"
    from_port   = 443
    to_port     = 443
    protocol    = "6"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Traffic  entrants http "
    from_port   = 80
    to_port     = 80
    protocol    = "6"
    cidr_blocks = ["0.0.0.0/0"]
  }


  egress {
    description = "Traffic sortants http"
    from_port   = 80
    to_port     = 80
    protocol    = "6"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Traffic  entrants ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "6"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Traffic sortants ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "6"
    cidr_blocks = ["0.0.0.0/0"]
  }


  tags = {
    Name = var.tags
  }
}

resource "aws_security_group" "out-allow" {
  name = var.sg-allow-outgoing

  vpc_id = var.vpc_ivi
  egress {
    description = "allow ingoing traffic to rds instance"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    security_groups = [aws_security_group.sg-db_project.id]
  }
}

resource "aws_security_group" "sg-db_project" {
  name = var.sg-db-project
  description = "Security for rds"

  vpc_id = var.vpc_ivi

  ingress {
    protocol    = "tcp"
    from_port   = 5432
    to_port     = 5432
    security_groups = [aws_security_group.main.id]
  }

  tags = {
    Name = var.tags-security-group-db
  }

}