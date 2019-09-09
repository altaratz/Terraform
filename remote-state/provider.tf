provider "aws" {
    region = "us-east-1"
}

# When we "terraform init" the project it will download the plug-ins of the provider (you will be able to see a plug-ins folder in your project).
# When we "terraform apply" the project, terraform will create a "state file" that have information related to the project.
# This file is saved locally on your machine. In case there are a few developers that work on the project they must use the same "state file".
# In this case you can save the file in S3 bucket you have created and point terraform to save and sync the state file from the bucket, like you see below.

terraform {
    backend "s3" {
        bucket = "mybucket"
        key = "path/tp/my/key"
        region = "us-east-1"
    }
}

# Next time you will run the "terraform init" command it will sync your local state file to the bucket you have configure as a backend
# The state file in your local machine will be empty, next time you will run "terraform apply" it will check the state file you in the S3 bucket.

resource "aws_vpc" "vpcRS" {
    cidr_block = "10.0.0.0/16"
    instance_tenancy = "default"

    tags {
        Name = "TerraformRSDemo"
    }
}

