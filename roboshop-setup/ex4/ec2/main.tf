module "ec2" {
  for_each      = "./ec2"
  source        = each.value["name"]
  component     = each.value ["type"]
  instance_type = each.value ["type"]

}

module "sg" {
  source = "./sg"
}

variable "instances" {
  default = {
    catalogue = {
      name = "catalogue"
      type = "t3.micro"
    }
    user = {
      name = "user"
      type = "t3.small"
    }
  }
}