# resource "aws_eks_node_group" "my-eks-nodegroup" {
#   cluster_name    = aws_eks_cluster.my-eks-cluster.name
#   node_group_name = "my-eks-nodegroup"
#   node_role_arn   = aws_iam_role.my-iam-role-eks-nodegroup.arn
#   subnet_ids      = [aws_subnet.my-private-subnet-eks-pod-a.id , aws_subnet.my-private-subnet-eks-pod-c.id]
#   instance_types = ["t3a.medium"]
#   disk_size = 20

#   labels = {
#     "role" = "eks-nodegroup"
#   }

#   scaling_config {
#     desired_size = 2
#     min_size     = 1
#     max_size     = 3
#   }

#   depends_on = [
#     aws_iam_role_policy_attachment.my-iam-policy-eks-nodegroup,
#     aws_iam_role_policy_attachment.my-iam-policy-eks-nodegroup-cni,
#     aws_iam_role_policy_attachment.my-iam-policy-eks-nodegroup-ecr,
#   ]

#   tags = {
#     "Name" = "${aws_eks_cluster.my-eks-cluster.name}-worker-node"
#   }
# }

resource "aws_eks_node_group" "my-eks-nodegroup" {
  cluster_name    = aws_eks_cluster.my-eks-cluster.name
  node_group_name = "my-eks-nodegroup"
  node_role_arn   = aws_iam_role.my-iam-role-eks-nodegroup.arn
  subnet_ids      = [aws_subnet.my-private-subnet-eks-pod-a.id, aws_subnet.my-private-subnet-eks-pod-c.id]
  instance_types = ["t3a.medium"]
  disk_size = 20

  labels = {
    "role" = "eks-nodegroup"
  }

  scaling_config {
    desired_size = 2
    min_size     = 1
    max_size     = 3
  }

  depends_on = [
    aws_iam_role_policy_attachment.my-iam-policy-eks-nodegroup,
    aws_iam_role_policy_attachment.my-iam-policy-eks-nodegroup-cni,
    aws_iam_role_policy_attachment.my-iam-policy-eks-nodegroup-ecr,
  ]

  tags = {
    "Name" = "${aws_eks_cluster.my-eks-cluster.name}-worker-node"
  }
}