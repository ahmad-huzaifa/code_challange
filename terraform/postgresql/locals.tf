locals {
  apps      = ["products-database-application", "documents-database-application"]
  databases = setproduct(local.apps, keys(local.envs))
  envs = {
    development = {
      authorized_networks = []
      availability        = "ZONAL"
      create_timeout      = "30m"
      disk_size           = 10
      disk_type           = "PD_SDD"
      flags = [{
        name  = "cloudsql.iam_authentication"
        value = "on"
      }]
      iam_users     = []
      name          = "development"
      project       = "aignostics"
      region        = "europe-west1"
      tier          = "db-f1-micro"
      user_name     = "dev"
      user_password = null
      version       = "POSTGRES_14"
      vpc_network   = "aignostics-vpc"
      zone          = "europe-west1-c"
    }
    production = {
      authorized_networks = []
      availability        = "ZONAL"
      create_timeout      = "30m"
      disk_size           = 10
      disk_type           = "PD_SDD"
      flags = [{
        name  = "cloudsql.iam_authentication"
        value = "on"
      }]
      iam_users     = []
      name          = "production"
      project       = "aignostics"
      region        = "europe-west1"
      tier          = "db-f1-micro"
      user_name     = "dev"
      user_password = null
      version       = "POSTGRES_14"
      vpc_network   = "aignostics-vpc"
      zone          = "europe-west1-c"
    }
    stage = {
      authorized_networks = []
      availability        = "ZONAL"
      create_timeout      = "30m"
      disk_size           = 10
      disk_type           = "PD_SDD"
      flags = [{
        name  = "cloudsql.iam_authentication"
        value = "on"
      }]
      iam_users     = []
      name          = "stage"
      project       = "aignostics"
      region        = "europe-west1"
      tier          = "db-f1-micro"
      user_name     = "dev"
      user_password = null
      vpc_network   = "aignostics-vpc"
      version       = "POSTGRES_14"
      zone          = "europe-west1-c"
    }
  }
  sql_databases = {
    for db in local.databases : "${db[0]}-${db[1]}" => {
      name     = db[0]
      instance = db[1]
    }
  }
}



#   specs = merge(
#     {
#       authorized_networks = []
#       availability        = "ZONAL"
#       backup = {
#         "enabled"                        = false,
#         "location"                       = null,
#         "point_in_time_recovery_enabled" = false,
#         "retained_backups"               = null,
#         "retention_unit"                 = null,
#         "start_time"                     = null,
#         "transaction_log_retention_days" = null
#       }
#       create_timeout      = "30m"
#       deletion_protection = false
#       disk_size           = 10
#       disk_type           = "PD_SDD"
#       flags = [{
#         name  = "cloudsql.iam_authentication"
#         value = "on"
#       }]
#       iam_users         = []
#       insights          = null
#       labels            = {}
#       maintenance_day   = 5
#       maintenance_hour  = 22
#       maintenance_track = "stable"
#       name              = "testing"
#       project           = "roq-internal-1"
#       read_replicas     = []
#       region            = "europe-west1"
#       tier              = "db-f1-micro"
#       users             = {}
#       user_name         = "roq"
#       user_password     = null
#       version           = "POSTGRES_14"
#       zone              = "europe-west1-c"
#       roles             = "cloudsqlsuperuser"
#     },
#     var.specs