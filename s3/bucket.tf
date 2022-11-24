resource "aws_s3_bucket" "mybucket" {
    bucket = "${var.bucket_name}" 
    acl = "${var.acl_value}"   
}
