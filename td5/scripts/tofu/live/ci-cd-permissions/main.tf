provider "aws" {
  region = "us-east-2"
}

module "oidc_provider" {
  source = "github.com/ailerua81/devops_TD//td5/scripts/tofu/modules/github-aws-oidc"

  provider_url = "https://token.actions.githubusercontent.com" 

}

module "iam_roles" {
  source = "github.com/ailerua81/devops_TD//td5/scripts/tofu/modules/gh-actions-iam-roles"

  name              = "lambda-sample"                           
  oidc_provider_arn = module.oidc_provider.oidc_provider_arn    

  enable_iam_role_for_testing = true                            

  # TODO: fill in your own repo name here!
  github_repo      = "ailerua81/devops_TD" 
  lambda_base_name = "lambda-sample"                            

  enable_iam_role_for_plan  = true                                
  enable_iam_role_for_apply = true                                

  # TODO: fill in your own bucket and table name here!
  tofu_state_bucket         = "devops_td5_bucket_name" 
  tofu_state_dynamodb_table = "devops_td5_dynamodb_table" 
}
