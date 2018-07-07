terraform {
  backend "s3" {
    bucket = "management-tky-provisioning"
    key    = "kubernetes/development.tfstate"
    region = "ap-northeast-1"
  }
}
