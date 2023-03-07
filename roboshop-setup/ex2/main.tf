data "aws_ami" "ami"  {
  most_recent = true
  name_regex = "Centos-8-DevOps-Practice"
  owners = ["777278876268"]
}



resource "aws_instance" "frontend" {
  count                  = length(var.instances)
  ami                    = data.aws_ami.ami.image_id
  instance_type          = "t3.micro"
  vpc_security_group_ids = ["Z0979159L4V27YKYGYYI"]
  tags = {
    Name = var.instances[count.index]
  }
}

variable "instances" {
  default = ["cart", "catalogue", "user", "payment", "shipping"]
}

output "public-ip" {
  value = aws_instance.frontend.*.public_ip
}