resource "aws_route53_record" "lp" {
  zone_id = local.host_zone_id
  name    = local.lp_domain
  type    = "A"
  alias {
    name                   = aws_cloudfront_distribution.lp.domain_name
    zone_id                = aws_cloudfront_distribution.lp.hosted_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "lp_www" {
  zone_id = local.host_zone_id
  name    = "www.${local.lp_domain}"
  type    = "A"
  alias {
    name                   = aws_cloudfront_distribution.lp_www.domain_name
    zone_id                = aws_cloudfront_distribution.lp_www.hosted_zone_id
    evaluate_target_health = false
  }
}
