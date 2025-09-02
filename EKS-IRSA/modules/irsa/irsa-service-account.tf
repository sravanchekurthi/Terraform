# irsa-service-account.tf
resource "kubernetes_namespace" "ns" {
  metadata {
    name = var.namespace
  }
}

resource "kubernetes_service_account" "sa" {
  metadata {
    name      = var.service_account_name
    namespace = kubernetes_namespace.ns.metadata[0].name
    annotations = {
      "eks.amazonaws.com/role-arn" = aws_iam_role.irsa.arn
    }
    labels = {
      "app.kubernetes.io/name" = var.service_account_name
    }
  }
  automount_service_account_token = true
}
