variable region                           { type = "map" }
variable availability_zone                {}
variable ec2_key_name                     {}
variable ec2_password                     {}
variable ec2_user_name                    {}
variable ec2_associate_public_ip_address  {}
variable vpc_id                           {}
variable subnet_id                        {}
variable optional_access_net              { type = "list" }
variable domain                           {}
variable system_name                      {}
variable role                             {}

locals {
  server_instance_name = "${var.domain}-${var.region["code"]}-${var.availability_zone}-${var.system_name}-${var.role}"
  server_tags = {
    Name    = "${local.server_instance_name}"
    Domain  = "${var.domain}"
    System  = "${var.system_name}"
  }
  client_instance_name = "${var.domain}-${var.region["code"]}-${var.availability_zone}-${var.system_name}-active-directory-client"
  client_tags = {
    Name    = "${local.client_instance_name}"
    Domain  = "${var.domain}"
    System  = "${var.system_name}"
  }
}

module "active_directory" {
  source                            = "../../../aws/ec2/windows_server/2016/"
  ec2_instance_name                 = "${local.server_instance_name}"
  ec2_key_name                      = "${var.ec2_key_name}"
  ec2_password                      = "${var.ec2_password}"
  ec2_user_name                     = "${var.ec2_user_name}"
  ec2_associate_public_ip_address   = "${var.ec2_associate_public_ip_address}"
  vpc_id                            = "${var.vpc_id}"
  subnet_id                         = "${var.subnet_id}"
  tags                              = "${local.server_tags}"
  region                            = "${var.region}"
  system_name                       = "${var.system_name}"
  optional_access_net               = "${var.optional_access_net}"
  role                              = "${var.role}"
}

module "active_directory_client" {
  source                            = "../../../aws/ec2/windows_server/2016/"
  ec2_instance_name                 = "${local.client_instance_name}"
  ec2_key_name                      = "${var.ec2_key_name}"
  ec2_password                      = "${var.ec2_password}"
  ec2_user_name                     = "${var.ec2_user_name}"
  ec2_associate_public_ip_address   = "${var.ec2_associate_public_ip_address}"
  vpc_id                            = "${var.vpc_id}"
  subnet_id                         = "${var.subnet_id}"
  tags                              = "${local.client_tags}"
  region                            = "${var.region}"
  system_name                       = "${var.system_name}"
  optional_access_net               = "${var.optional_access_net}"
  role                              = "active-directory-client"
}

