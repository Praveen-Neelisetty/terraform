
#Order Wise variables
#1) Command Line 
#2) <file-name>.tfvars --> variables.tfvars --> instance_type = t3.micro
#3) Environment Variable --> export instance_type = t3.micro (You need to give at the time of executing "terraform apply -auto-approve")
#4) variable default value

variable "ami_image_id" {
  type    = string
  default = "ami-090252cbe067a9e58"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "instance_tags" {
  default = {
    Name        = "Praveen"
    Module      = "DB_Server"
    Environment = "Stage"
    Project     = "Expense"
  }
}

variable "inbounce" {
  default = {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
  }
}

variable "from_port" {
  type    = number
  default = 0
}

variable "to_port" {
  type    = number
  default = 0
}

variable "protocol" {
  type    = string
  default = "-1"
}

variable "cibr_blocks" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}

variable "from_port_inbounce" { # example for Command Line variable 
  type        = number
  description = "inbounce port number to allow"
}

variable "instance_type_by_name" {
  default = "db"
}

variable "instance_name" {
  type    = list(string)
  default = ["db", "frontend", "backend"]
}
