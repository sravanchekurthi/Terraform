output "dynamodb_table" {
  value = aws_dynamodb_table.terraform_lock.name
}