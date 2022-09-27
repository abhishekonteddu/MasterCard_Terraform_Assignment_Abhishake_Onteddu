module "web_server" {
    source          = "./modules/aws-web-server"

    vpc_cidr        = var.vpc_cidr
    private_subnet  = var.private_subnet
    public_subnet   = var.public_subnet
    autoscaling_web = var.autoscaling_web
    ssh_public_key  = var.ssh_public_key
}