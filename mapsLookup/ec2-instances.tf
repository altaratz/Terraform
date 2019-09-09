resource "aws_instance" "web" {
  # ami           = "${var.ec2_ami}"
  ami = "${lookup(var.ec2_ami,var.region)}"
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
}