# Instance Security groups

# Default administration port
resource "aws_security_group" "administration" {
  name        = "administration"
  description = "Allow default administration service"
  vpc_id      = aws_vpc.dev_vpc.id
  tags = {
    Name = "administration"
  }

  # Open ssh port
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow icmp
  ingress {
    from_port   = 8
    to_port     = 0
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Open access to public network
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Open web ports for instance
resource "aws_security_group" "web" {
  name        = "web"
  description = "Allow web ingress trafic"
  vpc_id      = aws_vpc.dev_vpc.id
  tags = {
    Name = "web"
  }

  # Open ssh port only from bastion
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    security_groups = [aws_security_group.administration.id]
  }

  # http port
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    security_groups = [aws_security_group.web_elb.id]
  }

  # Open access to public network via nat gw
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Open web ports for load balancer
resource "aws_security_group" "web_elb" {
  name        = "web_elb"
  description = "Allow elb ingress trafic"
  vpc_id      = aws_vpc.dev_vpc.id
  tags = {
    Name = "web_elb"
  }

  # http port
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}