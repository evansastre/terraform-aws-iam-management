

data "aws_iam_policy_document" "assume_role" {

  for_each = var.iam_roles

  statement {
    effect = "Allow"

    actions = ["sts:AssumeRole"]

    principals {
      type        = "AWS"
      identifiers = try(each.value.trusted_role_arns, var.trusted_role_arns)
    }

    principals {
      type        = "Service"
      identifiers = try(each.value.trusted_role_services, var.trusted_role_services)
    }
  }
}

resource "aws_iam_role" "this" {
  for_each = var.iam_roles

  name                 = try(each.value.name, var.name)
  path                 = try(each.value.path, var.path)
  max_session_duration = try(each.value.max_session_duration, var.max_session_duration)

  force_detach_policies = try(each.value.force_detach_policies, var.force_detach_policies)
  permissions_boundary  = try(each.value.permissions_boundary, var.permissions_boundary_arn)

  assume_role_policy =  data.aws_iam_policy_document.assume_role[each.value.name].json

  tags = try(each.value.tags, var.tags)
}

module "aws_iam_role_policy_attachment" {
  for_each = var.iam_roles
  source = "./aws-iam-role-policy-attachment"

  role       = aws_iam_role.this[each.value.name].name
  policy_arns = try(each.value.policy_arns, var.policy_arns)
}
