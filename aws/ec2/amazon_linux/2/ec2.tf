locals {
  environment_short_name  = "${var.environment == "production" ? "prd" : "dev" }"
  system_name             = "${replace(var.service, "_", "-")}"
  tags                    = { 
    Domain      = "${var.environment}"
    Env         = "${var.environment}"
    Service     = "${var.service}"
    Segment     = "${var.segment}"
    Role        = "${var.role}"
    Name        = "${local.environment_short_name}${var.number}-${var.availability_zone_name}-${var.region["code"]}-${var.role}-${local.system_name}"
  }
}

data "aws_ami" "amazon_linux_2" {
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
  owners = ["amazon"]
}

resource "aws_instance" "amazon_linux_2" {
  ami                         = "${data.aws_ami.amazon_linux_2.id}"
  instance_type               = "${var.ec2_instance_type}"
  key_name                    = "${var.ec2_key_name}"
  subnet_id                   = "${var.ec2_subnet_id}"
  vpc_security_group_ids      = ["${concat(var.ec2_security_group_ids)}"]
  associate_public_ip_address = "${var.ec2_associate_public_ip_address}"
  monitoring                  = "${var.ec2_monitoring}"
  iam_instance_profile        = "${var.ec2_instance_profile_name}"
  root_block_device           = "${var.ec2_root_block_device}"
  ebs_block_device            = "${var.ec2_ebs_block_device}"
  tags                        = "${local.tags}"
  lifecycle {
    ignore_changes = ["ami", "user_data"]
  }
}

output "instance_id" {
  value = "${aws_instance.amazon_linux_2.id}"
}

output "public_ip" {
  value = "${aws_instance.amazon_linux_2.public_ip}"
}

output "private_ip" {
  value = "${aws_instance.amazon_linux_2.private_ip}"
}
