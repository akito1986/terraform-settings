region                          = {
  name = "ap-northeast-1"
  code = "tky"
}
availability_zone               = "a"
vpc_id                          = "vpc-60920104"
domain                          = "development"
system_name                     = "auth-infra"
role                            = "active-directory"
ec2_key_name                    = "aueno-private"
ec2_password                    = ""
ec2_user_name                   = "sysadmin"
ec2_associate_public_ip_address = true
subnet_id                       = "subnet-153f2363"
optional_access_net             = ["172.16.0.0/16", "0.0.0.0/0"]
role                            = "active-directory"
