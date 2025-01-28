output "Jenkins_ip" {
    description = "The public IP address of the Jenkins instance"
    value       = aws_instance.jenkins_instance.public_ip
}

output "Worker_ip" {
    description = "The public IP address of the Worker instance"
    value       = aws_instance.worker_instance.public_ip
}