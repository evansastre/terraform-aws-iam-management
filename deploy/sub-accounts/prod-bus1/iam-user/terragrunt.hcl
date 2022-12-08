terraform {
  source = "${get_parent_terragrunt_dir()}/../module//tf-custom-iam-resources/iam-user"
}



include {
  path = find_in_parent_folders()
}


generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
provider "aws" {
  assume_role {
    role_arn = "arn:aws:iam::123456789012:role/serviceRoleIamTerraformAutomation"
  }
 }
EOF
}

dependency "iam-policy"{
    config_path  = "../iam-policy"
    mock_outputs = {
       arn = { "pol-citrix-minimal-permissions" = "arn:xxxxxxxxxx" }
    }
}

inputs = {

  iam_users = {
    
    "serviceAccountCitrixAutomation" = {
      name = "serviceAccountCitrixAutomation"
      policy_arn = dependency.iam-policy.outputs.arn["pol-citrix-minimal-permissions"]
      tags = {
        resource_managed_by = "citrix"
      }
    }
  }
 
}