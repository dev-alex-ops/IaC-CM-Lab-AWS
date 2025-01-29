# IaC-CM-Lab-AWS
This repository is a practice lab for the IES Celia Connect 2025 conference. It automatically deploys an infrastructure consisting of 2 EC2 instances in a subnet of a VPC, secured with only the necessary ports open, and with a custom route table that connects the internet gateway to the VPC subnet.

The instances host a Jenkins server and a worker node, which also acts as the host for an application deployed on it through a pipeline that builds and runs a Docker container. This container is pulled from a personal repository where a simple React application is hosted.

## Terraform (IaC)
The chosen provider is AWS, and a simple method of file distribution is used, distinguishing **"main.tf", "variables.tf", "output.tf", and "provider.tf"**. This allows for the explanation of the possibility of declaring variables in the runtime environment as well as receiving parameters after the code execution.

## Ansible (CM)
At the configuration management level, I decided to create a playbook, in addition to a dynamic Jinja2 inventory that receives values declared in a file as variables that may vary between labs, such as IPs, Ansible users, or paths to the .pem file.

I also put into practice the concept of roles to distinguish which tasks are deployed on which host, as well as to allow a much more visual explanation of what and where each of the main tasks is deployed.

There is a distinction between the installation of Jenkins (and dependencies) and the installation of Docker and its dependencies, as well as Java on both to be able to run both the server and the connection with the worker node.