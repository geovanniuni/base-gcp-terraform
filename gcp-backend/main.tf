terraform {
  #############################################################
  ## AFTER RUNNING TERRAFORM APPLY (WITH LOCAL BACKEND)
  ## YOU WILL UNCOMMENT THIS CODE THEN RERUN TERRAFORM INIT
  ## TO SWITCH FROM LOCAL BACKEND TO REMOTE AWS BACKEND
  #############################################################

  # It needs to be hard coded the configuration of the backend.

    # backend "gcs" {
    #   bucket = "base-gcp-terraform-geo"
    #   prefix = "terraform/backend-resource"
    #   #prefix            = "${var.bucket_prefix}/terraform.tfstate"
    # }


  # Backend load early so it won't work in this way, only workspace can be used or other ways.

  # backend "gcs" {
  #   bucket            = "${var.bucket_name}" # REPLACE WITH YOUR BUCKET NAME
  #   prefix            = "${var.bucket_prefix}"
  #   #prefix            = "${var.bucket_prefix}/terraform.tfstate"
  # }

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~>3.0"
    }
  }
}

# gcloud init 
# gcloud auth application-default login 
# billing

provider "google" {
  region  = var.gcp_region
  project = var.gcp_project
}


# remote bucket
# Be careful and don't destroy this resource. (remote backend)
# terraform destroy

resource "google_storage_bucket" "terraform_state" {
  name          = var.bucket_name 
  location      = var.bucket_location
  force_destroy = true

  uniform_bucket_level_access = true

  #public_access_prevention = "enforced"

  versioning {
    enabled = true
  }
}
