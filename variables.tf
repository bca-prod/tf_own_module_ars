# own remote-backend variables
variable "backend_s3_bucket_name" {
  description = "AWS S3 Bucket Name"
  type        = string
  default     = "tfstate-ym-bucket"
}

variable "backend_dynamodb_table_name" {
  description = "AWS DynamoDB Table Name"
  type        = string
  default     = "aws-dynamodb-backend-tfstate"
}