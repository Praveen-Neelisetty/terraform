output "public_ip" {
    value = { for instance in aws_instance.AWS_Instances : instance.id => instance.public_ip }
}

output "private_ip" {
    value = { for instance in aws_instance.AWS_Instances : instance.id => instance.private_ip }
}

output "enclave_options" {
    value = { for instance in aws_instance.AWS_Instances : instance.id => "Enclave_Options ${instance.enclave_options[0].enabled}" }
}
