# irsa-oidc.tf
data "tls_certificate" "oidc" {
  url = data.aws_eks_cluster.this.identity[0].oidc[0].issuer
}

resource "aws_iam_openid_connect_provider" "eks" {
  url = data.aws_eks_cluster.this.identity[0].oidc[0].issuer

  client_id_list = ["sts.amazonaws.com"]

  # The root CA thumbprint for the OIDC issuer. Using the first certificate commonly works for EKS.
  thumbprint_list = [data.tls_certificate.oidc.certificates[0].sha1_fingerprint]
}

locals {
  oidc_issuer     = data.aws_eks_cluster.this.identity[0].oidc[0].issuer
  oidc_hostpath   = replace(local.oidc_issuer, "https://", "")
  sa_sub          = "system:serviceaccount:${var.namespace}:${var.service_account_name}"
  sa_aud          = "sts.amazonaws.com"
}
