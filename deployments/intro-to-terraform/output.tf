output "gcp_vm_ip" {
  value = module.gcp_nginx.public_ip
}

output "aws_vm_ip" {
  value = module.aws_nginx.public_ip
}
