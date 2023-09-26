module "vpc" {
  source  = "terraform-google-modules/network/google"
  version = "~> 7.3"

  project_id   = "aignostics"
  network_name = "aignostics-vpc"
  routing_mode = "GLOBAL"

  subnets = [
    {
      subnet_name   = "subnet-dev"
      subnet_ip     = "10.10.10.0/24"
      subnet_region = "europe-west1"
    },
    {
      subnet_name   = "subnet-stage"
      subnet_ip     = "10.10.20.0/24"
      subnet_region = "europe-west1"
      # subnet_private_access = "true"
      # subnet_flow_logs      = "true"
      # description           = "This subnet has a description"
    },
    {
      subnet_name   = "subnet-prod"
      subnet_ip     = "10.10.30.0/24"
      subnet_region = "europe-west1"
      # subnet_flow_logs          = "true"
      # subnet_flow_logs_interval = "INTERVAL_10_MIN"
      # subnet_flow_logs_sampling = 0.7
      # subnet_flow_logs_metadata = "INCLUDE_ALL_METADATA"
    }
  ]

  secondary_ranges = {
    subnet-dev = [
      {
        range_name    = "subnet-dev-secondary-pods"
        ip_cidr_range = "10.64.0.0/16"
      },
      {
        range_name    = "subnet-dev-secondary-services"
        ip_cidr_range = "10.62.0.0/20"
      },
    ]
    subnet-stage = [
      {
        range_name    = "subnet-stage-secondary-pods"
        ip_cidr_range = "10.63.0.0/16"
      },
      {
        range_name    = "subnet-stage-secondary-services"
        ip_cidr_range = "10.61.0.0/20"
      },
    ]
    subnet-prod = [
      {
        range_name    = "subnet-prod-secondary-pods"
        ip_cidr_range = "10.58.0.0/16"
      },
      {
        range_name    = "subnet-prod-secondary-services"
        ip_cidr_range = "10.57.0.0/20"
      },
    ]
  }

  # routes = [
  #     {
  #         name                   = "egress-internet"
  #         description            = "route through IGW to access internet"
  #         destination_range      = "0.0.0.0/0"
  #         tags                   = "egress-inet"
  #         next_hop_internet      = "true"
  #     },
  #     {
  #         name                   = "app-proxy"
  #         description            = "route through proxy to reach app"
  #         destination_range      = "10.50.10.0/24"
  #         tags                   = "app-proxy"
  #         next_hop_instance      = "app-proxy-instance"
  #         next_hop_instance_zone = "us-west1-a"
  #     },
  # ]
}