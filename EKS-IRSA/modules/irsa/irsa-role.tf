# irsa-role.tf
data "aws_iam_policy_document" "assume_role" {
  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]
    principals {
      type        = "Federated"
      identifiers = [aws_iam_openid_connect_provider.eks.arn]
    }
    condition {
      test     = "StringEquals"
      variable = "${local.oidc_hostpath}:sub"
      values   = [local.sa_sub]
    }
    condition {
      test     = "StringEquals"
      variable = "${local.oidc_hostpath}:aud"
      values   = [local.sa_aud]
    }
  }
}

resource "aws_iam_role" "irsa" {
  name               = "irsa-${var.cluster_name}-${var.namespace}-${var.service_account_name}"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
  description        = "IRSA role for ${var.cluster_name}/${var.namespace}/${var.service_account_name}"
}

# Example least-privilege inline policy: read-only access to a single S3 bucket
data "aws_iam_policy_document" "s3_readonly_bucket" {
  statement {
    sid     = "ListBucket"
    actions = ["s3:ListBucket"]
    resources = [
      "arn:aws:s3:::${var.s3_bucket_name}"
    ]
  }

  statement {
    sid     = "ReadObjects"
    actions = ["s3:GetObject", "s3:GetObjectVersion"]
    resources = [
      "arn:aws:s3:::${var.s3_bucket_name}/*"
    ]
  }
}

resource "aws_iam_policy" "s3_readonly_bucket" {
  name        = "irsa-s3-readonly-${var.s3_bucket_name}"
  description = "Read-only to ${var.s3_bucket_name}"
  policy      = data.aws_iam_policy_document.s3_readonly_bucket.json
}

resource "aws_iam_role_policy_attachment" "attach" {
  role       = aws_iam_role.irsa.name
  policy_arn = aws_iam_policy.s3_readonly_bucket.arn
}
