variable service                          {}
variable segment                          {}
variable role                             {}
variable availability_zone_name           {}
variable ec2_subnet_id                    {}
variable ec2_instance_profile_name        {}
variable number                           { default = "01" }
variable environment                      { default = "staging" }
variable ec2_instance_type                { default = "t2.micro" }
variable ec2_key_name                     { default = "aueno-private" }
variable ec2_associate_public_ip_address  { default = "false" }
variable ec2_monitoring                   { default = true }
variable ec2_security_group_ids           { default = [], type = "list" }
variable ec2_ebs_block_device             { default = [], type = "list" }
variable ec2_root_block_device            {
  type = "list"
  default = [
    {
      volume_type = "gp2", volume_size = 30, delete_on_termination = true
    }
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
