terraform {
  backend "s3" {
    bucket = "yawna-terraform"
    key    = "flagrant/terraform.tfstate"
    region = "us-east-2"
  }
}
