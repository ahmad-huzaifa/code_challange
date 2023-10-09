output "instances" {
  description = "Postgresql instances specs"
  sensitive   = true
  value = {
    for instances, specs in module.postgresql : instances => {
      name       = specs.instance_name
      connection = specs.instance_connection_name
      ip_address = specs.public_ip_address
    }
  }
}
