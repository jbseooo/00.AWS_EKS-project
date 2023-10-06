# public-subnet - a
resource "aws_subnet" "my-public-subnet-a"{
    vpc_id = aws_vpc.my-vpc.id
    cidr_block = "10.1.1.0/26"
    map_public_ip_on_launch = true  # 자동으로 퍼블릭 ip 할당
    availability_zone = "ap-northeast-2a"
    tags = {
        Name = "my-public-subnet-a",
        "kubernetes.io/cluster/my-eks-cluster" = "shared"
        "kubernetes.io/role/elb"                 = 1
    }
}

# public-subnet - a
resource "aws_subnet" "my-public-subnet-c"{
    vpc_id = aws_vpc.my-vpc.id
    cidr_block = "10.1.1.64/26"
    map_public_ip_on_launch = true  # 자동으로 퍼블릭 ip 할당
    availability_zone = "ap-northeast-2c"
    tags = {
        Name = "my-public-subnet-c",
        "kubernetes.io/cluster/my-eks-cluster" = "shared"
        "kubernetes.io/role/elb"                 = 1
    }
}



#pod subnet -a  
resource "aws_subnet" "my-private-subnet-eks-pod-a" {

  depends_on = [
    aws_vpc.my-vpc
  ]

  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "100.64.0.0/19"
  enable_dns64                                   = "false"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  # map_public_ip_on_launch                        = "true"
  private_dns_hostname_type_on_launch            = "ip-name"

  tags = {
    Name                                     = "my-private-subnet-eks-pod-a"
    "kubernetes.io/cluster/my-eks-cluster" = "shared"
  }

  tags_all = {
    Name                                     = "my-private-subnet-eks-pod-a"
    "kubernetes.io/cluster/my-eks-cluster" = "shared"
  }

  vpc_id = aws_vpc.my-vpc.id
  availability_zone = "ap-northeast-2a"
}


#pod subnet -c
resource "aws_subnet" "my-private-subnet-eks-pod-c" {

  depends_on = [
    aws_vpc.my-vpc
  ]

  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "100.64.32.0/19"
  enable_dns64                                   = "false"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  # map_public_ip_on_launch                        = "true"
  private_dns_hostname_type_on_launch            = "ip-name"

  tags = {
    Name                                     = "my-private-subnet-eks-pod-c"
    "kubernetes.io/cluster/my-eks-cluster" = "shared"
  }

  tags_all = {
    Name                                     = "my-private-subnet-eks-pod-c"
    "kubernetes.io/cluster/my-eks-cluster" = "shared"
  }

  vpc_id = aws_vpc.my-vpc.id
  availability_zone = "ap-northeast-2c"
}

# private-subnet-db-a
resource "aws_subnet" "my-private-subnet-db-a"{
    vpc_id = aws_vpc.my-vpc.id
    cidr_block = "10.1.1.192/27"
    availability_zone = "ap-northeast-2a"
    tags = {
        Name = "my-private-subnet-db-a"
    }
}

# private-subnet-db-c
resource "aws_subnet" "my-private-subnet-db-c"{
    vpc_id = aws_vpc.my-vpc.id
    cidr_block = "10.1.1.224/27"
    availability_zone = "ap-northeast-2c"
    tags = {
        Name = "my-private-subnet-db-c"
    }
}
















