variable "path" {
    default = "/"
}

variable "description" {
    default = ""
  
}

variable "iam_roles" {
    type = any
    default = {}
  
}

variable "name" {
    default = null
}

variable "trusted_role_arns" {
  description = "ARNs of AWS entities who can assume these roles"
  type        = list(string)
  default     = []
}

variable "trusted_role_services" {
  description = "AWS Services that can assume these roles"
  type        = list(string)
  default     = []
}

variable "max_session_duration" {
  description = "Maximum CLI/API session duration in seconds between 3600 and 43200"
  type        = number
  default     = 3600
}

variable "force_detach_policies" {
  description = "Whether policies should be detached from this role when destroying"
  type        = bool
  default     = false
}

variable "permissions_boundary_arn" {
  description = "Permissions boundary ARN to use for readonly role"
  type        = string
  default     = ""
}

variable "tags" {
    default = {}
  
}

variable "policy_arns" {
  description = "List of policy ARNs"
  type        = list(string)
  default     = []
}