/*====
Criando cdn CloudFrond. Origin será Bucket S3
======*/

resource "aws_cloudfront_distribution" "blog_cdn" {
    origin {
        custom_origin_config {
            http_port = 80,
            https_port = 443,
            origin_protocol_policy = "http-only",
            origin_ssl_protocols = ["SSLv3", "TLSv1", "TLSv1.1", "TLSv1.2"]
        }
        domain_name = "${aws_s3_bucket.blog.id}.s3-website-${var.aws_region}.amazonaws.com"
        origin_id   = "${aws_s3_bucket.blog.id}"
    }

    enabled = true
    default_root_object = "index.html"
    aliases = ["${var.blog_public_subdominio}.${var.root_dominio}", "www.${var.blog_public_subdominio}.${var.root_dominio}"]

    custom_error_response {
       error_code         = 404
       response_code      = 200
       response_page_path = "/404.html"
    }

    http_version = "http2"

    default_cache_behavior {
        allowed_methods  = ["HEAD", "GET", "OPTIONS"]
        cached_methods  = ["HEAD", "GET", "OPTIONS"]
        target_origin_id = "${aws_s3_bucket.blog.id}"

        forwarded_values {
          query_string = false

          cookies {
            forward = "none"
          }
        }

        viewer_protocol_policy = "allow-all"
        min_ttl                = 0
        default_ttl            = 3600
        max_ttl                = 86400
    }

    price_class = "PriceClass_All"

    restrictions {
        geo_restriction {
            restriction_type = "none"
        }
    }

    viewer_certificate {
        cloudfront_default_certificate = true
    }
}
