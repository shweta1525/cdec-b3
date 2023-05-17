output "instance-id" {
  value = aws_instance.web-server.id
  description = "this instamce id"
}

output "instance-private-ip" {
  value = aws_instance.web-server.private_ip
}