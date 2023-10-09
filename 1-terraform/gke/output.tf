output "gke" {
  description = "GKE cluster specs"
  sensitive   = true
  value = {
    for cluster, specs in module.gcp-gke : cluster => {
      certificate  = specs.ca_certificate
      cluster_name = specs.name
      endpoint     = specs.endpoint
      location     = specs.location
      region       = specs.region
    }
  }
}