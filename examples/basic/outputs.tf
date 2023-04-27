output "domain_name" {
  description = "One domain name that will resolve to this product. Might not be a valid alias."
  value       = module.lambda_lb.domain_name
}

output "lb_sg" {
  description = "Load balancer security group"
  value       = module.lambda_lb.lb_sg
}

output "lb_arn" {
  description = "Load balancer ARN"
  value       = module.lambda_lb.lb_arn
}

output "lambda_arn" {
  description = "ARN of the Lambda function"
  value       = module.lambda_lb.lambda_arn
}

output "lambda_name" {
  description = "Name of the Lambda function"
  value       = module.lambda_lb.lambda_name
}

output "lambda_sg" {
  description = "Security group of the lambda function"
  value       = module.lambda_lb.lambda_sg
}
