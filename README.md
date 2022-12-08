# Terraform Common AWS IAM Management

This Repo is to manage all the IAM resources: IAM Policy, User and Role.

### There are 2 cases we're going to handle:

- 1) Common User/role/policy need to be deployed in all sub-accounts: in this case, we will use cloudformation stackset to manage the resources because we don't want to repeate the process for multiple times..

      this template should be less than the cloudformation size uplimit(51,200 bytes).


- 2) Specific User/role/policy in different sub-account.
   for example: a service account might have multiple custom policies attached, and this might easily exceed the cloudformation size limit(51,200 bytes). 
   we will use json files to manage all the policies. 

## Modules
   - cf-common-iam-resources: this is the cloudformation module to manage the stackset.
   - tf-custom-iam-resources: we will create this terraform module to manage IAM policy document, IAM User and Role.


```

├── README.md
├── deploy
│   ├── common
│   │   ├── templates
│   │   │   └── template.yaml
│   │   └── terragrunt.hcl
│   ├── sub-accounts
│   │   └── bus1
│   └── terragrunt.hcl
└── module
    ├── cf-common-iam-resources
    │   ├── main.tf
    │   ├── output.tf
    │   ├── readme.md
    │   └── var.tf
    └── tf-custom-iam-resources
```

