terraform {
  source = "${get_parent_terragrunt_dir()}/../module//cf-common-iam-resources"
}



include {
  path = find_in_parent_folders()
}


inputs = {

  name = "aws-common-roles-in-all-accounts"
  ## sandbox, stage and prod OU
  organizational_unit_id = ["ou-x001-xxxxxx1", "ou-x001-xxxxxx2", "ou-x001-xxxxxx3"]
  template_body = file("./templates/template.yaml")

}
