resource "aws_security_group_rule" "rule" {
  type                      = "${var.rule_type}"
  to_port                   = "${var.to_port}"
  from_port                 = "${var.from_port}"
  protocol                  = "${var.protocol}"
  source_security_group_id  = "${var.source_security_group_id}"
  security_group_id         = "${var.security_group_id}"
}
