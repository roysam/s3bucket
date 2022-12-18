variable "bucket_name" {}

variable "acl_value" {
    # default = "public-read-write"
    default = "private"
}

variable "kms_key_description" {
  type    = string
  default = "rsam-s3key"
}

variable "kms_deletion_window_in_days" {
  type    = number
  default = 7
}

variable "tags" {
  type = map(string)
  default = {
    "Purpose"    = "rsam-Demo",
    "CostCenter" = "rsam-infra"
  }
}
