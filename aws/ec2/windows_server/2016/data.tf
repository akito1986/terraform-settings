data "aws_ami" "windows_2016_base" {
  most_recent = true
  filter {
    name    = "name"
    values  = ["Windows_Server-2016-English-Full-Base-*"]
  }
  filter {
    name   = "platform"
    values = ["windows"]
  }
  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }
}
