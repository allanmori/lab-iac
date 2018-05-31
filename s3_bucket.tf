resource "aws_s3_bucket" "blog" {
    bucket = "${var.blog_bucket_subdominio}.${var.root_dominio}"

    website {
        index_document = "index.html"
        error_document = "404.html"
    }
}
