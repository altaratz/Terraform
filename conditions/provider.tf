provider "aws" {
    region = "${var.region}"
}

variable "env" {
    default = "prod"
}

resource "aws_vpc" "myapp_vpc" {

    # In the count is you set 0 it say don't create the resource, in this example we can see that it looks on the value of variable "env"
    # if "env" = "prod" it will set the count to 1 and if not it will set the count to 0 and the resource will not be deployed

    count = "${var.env == "prod" ? 1 : 0}"
    cidr_block = "10.2.0.0/16"
    instance_tenancy = "default"

    tags {
        Name = "myapp_vpc"
        AppName - "MyApp"
    }
}