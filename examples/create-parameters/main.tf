# Example of how to create the parameters only

# Provision Intel Optimized AWS MSSQL server
module "aws-postgresql-parameter-group" {
  #source = "intel/terraform-intel-aws-postgresql-parameter/intel"
  source = "../../"
}
