variable "path" {
    default = "/"
}

variable "description" {
    default = ""
  
}

variable "iam_policies" {
    type = any
    default = {}
  
}