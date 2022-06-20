terraform {
  backend "s3" {
    bucket = "yawna-terraform-state"
    key    = "flagrant/terraform.tfstate"
    region = "us-east-2"
  }
}
