output "dynamodb_arn" {
  description = "Output of DynamoDB ARN"
  value = aws_dynamodb_table.terraform_locks.arn
}