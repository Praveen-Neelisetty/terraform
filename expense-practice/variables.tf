#instance variables

variable "instance_name" {
    type = list(string)
    default = ["db", "frontend", "backend"]
}

variable "tags" {
    default = {
        Environment = "Dev"
        Project = "Expense"
        CreatedBy = "Praveen"
        Terraform = "true"
    }
}

#aws53 variables

variable "zone_id" {
    default = "Z00919132R52PAI68SR11"
} 

variable "domain_name"{
    default = "praveen.store"
}
