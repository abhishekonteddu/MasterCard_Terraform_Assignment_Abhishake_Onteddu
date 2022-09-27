# ELB dns names
output "lb_hostname_http" {
  value = aws_elb.web_server.dns_name
}