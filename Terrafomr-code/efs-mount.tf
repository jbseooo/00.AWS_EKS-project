resource "aws_efs_mount_target" "my-efs-mount-target1" {

  file_system_id  = aws_efs_file_system.efs-file-system.id
  security_groups = [aws_security_group.my-sg-efs.id]
  subnet_id       = aws_subnet.my-private-subnet-eks-pod-a.id
}

resource "aws_efs_mount_target" "test-efs-mount-target3" {

  file_system_id  = aws_efs_file_system.efs-file-system.id
  security_groups = [aws_security_group.my-sg-efs.id]
  subnet_id       = aws_subnet.my-private-subnet-eks-pod-c.id
}