variable "project_name" {
  description = "Name of the overall project used for naming AWS resources"
  type        = string
  default     = "ecommerce-aws"
}

variable "region" {
  description = "AWS region to deploy the infrastructure in"
  type        = string
  default     = "us-east-1"
}

variable "jwt_secret" {
  description = "JWT secret key used by the Lambda function for authentication"
  type        = string
  default     = "my-secret-key"  # يُفضّل تغييره أو تمريره في terraform.tfvars
}
