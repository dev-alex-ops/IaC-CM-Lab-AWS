variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "subnet_cidr" {
  description = "The CIDR block for the subnet"
  type        = string
}

variable "availability_zone" {
  description = "The availability zone for the subnet"
  type        = string
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
}

variable "jenkins_sku" {
  description = "The instance type for the Jenkins instance"
  type        = string
}

variable "worker_sku" {
  description = "The instance type for the worker instance"
  type        = string
}

variable "key_name" {
  description = "The key pair name for the EC2 instance"
  type        = string
}