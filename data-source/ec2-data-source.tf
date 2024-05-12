resource aws_instance "aws_instance" {
    ami = data.aws_ami.ami_id.id
    instance_type = "t2.micro"
    vpc_security_group_ids = [data.aws_vpc.default.id]

    tags = {
        createdBy = "data-source-practice"
    }
}