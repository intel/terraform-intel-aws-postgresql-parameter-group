# Provision Intel Optimized AWS MySQL server

module "aws-postgresql-parameter-group" {
  source = "intel/terraform-intel-aws-postgresql-parameter/intel"
}

# Example of how to pass variable for database password:
# terraform apply -var="db_password=..."

resource "aws_db_instance" "postgresql" {
  allocated_storage    = 10
  db_name              = "postgresdb"
  identifier           = "postgresql-intel-optimized"
  engine               = "postgres"
  engine_version       = "14.7"
  instance_class       = "db.m6i.large"
  username             = "admin25"
  password             = "var.db_password"
  parameter_group_name = module.aws-postgresql-parameter-group.db_parameter_group_name
  skip_final_snapshot  = true
}