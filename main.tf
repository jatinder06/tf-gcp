terraform {
    backend "gcs" { 
      bucket  = "tf-state-bknd"
      prefix  = "prod"
    }
}

provider "google" {
  project = var.project
  region = var.region
}
locals {
    labels = {
        "data-project" = var.data-project
    }
}

resource "google_storage_bucket" "raw" {
  project = var.project
  name = "test-tf-raw"
  force_destroy = false
  uniform_bucket_level_access = true
  location = var.region
  labels = local.labels
}

