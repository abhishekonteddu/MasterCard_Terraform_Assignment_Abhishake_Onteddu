#Creating route tables

# Default route to igw
resource "aws_route_table" "public_access" {
  vpc_id = aws_vpc.dev_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }
}

# Associate public subnet route through internet gw
resource "aws_route_table_association" "public_route" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public_access.id
}

# Default route to ngw
resource "aws_route_table" "private_access" {
  vpc_id = aws_vpc.dev_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway.id
  }
}

# Associate private subnet route through nat gw
resource "aws_route_table_association" "private_route" {
  subnet_id = aws_subnet.private.id
  route_table_id = aws_route_table.private_access.id
}