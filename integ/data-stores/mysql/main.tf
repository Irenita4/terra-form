provider "aws" {
  region = "us-east-1"
}

terraform {
  backend s3  {
    bucket = "terra-forma-civir-irene"
    key = "integ/data-stores/mysql/terraform.tfstate"
    region = "us-east-1"

    dynamodb_table = "terra-forma-civir-irene-lock"
    encrypt = true
  }  
}

resource "aws_db_instance" "example" {
  engine = "mysql"
  allocated_storage = 10
  instance_class = "db.t2.micro"
  skip_final_snapshot = true
  db_name = "example_database"

  username = var.db_username
  password = var.db_password
}