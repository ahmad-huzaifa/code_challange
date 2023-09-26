resource "google_sql_database" "database" {
  for_each = local.database
  name     = var.db_name
  instance = var.instance_name
}