module "gcp_nginx" {
  source = "../../modules/gcp_vm"

  name = "nginx"
}

module "aws_nginx" {
  source = "../../modules/aws_vm"

  name = "nginx"
}

module "dns" {
  source = "../../modules/cf_dns"

  name = "web"
  ips  = [module.gcp_nginx.public_ip, module.aws_nginx.public_ip]
}
