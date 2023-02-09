output "address" {
  value = aws_db_instance.example.address
  description = "connect to the database at this endpoint"
  
}

output "port" {
  value = aws_db_instance.example.port
  description = "puerto de la base de datos"
  
}