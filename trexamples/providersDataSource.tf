provider "aws" {
    access_key = "${var.aws_access_key}"
    secert_key = "${var.aws_secert_key}"
    region = "${var.region}"
}

resource "aws_vpc" "main" {
    cidr_block = "${var.vpc_cidr}"
    instance_tenancy = "default"

    tags {
        Name = "main"
        Location = "Israel"
    }
}

# using data source in the count  instead of a variable

resource "aws_subnet" "Subnets" {
    count = "${length(data.aws_availability_zones.azs.names)}"
    availability_zone = "${element(data.aws_availability_zones.azs.names,count.index)}"
    vpc_id = "${aws_vpc.main.id}"
    cidr_block = "${element(var.vpc_subnet_cidr,count.index)}"

    tags {
        Name = "subnet-${count.index+1}"
    }
}

}