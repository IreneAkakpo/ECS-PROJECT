# Public route table
resource "aws_route_table" "public-route-table" {
  vpc_id = aws_vpc.ECS-VPC.id

  tags = {
    Name = var.environment_name
  }
}


# Private route table 
resource "aws_route_table" "private-route-table" {
  vpc_id = aws_vpc.ECS-VPC.id

  tags = {
    Name = var.environment_name
  }
}


# Public route table associations
resource "aws_route_table_association" "public-route-table-association" {
  subnet_id      = aws_subnet.public-sub1.id
  route_table_id = aws_route_table.public-route-table.id
}

resource "aws_route_table_association" "public-route-table-association-2" {
  subnet_id      = aws_subnet.public-sub2.id
  route_table_id = aws_route_table.public-route-table.id
}


# Private route table association 
resource "aws_route_table_association" "private-route-table1-association" {
  subnet_id      = aws_subnet.private-sub1.id
  route_table_id = aws_route_table.private-route-table.id
}

resource "aws_route_table_association" "private-route-table1-association-2" {
  subnet_id      = aws_subnet.private-sub2.id
  route_table_id = aws_route_table.private-route-table.id
}
