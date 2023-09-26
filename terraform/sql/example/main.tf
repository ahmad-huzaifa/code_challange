module "database" {
  for_each = local.apps

  source        = "../"
  db_name       = each.value.database_name
  instance_name = each.value.instance_name
}

locals {
  apps = {
    products = {
      name          = "products_database_application"
      database_name = "products_db"
      instance_name = "dev-products"
    }
    documents = {
      name          = "documents_database_application"
      database_name = "documents_db"
      instance_name = "dev-products"
    }
  }
}