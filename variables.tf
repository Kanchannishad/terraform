variable "dynamodb_table_name" {
  description = "Name of the DynamoDB table"
  type        = string
  default     = "terraform-lock-table"
}

variable "ami_id" {
  description = "Ubuntu AMI ID for EC2"
  type        = string
  default     = "ami-0f5fcdfbd140e4ab7"
}
