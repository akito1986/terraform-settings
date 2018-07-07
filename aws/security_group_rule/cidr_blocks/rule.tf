locals {
  default_cidr_ingress_rule           = "${concat(var.default_cidr_ingress_rule, var.optional_cidr_ingress_rule)}"
  rules                               = {
    ingress = "${coalescelist(var.cidr_rule_to_override, var.default_cidr_ingress_rule)}"
    egress  = "${coalescelist(var.cidr_rule_to_override, var.default_cidr_egress_rule)}"
  }
  target_rules                        = "${local.rules["${var.rule_type}"]}"
}

resource "aws_security_group_rule" "rule" {
  count                     = "${length(local.target_rules)}"
  type                      = "${var.rule_type}"
  to_port                   = "${lookup(local.target_rules[count.index], "to_port")}"
  from_port                 = "${lookup(local.target_rules[count.index], "from_port")}"
  protocol                  = "${lookup(local.target_rules[count.index], "protocol")}"
  cidr_blocks               = ["${lookup(local.target_rules[count.index], "cidr_block")}"]
  security_group_id         = "${var.security_group_id}"
}
