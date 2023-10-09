terraform {
  backend "local" {
    path = "terraform.tfstate"
  }
}

# Google Cloud Storage service can be used as a Terraform backend.