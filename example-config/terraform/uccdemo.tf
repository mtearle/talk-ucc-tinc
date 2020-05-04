
# berkeley 172.16.86.10/32 us-west-1
# tymnet 172.16.86.20/32 us-east-1
# mitre 172.16.86.30/32 us-east-2
# bremen 172.16.86.40/32 eu-central-1
# hannover 172.16.86.50/32 eu-west-2
# 
# kremvax 172.16.99.0/24 172.16.99.1 eu-north-1

resource "aws_key_pair" "terraform_ec2_key" {
  key_name = "terraform_ec2_key"
  public_key = file("username.pub")
}

resource "aws_security_group" "tincdemo_sg" {
  name = "tincdemo_sg"

#ssh
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

#tinc
  ingress {
    from_port   = 635
    to_port     = 635
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow outgoing traffic to anywhere.
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

resource "aws_instance" "berkeley" {
  ami           = "ami-2757f631"
  instance_type = "t2.micro"
  key_name = "terraform_ec2_key"
  security_groups = ["${aws_security_group.tincdemo_sg.name}"]
}

resource "aws_instance" "tymnet" {
  ami           = "ami-2757f631"
  instance_type = "t2.micro"
  key_name = "terraform_ec2_key"
  security_groups = ["${aws_security_group.tincdemo_sg.name}"]
}

resource "aws_instance" "mitre" {
  ami           = "ami-2757f631"
  instance_type = "t2.micro"
  key_name = "terraform_ec2_key"
  security_groups = ["${aws_security_group.tincdemo_sg.name}"]
}

resource "aws_instance" "bremen" {
  ami           = "ami-2757f631"
  instance_type = "t2.micro"
  key_name = "terraform_ec2_key"
  security_groups = ["${aws_security_group.tincdemo_sg.name}"]
}

resource "aws_instance" "hannover" {
  ami           = "ami-2757f631"
  instance_type = "t2.micro"
  key_name = "terraform_ec2_key"
  security_groups = ["${aws_security_group.tincdemo_sg.name}"]
}

resource "aws_instance" "kremvax" {
  ami           = "ami-2757f631"
  instance_type = "t2.micro"
  key_name = "terraform_ec2_key"
  security_groups = ["${aws_security_group.tincdemo_sg.name}"]
}
