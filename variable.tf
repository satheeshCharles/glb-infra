variable "region-name" {
  description = " default aws region"
  type        = "string"
  default     = "us-east-1"
}
variable "cidr-block" {
  description = "CIDR block range for VPC"
  type        = "string"
  default     = "10.20.0.0/16"
}
