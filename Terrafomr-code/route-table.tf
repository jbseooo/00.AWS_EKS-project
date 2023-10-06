# create public route table
resource "aws_route_table" "my-public-route-a"{
    vpc_id = aws_vpc.my-vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.my-ig.id
    }
    tags = {
        Name = "my-public-route-a"
    }
}

resource "aws_route_table" "my-public-route-c"{
    vpc_id = aws_vpc.my-vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.my-ig.id
    }
    tags = {
        Name = "my-public-route-c"
    }
}

## private route table

resource "aws_route_table" "my-private-route-a"{
    vpc_id = aws_vpc.my-vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_nat_gateway.my-nat-gateway.id
    }
    tags = {
        Name = "my-private-pod-a"
    }
}


resource "aws_route_table" "my-private-route-c"{
    vpc_id = aws_vpc.my-vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_nat_gateway.my-nat-gateway.id
    }
    tags = {
        Name = "my-private-pod-c"
    }
}



resource "aws_route_table" "my-private-route-db"{
    vpc_id = aws_vpc.my-vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_nat_gateway.my-nat-gateway.id
    }
    tags = {
        Name = "my-private-route-db"
    }
}

