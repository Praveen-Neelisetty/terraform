resource "aws_instance" "AWS_Instances" {
    count = length(var.instance_name)
    ami = "ami-090252cbe067a9e58"
    instance_type = var.instance_name[count.index] == "db" ? "t3.micro" : "t2.micro"
    vpc_security_group_ids = [aws_security_group.AWS_Security_Group.id]

    tags = merge (
        var.tags,
        {
            Name = "${var.instance_name[count.index]} Server"
            Module = var.instance_name[count.index]
        }
    )
}

resource aws_security_group "AWS_Security_Group" {

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp" 
        cidr_blocks = [ "0.0.0.0/0" ] 
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = [ "0.0.0.0/0" ]
    }

    tags = {
        Name = "allow_ssh"
        CreatedBy = "Praveen"
    }

}