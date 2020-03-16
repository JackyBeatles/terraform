provider "aws" {
  region                  = "${var.region}"
  shared_credentials_file = "~/.aws/credentials"
  profile                 = "${var.profile}"
}
# create vpc
resource "aws_vpc" "vpc" {
  cidr_block           = "${var.cidr_vpc}"
  enable_dns_hostnames = true
  tags = {
    "Environment" = "${var.environment_tag}"
  }
}


# External gateway configuration
resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.vpc.id}"
  tags = {
    "Environment" = "${var.environment_tag}"
  }
}

# Subnet configuration

resource "aws_subnet" "subnet_public" {
  vpc_id = "${aws_vpc.vpc.id}"
  cidr_block = "${var.cidr_subnet}"
  map_public_ip_on_launch = "true"
  availability_zone = "${var.availability_zone}"
  tags {
    "Environment" = "${var.environment_tag}"
  }
}

resource "aws_route_table" "rtb_public" {
  vpc_id = "${aws_vpc.vpc.id}"

  route {
      cidr_block = "0.0.0.0/0"
      gateway_id = "${aws_internet_gateway.igw.id}"
  }

  tags {
    "Environment" = "${var.environment_tag}"
  }
}

resource "aws_route_table_association" "rta_subnet_public" {
  subnet_id      = "${aws_subnet.subnet_public.id}"
  route_table_id = "${aws_route_table.rtb_public.id}"
}


# #create firewall  rule 

resource "aws_security_group" "admin" {
  name        = "admin"
  description = "Allow default administration service"
  vpc_id      = "${aws_vpc.vpc.id}"
  tags = {
    Name = "admin"
  }

  # Open ssh port
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow icmp
  ingress {
    from_port   = 8
    to_port     = 0
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Open access to public network
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Open web port
resource "aws_security_group" "web" {
  name        = "web"
  description = "Allow web incgress trafic"
  vpc_id      = "${aws_vpc.vpc.id}"
  tags = {
    Name = "web"
  }

  # http port
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # https port
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Open access to public network
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create default ssh publique key
resource "aws_key_pair" "user1_key" {
  key_name   = "user-key"
  public_key = "${file(var.public_key_path)}"
}

#Create instance
resource "aws_instance" "Server" {
  count         = "${length(split(",", var.instance_name))}"
  ami           = "${var.instance_ami}"
  instance_type = "${var.instance_type}"
  key_name      = "${aws_key_pair.user1_key.key_name}"
  vpc_security_group_ids = ["${aws_security_group.admin.id}","${aws_security_group.web.id}"]
  subnet_id = "${aws_subnet.subnet_public.id}"
  tags = {
    "Environment" = "${var.environment_tag}"
    "Name"         = "${element(split(",", var.instance_name), count.index)}"
  }
}

