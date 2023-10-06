resource "aws_iam_instance_profile" "my-ec2-instance-profile" {
  name = "my-ec2-instance-profile"
  path = "/"
  role = "my-iam-role-ec2-instance-bastion"
}
