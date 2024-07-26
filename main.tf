terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.51.0"
    }
  }
}

provider "google" {
  project = "polar-office-422517-t9"
  region  = "us-central1"  # Specify the region for resources
}

resource "google_compute_network" "vpc_network" {
  name                    = "terraform-network"
  auto_create_subnetworks = true  # Automatically create default subnetworks
}
