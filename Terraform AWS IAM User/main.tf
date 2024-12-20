resource "aws_iam_policy" "custom_policy" {
  name        = "custom-policy"
  description = "Custom policy for IAM user with specific permissions"
  policy      = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid    = "VisualEditor0",
        Effect = "Allow",
        Action = [
          "application-autoscaling:*",
          "tag:GetResources",
          "logs:*",
          "events:PutRule",
          "autoscaling:*",
          "events:ListRuleNamesByTarget",
          "events:RemoveTargets",
          "events:ListTargetsByRule",
          "events:DescribeRule",
          "s3:*",
          "elasticloadbalancing:*",
          "iam:*",
          "events:DeleteRule",
          "events:PutTargets",
          "es:RemoveTags",
          "cloudwatch:*",
          "ecs:*",
          "ecr:*",
          "ec2:*",
          "eks:*",
          "elasticache:*",
          "autoscaling-plans:*",
          "acm:*",
          "kms:*",
          "pricing:*",
          "vpc-lattice:*",
          "vpc-lattice-svcs:*",
          "ec2:DetachNetworkInterface",
          "ec2:DescribeNetworkInterfaces",
          "ec2:DescribeInstances",
          "ec2:DescribeNetworkInterfaceAttribute",
          "eks:DescribeCluster",
          "eks:ListClusters",
          "eks-auth:*",
          "apigateway:*"
        ],
        Resource = [
          "*",
          "arn:aws:s3:::files-pp",
          "arn:aws:s3:::files-pp/*"
        ]
      }
    ]
  })
}

resource "aws_iam_user" "this" {
  count = var.create_user ? 1 : 0

  name                 = var.name
  path                 = var.path
  force_destroy        = var.force_destroy
  permissions_boundary = var.permissions_boundary

  tags = var.tags
}

resource "aws_iam_user_login_profile" "this" {
  count = var.create_user && var.create_iam_user_login_profile ? 1 : 0

  user                    = aws_iam_user.this[0].name
  pgp_key                 = var.pgp_key
  password_length         = var.password_length
  password_reset_required = var.password_reset_required

  lifecycle {
    ignore_changes = [password_reset_required]
  }
}

resource "aws_iam_access_key" "this" {
  count = var.create_user && var.create_iam_access_key && var.pgp_key != "" ? 1 : 0

  user    = aws_iam_user.this[0].name
  pgp_key = var.pgp_key
  status  = var.iam_access_key_status
}

resource "aws_iam_access_key" "this_no_pgp" {
  count = var.create_user && var.create_iam_access_key && var.pgp_key == "" ? 1 : 0

  user   = aws_iam_user.this[0].name
  status = var.iam_access_key_status
}

resource "aws_iam_user_ssh_key" "this" {
  count = var.create_user && var.upload_iam_user_ssh_key ? 1 : 0

  username   = aws_iam_user.this[0].name
  encoding   = var.ssh_key_encoding
  public_key = var.ssh_public_key
}

resource "aws_iam_user_policy_attachment" "this" {
  user       = aws_iam_user.this[0].name
  policy_arn = aws_iam_policy.custom_policy.arn
}
