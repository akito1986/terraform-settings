locals {
  environment_short_name  = "${var.environment == "production" ? "prd" : "dev" }"
  system_name             = "${replace(var.service, "_", "-")}"
  name                    = "${local.environment_short_name}-${var.region["code"]}-${var.role}-${local.system_name}"
  tags                    = { 
    Country     = "${upper(var.region["country_code"])}"
    Domain      = "${var.environment}"
    Env         = "${var.environment}"
    Service     = "${var.service}"
    Segment     = "${var.segment}"
    Role        = "${var.role}"
    Name        = "${local.name}"
  }
}

resource "aws_security_group" "security_group" {
  name    = "${local.name}"
  vpc_id  = "${var.vpc_id}"
  tags    = "${local.tags}"
}

output "id" {
  value = "${aws_security_group.security_group.id}"
}
