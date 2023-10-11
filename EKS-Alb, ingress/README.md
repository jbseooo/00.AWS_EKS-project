# AWS EKS ALB , INGRESS
- aws eks을 통해 로드밸런서 설정 

## service account 생성

```bash
eksctl create iamserviceaccount \
--namespace=kube-system \
--cluster=my-eks-cluster \
--name=aws-load-balancer-controller \
--attach-policy-arn=arn:aws:iam::057059131310:policy/my-alb-iam-policy \
--override-existing-serviceaccounts \
--approve

eksctl utils associate-iam-oidc-provider --region=ap-northeast-2 --cluster=my-eks-cluster --approve 

eksctl delete iamserviceaccount   --cluster=my-eks-cluster  --namespace=kube-system   --name=aws-load-balancer-controller

eksctl create iamserviceaccount \
--namespace=kube-system \
--cluster=my-eks-cluster \
--name=aws-load-balancer-controller \
--attach-policy-arn=arn:aws:iam::057059131310:policy/my-alb-iam-policy \
--override-existing-serviceaccounts \
--approve
```

## policy 권한 추가
```bash
cat << EOF > alb-iam-patch.json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "elasticloadbalancing:AddTags",
            "Effect": "Allow",
            "Resource": "*",
            "Sid": "patch"
        }
    ]
}
EOF

aws iam put-role-policy --role-name eksctl-my-eks-cluster-addon-iamserviceaccoun-Role1-1QTIMKUJAP5LS --policy-name my-alb-iam-policy --policy-document file://alb-iam-patch.json
```

## Helm 설치 
```bash
curl -L https://git.io/get_helm.sh | bash -s -- --version v3.8.
helm repo add eks https://aws.github.io/eks-charts
```

## aws-load-balancer-controller 설치
```bash
helm install aws-load-balancer-controller eks/aws-load-balancer-controller \
-n kube-system \
--set clusterName=my-eks-cluster \
--set serviceAccount.create=false \
--set serviceAccount.name=aws-load-balancer-controller
```


##  name space 생성 및 ingress 설치
```bash
kubectl create namespace game-2048
kubectl apply -f install-ingress.yaml
```

