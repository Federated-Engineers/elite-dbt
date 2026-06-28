terraform {
  backend "s3" {
    bucket = "federated-engineers-production-elite-angel-city-tfstate"
    key    = "angel-city/production/terraform.tfstate"
    region = "eu-central-1"
  }
}
