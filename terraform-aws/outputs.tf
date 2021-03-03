output "public_ip" {
  description = "Public IP of instance (or EIP)"
  value       = concat(aws_instance.testInstance.*.public_ip, [""])[0]
}

output "public_dns" {
  description = "List of public DNS names assigned to the instances. For EC2-VPC, this is only available if you've enabled DNS hostnames for your VPC"
  value       = concat(aws_instance.testInstance.*.public_dns, [""])[0]
}

output "tags" {
  description = "List of tags of instances"
  value       = concat(aws_instance.testInstance.*.tags, [""])[0]
}
