# Jenkins

- Jenkins을 활용하여 web code(frontend, backend) docker 이미지 파일로 docker hub에 저장
- master , slave 노드로 구성하여 부하 분산 

## JenKins 설치

```bash
sudo apt-get update
sudo apt-get install openjdk-11-jdk
wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add -
echo deb http://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 5BA31D57EF5975CA

sudo apt-get install jenkins

sudo systemctl start jenkins
sudo cat /var/lib/jenkins/secrets/initialAdminPassword  # 비밀번호 확인
```


## ansible , docker 설치

### git 설치
```bash
sudo apt-get install -y git
```

### maven 설치
```bash
sudo apt-get install -y git
```

### ansible 설치
```bash
sudo add-apt-repository ppa:ansible/ansible
sudo apt install ansible -y
```

### Docker 설치

```bash
sudo apt-get update
sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io
sudo groupadd docker
sudo usermod -aG docker ${USER}
newgrp docker
```