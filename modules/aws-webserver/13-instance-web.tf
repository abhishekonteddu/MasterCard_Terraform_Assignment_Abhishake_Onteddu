# Create load balancer
resource "aws_elb" "web_server" {
  name    = "web-server-lb"
  subnets = [aws_subnet.public.id]
  security_groups = [aws_security_group.web_elb.id]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 30
  }
  tags = {
    Name = "web-server-lb"
  }
}

# Create autoscaling group
resource "aws_autoscaling_group" "web_server" {
  name                      = "web-server-asg"
  max_size                  = var.autoscaling_web["max_size"]
  min_size                  = var.autoscaling_web["min_size"]
  desired_capacity          = var.autoscaling_web["desired_capacity"]
  health_check_type         = "ELB"
  default_cooldown          = "30"
  health_check_grace_period = "120"
  force_delete              = true
  launch_configuration      = aws_launch_configuration.web_server.name
  load_balancers            = [aws_elb.web_server.name]
  termination_policies      = ["OldestLaunchConfiguration"]
  vpc_zone_identifier       = [aws_subnet.private.id]
}

# Configure instance launching configuration
resource "aws_launch_configuration" "web_server" {
  name_prefix   = "web_server"
  image_id      = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  key_name      = aws_key_pair.ssh_public_key.key_name
  security_groups = [
    aws_security_group.web.id,
  ]
  user_data = file("${path.module}/scripts/web_server_install.sh")
  ebs_block_device {
    device_name = "/dev/sdb"
    volume_size = "10"
  }
}

