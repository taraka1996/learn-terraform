terraform {
  backend "s3" {
    bucket = "terraform-b71"
    key    = "05-s3-state/terraform.tfstate"
    region = "us-east-1"
  }
}

resource "aws_instance" "ec2" {
  ami                    = ""
  instance_type          = "t3.micro"
  vpc_security_group_ids = [""]
  tags = {
    Name = "demo"
  }
}
