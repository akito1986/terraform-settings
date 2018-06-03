locals {
  rdp_from_cidrs = "${concat(list(var.local_net), var.optional_access_net)}"
}

resource "aws_security_group" "ec2_windows_2016" {
  name    = "${var.ec2_instance_name}-ec2-app"
  vpc_id  = "${var.vpc_id}"
  tags    = "${var.tags}"

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["${var.local_net}"]
  }

  ingress {
    from_port       = "${var.rdp_port}"
    to_port         = "${var.rdp_port}"
    protocol        = "tcp"
    cidr_blocks     = "${local.rdp_from_cidrs}"
  }

  egress {
    from_port     = 0 
    to_port       = 0 
    protocol      = "-1"
    cidr_blocks   = ["0.0.0.0/0"]
  }
}
