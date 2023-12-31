resource "aws_eip" "main" {
  instance = aws_instance.main.id
  vpc      = true
  lifecycle {
    prevent_destroy = true
  }
  tags = {
    Name   = var.tags
  }
} 

resource "aws_eip_association" "main" {
  instance_id   = aws_instance.main.id
  allocation_id = aws_eip.main.id
   lifecycle {
    prevent_destroy = true
  }
} 

resource "aws_key_pair" "main" {
  public_key = file(var.pubkey-file)
  key_name   = var.ami_key_pair_project
  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_instance" "main" {
  ami                    = data.aws_ami.ubuntu.id
  subnet_id              = var.subnet_id
  instance_type          = var.instance_type
  key_name               = aws_key_pair.main.key_name
  vpc_security_group_ids = [aws_security_group.main.id,aws_security_group.out-allow.id]
  user_data              = file("ec2-user-data.sh")
  user_data_replace_on_change = true

  ebs_block_device {
    device_name = "/dev/sda1"
    delete_on_termination = false
    volume_size = var.size_ebs
  }
  
  lifecycle {
    prevent_destroy = true
  } 
  
  tags = {
    Name = var.tags
  }
}