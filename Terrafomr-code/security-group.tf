########### EKS Security Group ###########

resource "aws_security_group" "my-sg-eks-cluster" {
  name        = "test-sg-eks-cluster"
  description = "security_group for test-eks-cluster"
  vpc_id      = aws_vpc.my-vpc.id

  tags = {
    Name = "mt-sg-eks-cluster"
  }

  ingress {
  description       = "ingress security_group_rule for test-eks-cluster"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  }

  egress {
description       = "egress security_group_rule for test-eks-cluster"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  }
}

########### Bastion (EC2 Instance) Security Group ###########

resource "aws_security_group" "my-sg-bastion" {

  name   = "test-sg-bastion"
  vpc_id = aws_vpc.my-vpc.id

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "ingress security_group_rule for bastion"
    from_port   = "22"
    protocol    = "tcp"
    self        = "false"
    to_port     = "22"
  }

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "egress security_group_rule for bastion"
    from_port   = "0"
    protocol    = "tcp"
    self        = "false"
    to_port     = "65535"
  }

  tags = {
    Name = "test-sg-bastion"
  }
}

############ EFS Security Group ######################
resource "aws_security_group" "my-sg-efs" {
  description = "my EFS security group"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "2049"
    protocol    = "tcp"
    self        = "false"
    to_port     = "2049"
  }

  name   = "my-sg-efs"
  vpc_id = aws_vpc.my-vpc.id
}

## db sg
resource "aws_security_group" "app-rds-sg"{
    name = "app-rds-sg"
    vpc_id = aws_vpc.my-vpc.id

    ingress {
        from_port = 3306
        to_port = 3306
        protocol = "tcp"
        security_groups = [aws_security_group.my-sg-bastion.id]
    }

    ingress {
        from_port = 3306
        to_port = 3306
        protocol = "tcp"
        security_groups = [aws_security_group.my-sg-eks-cluster.id]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

# Jenkins sg
resource "aws_security_group" "jenkins-sg" {
  name = "jenkins-sg"
  vpc_id = aws_vpc.my-vpc.id

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    to_port = 0
    from_port = 0
    protocol = "-1"

  }
    egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  } 
}