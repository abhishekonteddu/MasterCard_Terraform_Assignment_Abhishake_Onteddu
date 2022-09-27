# Terraform AWS web server module

This script is used to create a VPC with 2 subnets. Web servers created in private subnet, and loadbalancers use public subnet.
All the internet bound traffic for private instances go through nat instances.
Incoming traffic to webservers is through loadbalancer backed by auto scaling group running apache2 web server.

### This module will create:
-   1 vpc
-   2 subnet
    -   1 private
    -   1 public
-   2 web servers (under autoscaling group)
-   1 load balancer
-   2 security groups
-   1 Nat instance
-   1 Internet gateway

### Directory for module and manifest using it

```
.
├── README.md
├── main.tf
├── modules
│   └── aws-web-server
│       ├── 01-network.tf
│       ├── 02-routing-table.tf
│       ├── 03-security-group.tf
│       ├── 11-ssh-key.tf
│       ├── 12-ami.tf
│       ├── 13-instance-web.tf
│       ├── outputs.tf
│       ├── scripts
│       │   └── web_server_install.sh
│       ├── variables.tf
│       └── versions.tf
├── output.tf
├── variables.tf
└── versions.tf
```

### Steps to execute
#### Export aws secrets or use aws configure to set creds
```
export AWS_DEFAULT_REGION=us-east-1
export AWS_SECRET_ACCESS_KEY=xxxxxxxxxxxx
export AWS_ACCESS_KEY_ID=xxxxxxxxxxxx
```

### Create stack

```
terraform init
terraform validate
terraform plan
terraform apply
```

### Delete stack

```
terraform destroy
```
