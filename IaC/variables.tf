variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  description = "The CIDR block for the subnet"
  type        = string
  default     = "10.20.1.0/24"
}

variable "availability_zone" {
  description = "The availability zone for the subnet"
  type        = string
  default     = "us-west-3a"
}

variable "route_cidr_block" {
  description = "The CIDR block for the route"
  type        = string
  default     = "0.0.0.0/0"
}

variable "jenkins_port" {
  description = "The port for Jenkins"
  type        = number
  default     = 8080
}

variable "worker_port" {
  description = "The port for Node.js"
  type        = number
  default     = 3000
}

variable "ssh_port" {
  description = "The port for SSH"
  type        = number
  default     = 22
}

variable "ami_id" {
  description = "The AMI ID for the EC2 instance"
  type        = string
  default     = "ami-06e02ae7bdac6b938"
}

variable "jenkins_sku" {
  description = "The instance type for the Jenkins instance"
  type        = string
  default     = "t2.medium"
}

variable "worker_sku" {
  description = "The instance type for the worker instance"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "The key pair name for the EC2 instance"
  type        = string
  default     = "lab-kp"
}