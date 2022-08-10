//here we creating an ami is making in part of continuous integaration. means
//while we perform CI that should generate ami of this component. that is a plan here

provider "aws" {
  region      = "us-east-1"
}

terraform {
  backend "s3" {
    bucket    = "terraform-rk01"
    key       = "ami/user/terraform.tfstate"
    region    = "us-east-1"
  }
}

module "ami" {
  source       = "github.com/devopsravi9/immutable-app-ami"
  COMPONENT    = "user"
  APP_VERSION  = var.APP_VERSION
}

variable "APP_VERSION" {}