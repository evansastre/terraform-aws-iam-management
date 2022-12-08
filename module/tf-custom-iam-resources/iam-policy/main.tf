resource "aws_iam_policy" "this" {
  for_each =  var.iam_policies
  
  name        = each.value.name
  path        = try(each.value.path, var.path)
  description = try(each.value.description, var.description)

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = each.value.policy

}