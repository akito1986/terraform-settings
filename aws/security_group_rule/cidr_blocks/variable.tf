variable rule_type                      { default = "ingress" }
variable to_port                        { default = "" }
variable from_port                      { default = ""}
variable protocol                       { default = "tcp"}
variable security_group_id              {}
variable cidr_rule_to_override          { type = "list", default = [] }
variable optional_cidr_ingress_rule     { type = "list", default = [] }
variable default_cidr_ingress_rule      {
  type      = "list"
  default   = [
    { from_port = -1, to_port = -1, protocol = "icmp", cidr_block = "0.0.0.0/0" },
    { from_port = 22, to_port = 22, protocol = "tcp", cidr_block = "0.0.0.0/0" }
  ]
}

variable default_cidr_egress_rule       {
  type    = "list"
  default = [
    { from_port = 0, to_port = 0, protocol = "-1", cidr_block = "0.0.0.0/0" }
  ]
}

variable region                           {   
  type    = "map"
  default = { 
    name          = "ap-northeast-1"
    code          = "tky"
    country_code  = "jp"
  }
}
