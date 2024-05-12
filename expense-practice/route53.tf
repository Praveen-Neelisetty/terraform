resource aws_route53_record "expense" {
    count = length(var.instance_name)
    type = "A"
    zone_id = var.zone_id
    ttl = 1
    name = var.instance_name[count.index] == "frontend" ? var.domain_name : "${var.instance_name[count.index]}.${var.domain_name}"
    records = var.instance_name[count.index] == "frontend" ? [aws_instance.AWS_Instances[count.index].public_ip] : [aws_instance.AWS_Instances[count.index].private_ip]
    allow_overwrite = true
}