output "domain_name" {
  description = "One domain name that will resolve to this product. Might not be a valid alias."
  value       = local.domain_name
}

output "lb_sg" {
  description = "Load balancer security group"
  value       = var.create_lb_sg ? one(aws_security_group.lb_sg[*].id) : null
}

output "lb_arn" {
  description = "Load balancer ARN"
  value       = aws_lb.lb.arn
}

output "lambda_arn" {
  description = "ARN of the Lambda function"
  value       = module.lambda.arn
}

output "lambda_name" {
  description = "Name of the Lambda function"
  value       = module.lambda.name
}

output "lambda_sg" {
  description = "Security group of the lambda function"
  value       = module.lambda.sg
}
