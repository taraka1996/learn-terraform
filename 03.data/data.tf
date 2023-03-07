data "aws_ami" "example" {
  most_recent = true
  name_regex  = "Centos-8-DevOps-Practice"
  owners      = ["777278876268"]
}

output "ami_id" {
  value = data.aws_ami.ami.image_id
}