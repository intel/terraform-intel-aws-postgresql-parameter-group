<p align="center">
  <img src="https://github.com/intel/terraform-intel-aws-postgresql-parameter-group/blob/main/images/logo-classicblue-800px.png?raw=true" alt="Intel Logo" width="250"/>
</p>

# Intel® Optimized Cloud Modules for Terraform

© Copyright 2025, Intel Corporation

## AWS RDS MySQL Parameters Group

This example module will create a PostgreSQL RDS instance with the parameters group in RDS that will bring in the Intel Optimizations.  


## Usage
main.tf

```hcl
db_password

# Provision Intel Optimized AWS MySQL server

module "aws-postgresql-parameter-group" {
  source           = "intel/terraform-intel-aws-postgresql-parameter-group/intel"  
  }

# Example of how to pass variable for database password:
# terraform apply -var="db_password=..."

resource "aws_db_instance" "example" {
  identifier                = "my-postgresql-db"
  engine                    = "postgres"
  engine_version       = "14.15" # Changing from 14.07 from 14.15
  instance_class       = "db.m7i.large"
  allocated_storage         = 20
  storage_type              = "gp2"
  publicly_accessible       = false
  db_subnet_group_name      = aws_db_subnet_group.example.name
  vpc_security_group_ids    = [aws_security_group.example.id]
  name                      = "testpostgresql"
  username                  = "myusername"
  password                  = "var.db_password"
  parameter_group_name      = "default.postgres13"
}
```


Run Terraform

```hcl
export TF_VAR_db_password ='<USE_A_STRONG_PASSWORD>'

terraform init  
terraform plan
terraform apply 
```

## Considerations
