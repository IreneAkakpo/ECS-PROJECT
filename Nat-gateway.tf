# Create Elastic IP (AZ-1)
resource "aws_eip" "ECS-EIP" {
  vpc = var.EIP
}


# Create NAT gateway 1 (AZ-1)
resource "aws_nat_gateway" "Nat-gateway" {
  allocation_id = aws_eip.ECS-EIP.id
  subnet_id     = aws_subnet.public-sub1.id

  tags = {
    Name = var.environment_name
  }
}



# Associating NAT gateway 1 with private route table
resource "aws_route" "Nat-association" {
  route_table_id         = aws_route_table.private-route-table.id
  nat_gateway_id         = aws_nat_gateway.Nat-gateway.id
  destination_cidr_block = "0.0.0.0/0"
}

