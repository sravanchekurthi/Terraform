# outputs.tf
output "irsa_role_arn" {
  value = aws_iam_role.irsa.arn
}

output "service_account" {
  value = "${var.namespace}/${var.service_account_name}"
}
