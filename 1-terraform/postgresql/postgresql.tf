module "postgresql" {
  for_each = local.instances

  source  = "GoogleCloudPlatform/sql-db/google//modules/postgresql"
  version = "16.1.0"

  availability_type    = each.value.availability
  backup_configuration = each.value.backup
  create_timeout       = each.value.create_timeout
  database_flags       = each.value.flags
  database_version     = each.value.version
  deletion_protection  = each.value.deletion_protection
  disk_autoresize      = true
  disk_size            = each.value.disk_size
  disk_type            = each.value.disk_type
  enable_default_db    = false
  enable_default_user  = true
  ip_configuration = {
    allocated_ip_range  = null
    authorized_networks = each.value.authorized_networks
    ipv4_enabled        = true
    private_network     = "projects/${each.value.project}/global/networks/${each.value.vpc_network}"
    require_ssl         = null
  }
  maintenance_window_day          = each.value.maintenance_day
  maintenance_window_hour         = each.value.maintenance_hour
  maintenance_window_update_track = each.value.maintenance_track
  name                            = each.value.name
  project_id                      = each.value.project
  region                          = each.value.region
  tier                            = each.value.tier
  user_labels                     = each.value.user_labels
  zone                            = each.value.zone
  secondary_zone                  = each.value.secondary_zone
}


