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
  region  = "us-central1"
}

resource "google_cloudfunctions_function" "my_function" {
  name        = "my-cloud-function"
  runtime     = "python310"
  entry_point = "hello_world"
  available_memory_mb = 256

  source_archive_bucket = "bucket251094"
  source_archive_object = "function-source.zip"

  trigger_http = true

  environment_variables = {
    EXAMPLE_ENV_VAR = "example-value"
  }

  labels = {
    environment = "production"
  }

  timeout = 540s
}
