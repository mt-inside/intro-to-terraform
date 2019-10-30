provider "google" {
  version = "~> 2"

  project = var.gcp_project_id
  region  = "europe-west1"
  zone    = "europe-west1-c"
}

provider "cloudflare" {
  version = "~> 2"

  api_token = var.cf_api_token
}

provider "aws" {
  version = "~> 2"

  region = "eu-west-1"
}
