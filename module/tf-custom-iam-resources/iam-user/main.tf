resource "aws_iam_user" "this" {
  for_each = var.iam_users

  name = each.value.name
  tags = each.value.tags
}


resource "aws_iam_user_policy_attachment" "this" {
  for_each = var.iam_users

  user       = aws_iam_user.this[each.value.name].name
  policy_arn = each.value.policy_arn
  depends_on = [
    aws_iam_user.this
  ]
}