variable "db_name" {
    default = "test"
    description = "Name of the database"
    type = string
  }

variable "instance_name" {
    description = "Name of the sql instance"
    default = "db-1"
    type = string
}