locals {
    instance_name = var.instance_name
    ami_id = "ami-090252cbe067a9e58"
    instance_type = var.instance_name == "db" ? "t3.micro" : "t2.micro"
    sg_id = "sg-04dae8a904672e07f"
    tags = {
        Name = "db"
    }
}