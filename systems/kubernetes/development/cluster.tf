variable region       { type = "map" }
variable subnet_ids   { type = "map" }
variable service      {}
variable vpc_id       {}
variable segment      {}
variable role         {}
variable environment  {}

module "security_group" {
  source                       = "../../../aws/security_group/"
  region                       = "${var.region}"
  environment                  = "${var.environment}"
  service                      = "${var.service}"
  segment                      = "${var.segment}"
  vpc_id                       = "${var.vpc_id}"
  role                         = "${var.role}"
}

module "security_group_cidr_ingress" {
  source                       = "../../../aws/security_group_rule/cidr_blocks/"
  security_group_id            = "${module.security_group.id}" 
}

module "security_group_cidr_egress" {
  source                       = "../../../aws/security_group_rule/cidr_blocks/"
  security_group_id            = "${module.security_group.id}" 
  rule_type                    = "egress"
}

module "security_group_security_group" {
  source                       = "../../../aws/security_group_rule/security_group_id/"
  security_group_id            = "${module.security_group.id}" 
  source_security_group_id     = "${module.security_group.id}" 
  from_port                    = 0
  to_port                      = 0
}

module "kube_1" {
  source                          = "../../../aws/ec2/amazon_linux/2/"
  region                          = "${var.region}"
  environment                     = "${var.environment}"
  service                         = "${var.service}"
  segment                         = "${var.segment}"
  role                            = "${var.role}"
  availability_zone_name          = "a"
  ec2_subnet_id                   = "${element(var.subnet_ids["private"], 0)}"
  ec2_instance_profile_name       = ""
  ec2_security_group_ids          = ["${module.security_group.id}"]
  ec2_associate_public_ip_address = true
}

module "kube_2" {
  source                          = "../../../aws/ec2/amazon_linux/2/"
  region                          = "${var.region}"
  environment                     = "${var.environment}"
  service                         = "${var.service}"
  segment                         = "${var.segment}"
  role                            = "${var.role}"
  availability_zone_name          = "c"
  ec2_subnet_id                   = "${element(var.subnet_ids["private"], 1)}"
  ec2_instance_profile_name       = ""
  ec2_security_group_ids          = ["${module.security_group.id}"]
  ec2_associate_public_ip_address = true
}

module "kube_3" {
  source                          = "../../../aws/ec2/amazon_linux/2/"
  region                          = "${var.region}"
  environment                     = "${var.environment}"
  service                         = "${var.service}"
  segment                         = "${var.segment}"
  role                            = "${var.role}"
  availability_zone_name          = "a"
  ec2_subnet_id                   = "${element(var.subnet_ids["private"], 0)}"
  ec2_instance_profile_name       = ""
  ec2_security_group_ids          = ["${module.security_group.id}"]
  ec2_associate_public_ip_address = true
  number                          = "02"
}

output "ec2_public_ips" {
  value = ["${module.kube_1.public_ip}", "${module.kube_2.public_ip}", "${module.kube_3.public_ip}"]
}

output "ec2_private_ips" {
  value = ["${module.kube_1.private_ip}", "${module.kube_2.private_ip}", "${module.kube_3.private_ip}"]
}
