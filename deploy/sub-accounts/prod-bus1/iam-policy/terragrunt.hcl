terraform {
  source = "${get_parent_terragrunt_dir()}/../module//tf-custom-iam-resources/iam-policy"
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

inputs = {

  iam_policies = {
    
    "pol-citrix-minimal-permissions" = {
      name = "pol-citrix-minimal-permissions"
      policy = "${file("./json-files/pol-citrix-minimal-permissions.json")}"
    }
  }
 
}