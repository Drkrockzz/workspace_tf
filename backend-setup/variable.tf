variable "region" {
  description = "select the region to provision resources"
  type = string
}

variable "bucket_name" {
 #only lowercase alphanumeric characters and hyphens allowed
  description = "Give the bucket name for the s3 bucket"
  type = string
}

variable "Dynamodb_table_name" {
  description = "Name of Dynamodb table"
  type = string
}