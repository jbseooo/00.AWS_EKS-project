# db subnet 그룹
resource "aws_db_subnet_group" "my-db-g"{
    name = "my-db-g"
    subnet_ids = [aws_subnet.my-private-subnet-db-a.id , aws_subnet.my-private-subnet-db-c.id]
}

# rds 생성
resource "aws_db_instance" "mydb"{
    db_name = "mydb"
    allocated_storage = 8
    engine = "mysql"
    engine_version = "8.0.33"
    instance_class = "db.t3.micro"
    username = "root"
    password = "test123!"
    db_subnet_group_name = aws_db_subnet_group.my-db-g.id
    vpc_security_group_ids = [aws_security_group.app-rds-sg.id]
    skip_final_snapshot = true
    
}