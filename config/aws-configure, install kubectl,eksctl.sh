
aws configure
my access-key_id
my access-key
ap-northeast-2
json

# kubectl 설치
curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.23.6/bin/linux/amd64/kubectl   
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
aws eks update-kubeconfig --region ap-northeast-2 --name my-eks-cluster   


# eksctl 설치
curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
sudo mv -v /tmp/eksctl /usr/local/bin