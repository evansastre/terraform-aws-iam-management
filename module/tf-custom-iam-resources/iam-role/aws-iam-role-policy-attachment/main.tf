resource "aws_iam_role_policy_attachment" "this" {
  for_each = toset(var.policy_arns)

  role       = var.role
  policy_arn = try(each.key, var.policy_arns)
}
