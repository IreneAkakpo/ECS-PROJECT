# Internet gateway
resource "aws_internet_gateway" "ECS-IGW" {
  vpc_id = aws_vpc.ECS-VPC.id

  tags = {
    Name = var.environment_name
  }
}

# AWS Route IGW-Public route table
resource "aws_route" "ECS-igw-association" {
  route_table_id         = aws_route_table.public-route-table.id
  gateway_id             = aws_internet_gateway.ECS-IGW.id
  destination_cidr_block = "0.0.0.0/0"
}