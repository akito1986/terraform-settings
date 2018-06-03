terraform {
  backend "s3" {
    bucket = "management-tky-provisioning"
    key    = "active_directory/development.tfstate"
    region = "ap-northeast-1"
  }
}
