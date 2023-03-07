data "aws_ami" "ami"  {
  most_recent = true
  name_regex = "Centos-8-DevOps-Practice"
  owners = ["119044227534"]
}



resource "aws_instance" "frontend" {
  count                  = length(var.instances)
  ami                    = data.aws_ami.ami.image_id
  instance_type          = "t3.micro"
  vpc_security_group_ids = ["sg-0f914773417860a28"]
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