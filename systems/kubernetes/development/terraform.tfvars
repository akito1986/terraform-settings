region = {
  name         = "ap-northeast-1"
  code         = "tky"
  country_code = "jp"
}
environment = "development"
service     = "container_manager"
role        = "kube"
segment     = "private"
vpc_id      = "vpc-60920104"
subnet_ids  = {
  private = ["subnet-caebb892", "subnet-153f2363"]
}
