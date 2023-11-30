data "aws_route53_zone" "main" {
  private_zone = var.dns_private_zone
  zone_id      = var.zone_id
}

resource "aws_route53_record" "main" {
  zone_id = data.aws_route53_zone.main.zone_id
  name    = "${var.dns-url-prefix}.${data.aws_route53_zone.main.name}"
  type    = "A"
  ttl     = var.dns_ttl
  records = [ aws_eip.main.public_ip ]
}