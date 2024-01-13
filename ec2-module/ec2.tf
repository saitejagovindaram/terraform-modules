resource "aws_instance" "module_practice" {
    ami = var.ami_id
    instance_type = var.instance_type
    vpc_security_group_ids = [ aws_security_group.remote_exec.id ]
    tags = var.tags

    connection {
        type     = "ssh"
        user     = "centos"
        password = "DevOps321"
        host     = self.public_ip
    }

    provisioner "remote-exec" {
        inline = [ 
            "echo I am learning provisioners in Terraform &> /tmp/sample.txt"
         ]
    }
    provisioner "remote-exec" {
        inline = [ 
            "sudo yum install nginx -y",
            "sudo wget https://www.tooplate.com/zip-templates/2136_kool_form_pack.zip",
            "sudo rm -rf /usr/share/nginx/html/*",
            "unzip 2136_kool_form_pack.zip",
            "sudo cp -r 2136_kool_form_pack/* /usr/share/nginx/html/",
            "sudo systemctl start nginx"
         ]
    }
}

resource "aws_security_group" "remote_exec" {
  name = "remote-exec"
  description = "remote-exec"

  ingress {
    description      = "Inboud Traffic"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [ var.internet_traffic ]
  }
  ingress {
    description      = "Inboud Traffic"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = [ var.internet_traffic ]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
        Name = "remote-exec-practice"
    }
}