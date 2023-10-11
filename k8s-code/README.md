# kubernetes

- 해당 코드는 aws 내 eks에 영향을 주는 코드입니다.


## create-cicd-project-image-playbook
- 해당 코드는 운영하고자 하는 서비스를 도커파일로 만들어 jbseo123 이라는 docker hub에 저장시킵니다. 


## argo-cd-deploy-playbook
- 이 코드의 경우 argocd gitops을 통해 k8s을 관리하기 위한 ansible playbook 입니다.
- 해당 코드는 gitops-repository을 참고하며, 이를 통해 사전에 docker hub에 있는 이미지를 배포 및 service을 실행시킵니다.
- gitops-repository URL : https://github.com/jbseooo/gitops-repository
