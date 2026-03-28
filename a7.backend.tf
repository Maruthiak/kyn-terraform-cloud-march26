terraform {
  backend "s3" {
    bucket = "terraform-remote-ak" #replace with your s3 bucket name
    key = "terraform.tfstate" ##this is the file name which will be created in the s3 bucket to store the tfstate file
    region = "us-east-1"
    dynamodb_table = "ak-terraform-lock" #replace with your dynamodb table name which will be used for state locking
    encrypt = true
  }
}