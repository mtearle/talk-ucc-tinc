
# berkeley 172.16.86.10/32 us-west-1
# tymnet 172.16.86.20/32 us-east-1
# mitre 172.16.86.30/32 us-east-2
# bremen 172.16.86.40/32 eu-central-1
# hannover 172.16.86.50/32 eu-west-2
# 
# kremvax 172.16.99.0/24 172.16.99.1 eu-north-1


resource "aws_key_pair" "terraform_ec2_key" {
  key_name = "terraform_ec2_key"
  public_key = file("~/.ssh/id_rsa.pub")
}

#Error: Error launching source instance: InvalidGroup.NotFound: The security group 'sg-01295d8cfb735d7cf' does not exist in VPC 'vpc-e7a67c8e'
#        status code: 400, request id: 85ba52fc-0b95-4863-a1ad-12354cdfaab7

resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

resource "aws_security_group" "tincdemo_sg" {
  name = "tincdemo_sg"
  vpc_id=aws_default_vpc.default.id

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

resource "aws_security_group" "berkeley_sg" {
  name = "berkeley_sg"
  vpc_id=aws_default_vpc.default.id

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

resource "aws_security_group" "tymnet_sg" {
  name = "tymnet_sg"
  vpc_id=aws_default_vpc.default.id

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

resource "aws_security_group" "mitre_sg" {
  name = "mitre_sg"
  vpc_id=aws_default_vpc.default.id

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

resource "aws_security_group" "bremen_sg" {
  name = "bremen_sg"
  vpc_id=aws_default_vpc.default.id

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

resource "aws_security_group" "hannover_sg" {
  name = "hannover_sg"
  vpc_id=aws_default_vpc.default.id

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

resource "aws_security_group" "kremvax_sg" {
  name = "kremvax_sg"
  vpc_id=aws_default_vpc.default.id

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

# default
provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

provider "aws" {
  alias = "uswest1"
  region  = "us-west-1"
}

provider "aws" {
  alias = "useast2"
  region  = "us-east-2"
}

provider "aws" {
  alias = "eucentral1"
  region  = "eu-central-1"
}

provider "aws" {
  alias = "euwest2"
  region  = "eu-west-2"
}

provider "aws" {
  alias = "eunorth1"
  region  = "eu-north-1"
}

resource "aws_instance" "berkeley" {
  provider	= aws.uswest1
  #cluster_name	= "berkeley"
  ami           = "ami-2757f631"
  instance_type = "t2.micro"
  key_name = aws_key_pair.terraform_ec2_key.key_name
  security_groups = ["${aws_security_group.berkeley_sg.name}"]
}

resource "aws_instance" "tymnet" {
  # default provider
  #cluster_name	= "tymnet"
  ami           = "ami-2757f631"
  instance_type = "t2.micro"
  key_name = aws_key_pair.terraform_ec2_key.key_name
  security_groups = ["${aws_security_group.tymnet_sg.name}"]
}

resource "aws_instance" "mitre" {
  provider	= aws.useast2
  #cluster_name	= "mitre"
  ami           = "ami-2757f631"
  instance_type = "t2.micro"
  key_name = aws_key_pair.terraform_ec2_key.key_name
  security_groups = ["${aws_security_group.mitre_sg.name}"]
}

resource "aws_instance" "bremen" {
  provider	= aws.eucentral1
  #cluster_name	= "bremen"
  ami           = "ami-2757f631"
  instance_type = "t2.micro"
  key_name = aws_key_pair.terraform_ec2_key.key_name
  security_groups = ["${aws_security_group.bremen_sg.name}"]
}

resource "aws_instance" "hannover" {
  provider	= aws.euwest2
  #cluster_name	= "hannover"
  ami           = "ami-2757f631"
  instance_type = "t2.micro"
  key_name = aws_key_pair.terraform_ec2_key.key_name
  security_groups = ["${aws_security_group.hannover_sg.name}"]
}

resource "aws_instance" "kremvax" {
  provider	= aws.eunorth1
  #cluster_name	= "kgb"
  ami           = "ami-2757f631"
  instance_type = "t2.micro"
  key_name = aws_key_pair.terraform_ec2_key.key_name
  security_groups = ["${aws_security_group.kremvax_sg.name}"]
}
