# Provision Intel Optimized AWS MySQL server

module "aws-postgresql-parameter-group" {
#  source = "intel/terraform-intel-aws-postgresql-parameter/intel"
  source = "../.."
}

# Example of how to pass variable for database password:
# terraform apply -var="db_password=..."
/*
resource "aws_db_instance" "example" {
  identifier                = "my-postgresql-db"
  engine                    = "postgres"
  engine_version            = "14.7"
  instance_class            = "db.m6i.large"
  allocated_storage         = 20
  storage_type              = "io1"
  publicly_accessible       = false
  db_subnet_group_name      = aws_db_subnet_group.example.name
  vpc_security_group_ids    = [aws_security_group.example.id]
  name                      = "testpostgresql"
  username                  = "myusername"
  password                  = var.db_password
  parameter_group_name      = module.aws-postgresql-parameter-group.db_parameter_group_name
} */

resource "aws_db_instance" "postgresql" {
  allocated_storage    = 10
  db_name              = "testpostgresqlrds"
  identifier           = "postgresql-intel-optimized"
  engine               = "postgres"
  engine_version       = "14.7"
  instance_class       = "db.m6i.large"
  username             = "admin25"
  password             = "var.db_password"
  parameter_group_name = module.aws-postgresql-parameter-group.db_parameter_group_name
  skip_final_snapshot  = true
}