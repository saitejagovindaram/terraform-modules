module "ec2-setup" {
  source = "../ec2-module"
  instance_type = var.instance_type #overriding the existing value of module
  tags = {
    Name = "sample-ec2",
    Terraform = true
  }
}