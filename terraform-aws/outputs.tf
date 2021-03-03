output "public_ip" {
  description = "Public IP of instance (or EIP)"
  value       = concat(aws_instance.testInstance.*.public_ip, [""])[0]
}
