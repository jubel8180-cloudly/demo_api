# defined aws provider
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

variable "region"{
  default = "ap-south-1"
}

provider "aws" {
  region = var.region
#   access_key = "provide_your_access_key" 
#   secret_key = "provide_your_secret_key"
}


data "archive_file" "make_go_archive_dlq" {
  type        = "zip"
  source_file = "${path.module}./cmd/main"
  output_path = "${path.module}./cmd/main.zip"
}

# this lambda function for receiving event from dead letter queue
resource "aws_lambda_function" "receive_msg_from_dlq" {

  filename      = "${path.module}./cmd/main.zip"
  function_name = "my-function-from-action"
  role          = "arn:aws:iam::115391213665:role/lambda-execution-role-s3-access"
  handler       = "main"

  # source_code_hash = filebase64sha256("${path.module}./../lambda/sqs/receive_msg_from_dlq/main.zip")
  source_code_hash = "${data.archive_file.make_go_archive_dlq.output_base64sha256}"


  runtime = "go1.x"


}