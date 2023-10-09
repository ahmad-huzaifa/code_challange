module "gcp-gke" {
  for_each = local.clusters

  source  = "terraform-google-modules/kubernetes-engine/google//modules/beta-private-cluster"
  version = "28.0.0"

  ip_range_pods            = each.value.ip_range_pods
  ip_range_services        = each.value.ip_range_services
  kubernetes_version       = each.value.kubernetes_version
  master_ipv4_cidr_block   = each.value.master_ipv4_cidr_block
  name                     = each.value.name
  network                  = each.value.network
  project_id               = each.value.project_id
  regional                 = each.value.regional
  release_channel          = each.value.release_channel
  remove_default_node_pool = each.value.remove_default_node_pool
  subnetwork               = each.value.subnetwork
  zones                    = each.value.zones
  node_pools               = each.value.node_pools
}