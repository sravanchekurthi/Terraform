variable "ami_id" {
  description = "value for ami id"
}

variable "instance_type" {
  description = "value for instance type"
  type = map(string)

  default = {
    "dev" = "t2.micro"
    "stage" = "t2.medium"
    "prod" = "t2.large"
  }
}