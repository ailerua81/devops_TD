provider "aws" {
  region = "us-east-2"
}

module "state" {
  source = "github.com/ailerua81/devops_TD//td5/scripts/tofu/modules/state-bucket"

  # TODO: fill in your own bucket name!
  name = "devops_td5_bucket_name"
}