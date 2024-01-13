variable "ami_id" {
  default = "ami-03265a0778a880afb"
  type = string
}

variable "instance_type" {
  default = "t3.micro"
  type = string
}

variable "tags" {
  type = map
}

variable "internet_traffic" {
  default = "0.0.0.0/0"
}