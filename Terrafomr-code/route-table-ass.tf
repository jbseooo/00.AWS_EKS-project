
# my public route
resource "aws_route_table_association" "my-public-subnet-a_association"{
    subnet_id = aws_subnet.my-public-subnet-a.id
    route_table_id = aws_route_table.my-public-route-a.id
}

resource "aws_route_table_association" "my-public-subnet-c_association"{
    subnet_id = aws_subnet.my-public-subnet-c.id
    route_table_id = aws_route_table.my-public-route-c.id
}


# my private route
resource "aws_route_table_association" "my-private-subnet-a_association"{
    subnet_id = aws_subnet.my-private-subnet-eks-pod-a.id
    route_table_id = aws_route_table.my-private-route-a.id
}

resource "aws_route_table_association" "my-private-subnet-c_association"{
    subnet_id = aws_subnet.my-private-subnet-eks-pod-c.id
    route_table_id = aws_route_table.my-private-route-c.id
}

# my private route db
resource "aws_route_table_association" "my-private-subnet-db-a_association"{
    subnet_id = aws_subnet.my-private-subnet-db-a.id
    route_table_id = aws_route_table.my-private-route-db.id
}

resource "aws_route_table_association" "my-private-subnet-db-c_association"{
    subnet_id = aws_subnet.my-private-subnet-db-c.id
    route_table_id = aws_route_table.my-private-route-db.id
}

