output "arn" {
  description = "The ID/arn of the policy"
  value       = {
    for role in aws_iam_role.this:
      role.name => role.arn
  }
 
}