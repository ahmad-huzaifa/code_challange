resource "google_sql_database" "database" {
  for_each = local.sql_databases
  name     = each.value.name
  instance = each.value.instance

  depends_on = [module.postgresql]
}