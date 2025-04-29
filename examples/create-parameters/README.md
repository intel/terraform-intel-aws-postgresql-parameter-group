<p align="center">
  <img src="https://github.com/intel/terraform-intel-aws-postgresql-parameter-group/blob/main/images/logo-classicblue-800px.png?raw=true" alt="Intel Logo" width="250"/>
</p>

# Intel® Optimized Cloud Modules for Terraform

© Copyright 2025, Intel Corporation

## AWS RDS PostgreSQL Parameters Group

This module by itself will create the parameters group in RDS that will bring in the Intel Optimizations.  You will use this module in conjunction with your curent AWS RDS PostgreSQL module.    For testing purposes you can utilize this example to create the parameters group to test it out.   

## Usage

main.tf
```hcl
# Provision Intel Optimized AWS PostgreSQL server
module "aws-postgresql-parameter-group" {
  source = "intel/aws-postgresql-paramter-group/intel"
}
```

Run Terraform

```hcl
terraform init  
terraform plan
terraform apply 
```

## Considerations
