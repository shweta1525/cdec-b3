provider "aws" {
  region  = "us-west-2"
}

resource "aws_instance" "web" {
  ami           = "ami-830c94e3"
  instance_type = "t2.micro"
  key_name = "ohio-key"
  security_groups = [ "k8s-sg" ]
  ebs_block_device {
    volume_size = 10
    volume_type = "gp2"
    device_name = "/dev/sdf"
  }

  tags = {
    Name = "my-tf-server"
  }
}