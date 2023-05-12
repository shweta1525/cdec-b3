provider "aws" {
  region = "us-east-2b"
}

resource "aws_instance" "web" {
    ami = "ami-083eed19fc801d7a4"
    instance_type = "t2.micro"
    associate_public_ip_address = true
    key_name = "ohio-key"
    security_groups = ["k8s-sg"]

    ebs_block_device {
      device_name = "/dev/sdf"
      volume_size = 10
      volume_type = "gp2"
    }

     tags = {
    Name = "my-tf-server"
  }



}