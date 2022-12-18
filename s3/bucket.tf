resource "aws_s3_bucket" "mybucket" {
    bucket = "${var.bucket_name}" 
    acl = "${var.acl_value}"   
}

resource "aws_kms_key" "key" {
  description             = var.kms_key_description
  tags                    = var.tags
  deletion_window_in_days = var.kms_deletion_window_in_days
}

resource "aws_s3_bucket_server_side_encryption_configuration" "s3_bucket_encryption" {
  bucket = aws_s3_bucket.mybucket.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.key.key_id
      sse_algorithm     = "aws:kms"
    }
  }
}
