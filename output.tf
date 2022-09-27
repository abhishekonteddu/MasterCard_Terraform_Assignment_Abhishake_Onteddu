# ELB dns names
output "lb_hostname" {
  value = module.web_server.lb_hostname_http
}