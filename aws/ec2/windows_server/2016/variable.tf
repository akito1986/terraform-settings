variable ec2_instance_type                { default = "t2.micro" }
variable ec2_instance_name                {}
variable ec2_key_name                     {}
variable ec2_password                     {}
variable ec2_user_name                    {}
variable system_name                      {}
variable ec2_associate_public_ip_address  { default = false }
variable ec2_root_volume_size             { default = 100 }
variable vpc_id                           {}
variable role                             {}
variable subnet_id                        {}
variable tags                             { type = "map" }
variable region                           { type = "map" }
variable local_net                        { default = "10.0.0.0/8" }
variable optional_access_net              { type = "list" default = [] }
variable rdp_port                         { default = 3389 }
