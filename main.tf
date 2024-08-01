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
  description = "A simple Cloud Function"
  runtime     = "python310"  # Specify the runtime, e.g., python310
  entry_point = "hello_world" # The function to execute within your code
  available_memory_mb = 256  # Optional: Memory allocation

  source_archive_bucket = "bucket251094"  # The name of the bucket with your code
  source_archive_object = "function-source.zip" # The zip file with your code

  trigger_http = true  # HTTP trigger for the function

  environment_variables = {
    EXAMPLE_ENV_VAR = "example-value"
  }

  labels = {
    environment = "production"
  }

  timeout = "540s" # Optional: Set a timeout for the function
}
