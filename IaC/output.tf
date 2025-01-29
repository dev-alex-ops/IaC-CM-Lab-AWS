output "Jenkins_ip" {
    description = "The public IP address of the Jenkins instance"
    value       = aws_instance.lab_jenkins_instance.public_ip
}

output "Worker_ip" {
    description = "The public IP address of the Worker instance"
    value       = aws_instance.lab_worker_instance.public_ip
}