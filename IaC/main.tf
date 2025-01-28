resource "aws_vpc" "lab_vpc" {
  cidr_block = var.vpc_cidr
  instance_tenancy = "default"
  tags = {
    "Name" = "lab_vpc",
    "Origin" = "Terraform"
  }
}

resource "aws_subnet" "lab_subnet" {
  vpc_id = aws_vpc.lab_vpc.id
  cidr_block = var.subnet_cidr
  availability_zone = var.availability_zone
  map_public_ip_on_launch = true
  tags = {
    "Name" = "lab_subnet",
    "Origin" = "Terraform"
  }
}

resource "aws_security_group" "lab_security_group" {
  vpc_id = aws_vpc.lab_vpc.id
  
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
    from_port = var.ssh_port
    to_port = var.ssh_port
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = var.jenkins_port
    to_port = var.jenkins_port
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = var.worker_port
    to_port = var.worker_port
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "Name" = "lab_security_group",
    "Origin" = "Terraform"
  }
}

resource "aws_internet_gateway" "lab_internet_gateway" {
  vpc_id = aws_vpc.lab_vpc.id
  tags = {
    "Name" = "lab_internet_gateway",
    "Origin" = "Terraform"
  }
}

resource "aws_route_table" "lab_route_table" {
  vpc_id = aws_vpc.lab_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.lab_internet_gateway.id
  }
  tags = {
    "Name" = "lab_route_table",
    "Origin" = "Terraform"
  }
}

resource "aws_route_table_association" "lab_route_table_association" {
  subnet_id = aws_subnet.lab_subnet.id
  route_table_id = aws_route_table.lab_route_table.id
}

resource "aws_instance" "lab_jenkins_instance" {
  ami = var.ami_id
  instance_type = var.jenkins_sku
  subnet_id = aws_subnet.lab_subnet.id
  security_groups = [aws_security_group.lab_security_group.id]
  key_name = var.key_name
  tags = {
    "Name" = "lab_jenkins_instance",
    "Origin" = "Terraform"
  }
}

resource "aws_instance" "lab_worker_instance" {
  ami = var.ami_id
  instance_type = var.worker_sku
  subnet_id = aws_subnet.lab_subnet.id
  security_groups = [aws_security_group.lab_security_group.id]
  key_name = var.key_name
  tags = {
    "Name" = "lab_worker_instance",
    "Origin" = "Terraform"
  }
}