resource "aws_security_group" "sg1" {
  name        = "my-security-group"
  description = "Allow All Traffic"
  vpc_id      = var.vpc_id

  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}
resource "aws_instance" "example" {
  instance_type = var.instance_type
  key_name = var.key_name
  vpc_security_group_ids = ["aws_security_group.sg1.id"]
  ami = var.ami_id
  
}
