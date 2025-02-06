terraform {
  backend "s3" {
    # TODO: fill in your own bucket name here!
    bucket         = "devops_td5_bucket_name" 
    key            = "td5/scripts/tofu/live/tofu-state"          
    region         = "us-east-2"                         
    encrypt        = true                                
    # TODO: fill in your own DynamoDB table name here!
    dynamodb_table = "ap-devops-td5-dynamodb-table" 
  }
}
