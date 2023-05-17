resource "aws_security_group" "sg15" {
  name        = "terraform-sg"
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
resource "aws_instance" "web-server" {
  ami = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.sg15.id]
  key_name = var.key_name


}

output "instance-id" {
  value = aws_instance.web-server.id
  description = "this instamce id"
}

output "instance-private-ip" {
  value = aws_instance.web-server.private_ip
