# Configure the AWS Provider
provider "aws" {
  region = "ap-southeast-1"

  default_tags {
    tags = {
      environment          = terraform.workspace
      cost_center          = "symbiosis_cost_center"
      app                  = "symbiosis"
      app_owner            = "symbiosis_owner"
      business_criticality = "mission-critical"
      data_classification  = "public"
    }
  }
}

terraform {
  backend "s3" {
    bucket = "govtech-assessment-tfstate"
    key    = "tfstate"
    region = "ap-southeast-1"
  }
}
