resource "aws_instance" "aws_instance_forEach" {
  for_each               = var.instance_names
  ami                    = data.aws_ami.aws_ami_info.id
  vpc_security_group_ids = ["default"]
  instance_type          = each.value

  tags = merge(
    var.common_tags,
    {
      Name   = each.key
      module = each.key
    }
  )
}
