resource "aws_vpc"  "my-vpc"{
    cidr_block = "10.1.0.0/16"     # 해당 vpc 네트워크
    enable_dns_hostnames = true
    enable_dns_support = true
    instance_tenancy = "default"
    tags = {
        Name = "my -vpc"
    }
}



# 보조 vpc 생성

resource "aws_vpc_ipv4_cidr_block_association" "my-sencond-vpc" {
  vpc_id        = aws_vpc.my-vpc.id
  cidr_block    = "100.64.0.0/16" # 두 번째 CIDR 블록
}




# igw
resource "aws_internet_gateway" "my-ig"{
  vpc_id = aws_vpc.my-vpc.id
  tags = {
    Name = "my-ig"
  }
}

# Nat gateway
resource "aws_eip" "nat-eip"{                         # 탄력적 IP 할당
    vpc = true
}


# nat gateway

resource "aws_nat_gateway" "my-nat-gateway" {

  allocation_id     = aws_eip.nat-eip.id
  subnet_id         = aws_subnet.my-public-subnet-a.id
  connectivity_type = "public"

  tags = {
    Name        = "my-nat-gateway"
  }

  tags_all = {
    Name        = "my-nat-gateway"
  }

}


