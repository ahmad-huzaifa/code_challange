locals {

  clusters = {

    development = {
      ip_range_pods            = "subnet-dev-secondary-pods"
      ip_range_services        = "subnet-dev-secondary-services"
      kubernetes_version       = "1.27.3-gke.100"
      master_ipv4_cidr_block   = "10.60.0.0/28"
      name                     = "cluster-dev"
      network                  = "aignostics-vpc"
      project_id               = "aignostics"
      release_channel          = null
      remove_default_node_pool = true
      subnetwork               = "subnet-dev"
      zones                    = ["europe-west1-c"]

      node_pools = [
        {
          auto_repair        = true
          auto_upgrade       = false
          autoscaling        = false
          disk_size_gb       = 120
          image_type         = "COS_CONTAINERD"
          initial_node_count = 0
          machine_type       = "e2-custom-10-24576"
          max_pods_per_node  = 110
          name               = "node-dev"
          node_count         = 2
          node_locations     = "europe-west1-c"
          preemptible        = false
          spot               = true
          version            = "1.27.3-gke.100"
        }
      ]
    }
    production = {
      ip_range_pods            = "subnet-prod-secondary-pods"
      ip_range_services        = "subnet-prod-secondary-services"
      kubernetes_version       = "1.27.3-gke.100"
      master_ipv4_cidr_block   = "10.59.0.0/28"
      name                     = "cluster-prod"
      network                  = "aignostics-vpc"
      project_id               = "aignostics"
      regional                 = false
      release_channel          = null
      remove_default_node_pool = true
      subnetwork               = "subnet-prod"
      zones                    = ["europe-west1-c"]

      node_pools = [
        {
          auto_repair        = true
          auto_upgrade       = false
          autoscaling        = false
          disk_size_gb       = 120
          image_type         = "COS_CONTAINERD"
          initial_node_count = 3
          machine_type       = "e2-custom-10-24576"
          max_pods_per_node  = 110
          name               = "node-prod"
          node_count         = 3
          node_locations     = "europe-west1-c"
          preemptible        = false
          spot               = true
          version            = "1.27.3-gke.100"
        }
      ]
    }
    stage = {
      ip_range_pods            = "subnet-stage-secondary-pods"
      ip_range_services        = "subnet-stage-secondary-services"
      kubernetes_version       = "1.27.3-gke.100"
      master_ipv4_cidr_block   = "10.56.0.0/28"
      name                     = "cluster-stage"
      network                  = "aignostics-vpc"
      project_id               = "aignostics"
      regional                 = false
      release_channel          = null
      remove_default_node_pool = true
      subnetwork               = "subnet-stage"
      zones                    = ["europe-west1-c"]

      node_pools = [
        {
          auto_repair        = true
          auto_upgrade       = false
          autoscaling        = false
          disk_size_gb       = 120
          image_type         = "COS_CONTAINERD"
          initial_node_count = 0
          machine_type       = "e2-custom-10-24576"
          max_pods_per_node  = 110
          name               = "node-stage"
          node_count         = 2
          node_locations     = "europe-west1-c"
          preemptible        = false
          spot               = true
          version            = "1.27.3-gke.100"
        }
      ]
    }

  }

}