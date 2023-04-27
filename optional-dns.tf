variable "aliases" {
  description = "CNAME(s) that are allowed to be used for this product in the rules on the load balancer. Any name that does not match one of these will get a 403 response from the load balancer. Default is `product`.`hosted_zone`. e.g. [product.example.com] --> [product.example.com]"
  default     = null
  type        = list(string)
}

variable "cnames" {
  description = "CNAME(s) that are going to be created for this product in the hosted zone. This can be set to [] to avoid creating a CNAME for the product. Default is `product`. e.g. [product] --> [product.example.com]"
  default     = null
  type        = list(string)
}

variable "primary_hosted_zone" {
  description = "Name of the primary hosted zone for DNS. e.g. primary_hosted_zone = example.org --> service.example.org. If null, it is assumed that a private hosted zone will be used."
  default     = null
  type        = string
}

variable "private_hosted_zone" {
  description = "Name of the private hosted zone for DNS. e.g. private_hosted_zone = example.org --> service.example.private. If null, it is assumed that a public hosted zone will be used."
  default     = null
  type        = string
}

variable "dns_evaluate_target_health" {
  description = "evaluate health of endpoints by querying DNS records"
  default     = false
  type        = bool
}
