variable "instance_names" {
  type = map(string)
  default = {
    db       = "t3.micro"
    backend  = "t2.micro"
    frontend = "t2.micro"
  }
}

variable "common_tags" {
  type = map(string)
  default = {
    Environment = "Dev"
    Project     = "Expense"
    terraform   = true
  }
}

variable "domain" {
  type    = string
  default = "praveen.store"
}
