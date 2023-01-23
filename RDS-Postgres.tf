# Postgres RDS
# Create database subnet group

resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = var.rds_subnet_group_name
  subnet_ids = [aws_subnet.private-sub1.id, aws_subnet.private-sub2.id]

  tags = {
    Name = var.environment_name
  }
}


resource "aws_db_instance" "ECS-Postgres-DB" {
  allocated_storage = var.rds_allocated_storage
  /* db_name             = var.rds_db_name */
  engine                 = "postgres"
  engine_version         = var.rds_engine_version
  instance_class         = var.rds_instance_class
  username               = var.rds_username
  password               = var.rds_password
  storage_type           = var.rds_storage_type
  publicly_accessible    = var.rds_publicly_accessible
  vpc_security_group_ids = [aws_security_group.DB-SG.id]
  skip_final_snapshot    = var.rds_skip_final_snapshot
  db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.id
  multi_az               = var.multi-az-deployment
  tags = {
    name = var.environment_name
  }
}


# other parameters that could be included
#parameter_group_name = "default.mysql5.7"
# vpc_id