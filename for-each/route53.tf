resource "aws_route53_record" "route_name" {
  for_each        = aws_instance.aws_instance_forEach
  zone_id         = "Z00919132R52PAI68SR11"
  ttl             = 1
  type            = "A"
  name            = each.key == "frontend" ? var.domain : "${each.key}.${var.domain}"
  records         = each.key == "db" ? [each.value.public_ip] : [each.value.private_ip]
  allow_overwrite = true
}


