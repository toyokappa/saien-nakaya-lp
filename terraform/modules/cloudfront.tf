resource "aws_cloudfront_distribution" "lp" {
  wait_for_deployment = false
  enabled             = true
  is_ipv6_enabled     = true
  comment             = "${local.app_name}-${terraform.workspace}-lp"
  default_root_object = ""
  aliases             = [local.lp_domain]

  origin {
    domain_name = aws_s3_bucket.lp.bucket_regional_domain_name
    origin_id   = aws_s3_bucket.lp.id

    s3_origin_config {
      origin_access_identity = "origin-access-identity/cloudfront/${aws_cloudfront_origin_access_identity.lp.id}"
    }
  }

  default_cache_behavior {
    allowed_methods  = ["HEAD", "GET", "OPTIONS"]
    cached_methods   = ["HEAD", "GET"]
    target_origin_id = aws_s3_bucket.lp.id
    compress         = true

    forwarded_values {
      query_string = true
      headers      = ["Origin"]
      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 0
    max_ttl                = 0
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    acm_certificate_arn      = local.cf_certificate_arn
    ssl_support_method       = "sni-only"
    minimum_protocol_version = "TLSv1.2_2018"
  }

  custom_error_response {
    error_code            = 403
    error_caching_min_ttl = 0
    response_page_path    = "/index.html"
    response_code         = 200
  }
}
resource "aws_cloudfront_origin_access_identity" "lp" {
  comment = "${local.app_name}-${terraform.workspace}-lp"
}
