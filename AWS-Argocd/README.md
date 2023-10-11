# AWS Argocd
- argocd을 이용하여 kubernetes pod 관리


## Argocd namespace 생성
```bash
kubectl create namespace argocd
```

## Argocd 설치 
```bash
kubectl apply -f install-argocd.yaml -n argocd
curl -sSL -o argocd-linux-amd64 https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64 
sudo install -m 555 argocd-linux-amd64 /usr/local/bin/argocd
rm argocd-linux-amd64
```

# 비밀번호 확인
```bash
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo
```
