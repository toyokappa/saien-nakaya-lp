resource "aws_s3_bucket" "lp" {
  bucket = "${local.app_name}-${terraform.workspace}-lp"

  policy = templatefile(
    "policies/s3_cloudfront_lp_bucket_policy.tmpl",
    {
      sid_name                  = "Lp",
      origin_access_identity_id = aws_cloudfront_origin_access_identity.lp.id,
      app_name                  = local.app_name,
      env                       = terraform.workspace,
      name                      = "lp"
    }
  )
}
