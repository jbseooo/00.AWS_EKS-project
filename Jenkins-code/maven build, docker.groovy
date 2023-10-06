pipeline {
    agent {label 'slave1'}
    stages {
        stage ('Workspace Clean') {
            steps {
             cleanWs()
            }
        }
        stage ('git clone') {
            steps {
                sh  """
                    git clone https://github.com/kimdragon50/facam-backend.git 
                    """
            }
        }
        stage ('Maven Build') {
            steps {
                sh  """
                    cd /home/ubuntu/workspace/test_docker-hub/facam-backend
                    mvn clean
                    mvn package 
                    """
            }
        }

        stage ('Ansible Deploy docker hub') {
            steps {
                script {
                    sh  """
                        cd /home/ubuntu/workspace/test_docker-hub/facam-backend
                        git clone https://github.com/jominjun94/ansible_repository.git
                        cd ansible_repository
                        mv * ../
                        cd ..
                        ansible-playbook create-cicd-project-image-playbook.yml

                        """
                }
            }
        }

    }
}