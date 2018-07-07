variable rule_type                { default = "ingress" }
variable to_port                  { default = "" }
variable from_port                { default = ""}
variable protocol                 { default = "tcp"}
variable source_security_group_id {}
variable security_group_id        {}
variable region                   {   
  type    = "map"
  default = { 
    name          = "ap-northeast-1"
    code          = "tky"
    country_code  = "jp"
  }
}
