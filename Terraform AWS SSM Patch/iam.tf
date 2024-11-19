resource "aws_iam_policy" "custom_ssm_policy" {
  name        = "CustomSSMPolicy"
  description = "Policy for SSM Maintenance Window and Patch Baseline management"
  
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "ssm:CreateMaintenanceWindow",
          "ssm:CreatePatchBaseline",
          // Add other necessary SSM actions here
          "ssm:*"  // Adjust as necessary
        ]
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_user_policy_attachment" "attach_custom_ssm_policy" {
  user       = "Scoutflo"
  policy_arn = aws_iam_policy.custom_ssm_policy.arn
}