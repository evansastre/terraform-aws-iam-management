output "arn" {
  description = "The ID/arn of the policy"
  value       = {
    for policy in aws_iam_policy.this:
      policy.name => policy.arn
  }
 
}