locals {
  apps      = ["products-database-application", "documents-database-application"]
  databases = setproduct(local.apps, keys(local.instances))
  instances = {
    development = {
      authorized_networks = []
      availability        = "ZONAL"
      backup = {
        enabled                        = false,
        location                       = null,
        point_in_time_recovery_enabled = false,
        retained_backups               = null,
        retention_unit                 = null,
        start_time                     = null,
        transaction_log_retention_days = null
      }
      create_timeout      = "30m"
      deletion_protection = true
      disk_size           = 10
      disk_type           = "PD_SDD"
      flags = [{
        name  = "cloudsql.iam_authentication"
        value = "on"
      }]
      iam_users         = []
      maintenance_day   = 1
      maintenance_hour  = 23
      maintenance_track = "stable"
      name              = "development"
      project           = "aignostics"
      region            = "europe-west1"
      tier              = "db-f1-micro"
      user_labels = {
        team        = "core"
        project     = "data-analytics"
        env         = "development"
        cost-center = "CC-D1000"
      }
      user_name      = "development"
      user_password  = null
      version        = "POSTGRES_14"
      vpc_network    = "vpc-development"
      zone           = "europe-west1-c"
      secondary_zone = null
    }
    production = {
      authorized_networks = []
      availability        = "ZONAL"
      backup = {
        enabled                        = true,
        location                       = "eu",
        point_in_time_recovery_enabled = true,
        retained_backups               = 7,
        retention_unit                 = "COUNT",
        start_time                     = "03:00",
        transaction_log_retention_days = null
      }
      create_timeout      = "30m"
      disk_size           = 10
      disk_type           = "PD_SDD"
      deletion_protection = true
      flags = [{
        name  = "cloudsql.iam_authentication"
        value = "on"
      }]
      iam_users         = []
      maintenance_day   = 5
      maintenance_hour  = 23
      maintenance_track = "stable"
      name              = "production"
      project           = "aignostics"
      region            = "europe-west1"
      tier              = "c3d-standard-8"
      user_labels = {
        team        = "core"
        project     = "data-analytics"
        env         = "production"
        cost-center = "CC-3000"

      }
      user_name      = "production"
      user_password  = null
      version        = "POSTGRES_14"
      vpc_network    = "vpc-production"
      zone           = "europe-west1-c"
      secondary_zone = "europe-west1-b"
    }
    stage = {
      authorized_networks = []
      availability        = "ZONAL"
      backup = {
        enabled                        = false,
        location                       = null,
        point_in_time_recovery_enabled = false,
        retained_backups               = null,
        retention_unit                 = null,
        start_time                     = null,
        transaction_log_retention_days = null
      }
      create_timeout      = "30m"
      disk_size           = 10
      disk_type           = "PD_SDD"
      deletion_protection = true
      flags = [{
        name  = "cloudsql.iam_authentication"
        value = "on"
      }]
      iam_users         = []
      maintenance_day   = 1
      maintenance_hour  = 23
      maintenance_track = "stable"
      name              = "stage"
      project           = "aignostics"
      region            = "europe-west1"
      tier              = "db-f1-micro"
      user_labels = {
        team        = "core"
        project     = "data-analytics"
        env         = "stage"
        cost-center = "CC-2000"

      }
      user_name      = "stage"
      user_password  = null
      vpc_network    = "vpc-stage"
      version        = "POSTGRES_14"
      zone           = "europe-west1-c"
      secondary_zone = null
    }
  }
  sql_databases = {
    for db in local.databases : "${db[0]}-${db[1]}" => {
      name     = db[0]
      instance = db[1]
    }
  }
}