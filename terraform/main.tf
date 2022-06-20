locals {
  s3_origin_id = "flagrantWebOrigin"
}

resource "aws_s3_bucket" "host_bucket" {
  bucket = "yawna-flagrant-web"
  acl    = "private"

  policy = data.aws_iam_policy_document.s3_policy.json
}

data "aws_iam_policy_document" "s3_policy" {
  statement {
    actions   = ["s3:GetObject"]
    resources = ["arn:aws:s3:::yawna-flagrant-web/*"]

    principals {
      type        = "AWS"
      identifiers = [aws_cloudfront_origin_access_identity.identity.iam_arn]
    }
  }
}

resource "aws_cloudfront_origin_access_identity" "identity" {
  comment = "Flagrant web cloudfront access identity"
}

resource "aws_cloudfront_distribution" "s3_distribution" {
  origin {
    domain_name = aws_s3_bucket.host_bucket.bucket_regional_domain_name
    origin_id   = local.s3_origin_id

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.identity.cloudfront_access_identity_path
    }
  }

  enabled             = true
  is_ipv6_enabled     = true
  default_root_object = "index.html"

  aliases = ["flagoff.org","www.flagoff.org"]

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD", "OPTIONS"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = local.s3_origin_id

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  price_class = "PriceClass_100"

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    acm_certificate_arn = "arn:aws:acm:us-east-1:927640125007:certificate/895063bb-2393-43e9-bcd6-968cf89649a2"
    ssl_support_method  = "sni-only"
  }

  custom_error_response {
    error_code = 403
    error_caching_min_ttl = 0
    response_page_path = "/index.html"
    response_code = 200
  }

  custom_error_response {
    error_code = 404
    error_caching_min_ttl = 0
    response_page_path = "/index.html"
    response_code = 200
  }

}


