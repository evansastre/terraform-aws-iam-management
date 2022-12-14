
resource "aws_cloudformation_stack_set" "this" {
  name                    = var.name
  permission_model        = var.permission_model 
  auto_deployment {
    enabled = true
  }

  capabilities = ["CAPABILITY_NAMED_IAM"]
  template_body = var.template_body

  tags =  var.tags

  lifecycle {
    ignore_changes = [
      administration_role_arn,
      description
    ]
  }
}


#data "aws_organizations_organization" "this" {}

resource "aws_cloudformation_stack_set_instance" "this" {
  deployment_targets {
    organizational_unit_ids = var.organizational_unit_id
  }


  stack_set_name = aws_cloudformation_stack_set.this.name
}
