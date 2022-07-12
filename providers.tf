terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 4.0"
    }
  }

  backend "s3" {
    bucket = "angel-lozano-estados-0f10b34"
    key    = "estados/angel-github"
    region = "us-east-1"
  }
}

# Configure the GitHub Provider
provider "github" {
  owner = var.organizacion

}


