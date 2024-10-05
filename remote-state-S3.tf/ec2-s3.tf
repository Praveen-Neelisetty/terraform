resource "aws_instance" "aws_instance_s3" {
  ami                    = data.aws_ami.aws_ami_info.id
  vpc_security_group_ids = ["default"]
  instance_type          = "t2.micro"

  tags = {
    Name = "aws_ec2_s3_dynamoDB"
  }
}
