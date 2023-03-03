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

resource "aws_s3_bucket" "lp_www" {
  bucket = "${local.app_name}-${terraform.workspace}-lp-www"

  # policy = templatefile(
  #   "policies/s3_cloudfront_lp_bucket_policy.tmpl",
  #   {
  #     sid_name                  = "LpWWW",
  #     origin_access_identity_id = aws_cloudfront_origin_access_identity.lp_www.id,
  #     app_name                  = local.app_name,
  #     env                       = terraform.workspace,
  #     name                      = "lp-www"
  #   }
  # )
}

resource "aws_s3_bucket_website_configuration" "lp_www" {
  bucket = aws_s3_bucket.lp_www.id
  redirect_all_requests_to {
    host_name = local.lp_domain
    protocol  = "https"
  }
}
