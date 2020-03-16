
variable "cidr_vpc" {
  description = "CIDR block for the VPC"
  default = "10.1.0.0/16"
}
variable "cidr_subnet" {
  description = "CIDR block for the subnet"
  default = "10.1.0.0/24"
}

variable "region" {
  default = "ap-southeast-1"
}
variable "profile" {
  default = "kops-user1"  
}

variable "availability_zone" {
  description = "availability zone to create subnet"
  default = "ap-southeast-1a"
}

variable "public_key_path" {
  description = "Public key path"
  default = "~/.ssh/id_rsa.pub"
}

variable "environment_tag" {
  description = "Environment tag"
  default = "Production"
}

variable "instance_ami" {
  description = "AMI for aws EC2 instance"
  default = "ami-0386beba2a11d9539"
}
variable "instance_type" {
  description = "type for aws EC2 instance"
  default = "t2.micro"
}

variable "instance_name" {
  description = "GCP instance name"
  # type = "list"
  default = "server1,server2"
}