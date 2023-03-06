variable "d1" {
  default = [
    {
      course_name  = "aws"
      trainer_name = "raju"
    },
    {
      course_name  = "devops"
      trainer_name = "ravi"
    }
  ]
}

output "course_names" {
  value = var.d1.*.course_name
}