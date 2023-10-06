resource "aws_instance" "my-ec2-bastion" {

  ami                         = "ami-0c9c942bd7bf113a2"  # "ami-0454bb2fefc7de534" - ubuntu
  associate_public_ip_address = "true"
  availability_zone           = "ap-northeast-2c"

  iam_instance_profile        = aws_iam_instance_profile.my-ec2-instance-profile.name
  key_name                    = "mykeypair"                             ## 해당 키 페어 입력
 
  capacity_reservation_specification {
    capacity_reservation_preference = "open"
  }

  credit_specification {
    cpu_credits = "standard"
  }

  disable_api_termination = "false"
  ebs_optimized           = "false"

  enclave_options {
    enabled = "false"
  }

  get_password_data                    = "false"
  hibernation                          = "false"

  instance_initiated_shutdown_behavior = "stop"
  instance_type                        = "t2.micro"
  ipv6_address_count                   = "0"
  metadata_options {
    http_endpoint               = "enabled"
    http_put_response_hop_limit = "1"
    http_tokens                 = "optional"
  }

  monitoring = "false"

  root_block_device {
    delete_on_termination = "true"
    encrypted             = "false"

    tags = {
      Name        = "my-ec2-bastion-ebs"
    }

    volume_size = "8"
    volume_type = "gp2"
  }

  source_dest_check = "true"


  tags = {
    Name        = "my-ec2-bastion"
  }

  tags_all = {
    Name        = "my-ec2-bastion"
  }

  tenancy       = "default"

  subnet_id     = aws_subnet.my-public-subnet-c.id
  vpc_security_group_ids = [aws_security_group.my-sg-bastion.id]
}


## ubuntu - jenkins-master

resource "aws_instance" "my-jenkins-master" {
  ami                         = "ami-0c9c942bd7bf113a2"  # "ami-0454bb2fefc7de534" - ubuntu
  associate_public_ip_address = "true"
  availability_zone           = "ap-northeast-2a"
  key_name                    = "mykeypair"
  subnet_id                   = aws_subnet.my-public-subnet-a.id
  vpc_security_group_ids      = [aws_security_group.jenkins-sg.id]
  instance_type               = "t3a.medium"
  tags = {
    Name = "jenkins-master"
  }
}

# ubuntu - jenkins-node

resource "aws_instance" "my-jenkins-node" {
  ami                         = "ami-0c9c942bd7bf113a2"  # "ami-0454bb2fefc7de534" - ubuntu
  associate_public_ip_address = "true"
  availability_zone           = "ap-northeast-2a"
  key_name                    = "mykeypair"
  subnet_id                   = aws_subnet.my-public-subnet-a.id
  vpc_security_group_ids      = [aws_security_group.jenkins-sg.id]
  instance_type               = "t3a.medium"
  tags = {
    Name = "jenkins-node"
  }
}
