variable "db_username" {
  description = "nombre de usario de la BBDD"
  type = string
  sensitive = true
  }

variable "db_password" {
  description = "contraseña de la bbdd"
  type = string
  sensitive = true
}