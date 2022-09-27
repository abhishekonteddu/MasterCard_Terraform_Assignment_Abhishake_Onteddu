
# VPC CIDR
variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

# Private Subnet CIDR
variable "private_subnet" {
  default = {
    subnet_name = "private_subnet"
    cidr        = "10.0.0.0/23"
  }
}

# Public Subnet CIDR
variable "public_subnet" {
  default = {
    subnet_name = "public_subnet"
    cidr        = "10.0.128.0/23"
  }
}

# ASG Vars
variable "autoscaling_web" {
  default = {
    desired_capacity = "2"
    max_size         = "5"
    min_size         = "2"
  }
}

variable  "ssh_public_key" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDHdwwZrc1J54xuYqdu8m3xTZ8jr6Vimn0DBdpud2yQa9ZLdLED6Glj4tq0dmUdsUs5fpJuOPejetQxb7VJLZZ3xQyxJPfGbU5JCkP7W+8M80KISrGF3zNatOf0H2CBiwio2LQXi1K1vBZPIUy54Wv6trjWlwkBCtBjpBPzC6KvBrFzTHYiOrFdB/h0NwfUlH9EX3cunfkHFz5edieG7qzGhFD61hOlEBJTJ1Ag7peA5K9YOQRQJhVON2++kFVrCZvyy0uT2AmPJblV7/nGOGy3K6cc7gAN1CaSwXfIhaqpka/7RMKakmsnFrgt+JF+XHCR6flNxZzLcPl1QofS7krr1q8JDpIk5ykIZr+g7zLsLE+j2E7L0UwZz9/XiPmaezrrZp8A0Bpp6cGAPbiOm30yDbRuLKSIlEDfj9Iw6rqi0rwEqH/bpcHPfHLwwuokZ/ZIMeWkycNCEGIT9vwDCMIShCkgDadjNrI6I6EsPRkVYlwvvcimrX0bwzQY1cBAS4c= sarathkumark@Saraths-MacBook-Pro.loca"
}