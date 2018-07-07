variable service                          {}
variable vpc_id                           {}
variable segment                          {}
variable role                             {}
variable environment                      { default = "staging" }
variable region                           {
  type    = "map"
  default = {
    name          = "ap-northeast-1"
    code          = "tky"
    country_code  = "jp"
  }
}
