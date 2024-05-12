resource aws_route53_record "Expense" {
    count = length(var.instance_name)
    type = "A"
    zone_id = var.zone_id
    ttl = 1
    name = var.instance_name[count.index] == "frontend" ? var.domain_name : "${var.instance_name[count.index]}.${var.domain_name}"
    records = var.instance_name[count.index] == "frontend" ? var.aws_route53_record.Expense.public_ip : "${var.instance_name}.${var.aws_route53_record.Expense.private_ip}"
}