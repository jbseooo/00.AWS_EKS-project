pipeline {
    agent {label 'slave1'}
    stages {



        stage ('ansible git clone') {
            steps {
                sh  """
                    git clone https://github.com/jominjun94/ansible_repository.git
                    """
            }
        }



        stage ('Ansible Deploy kubernetes argocd') {
            steps {
                script {
                    sh  """
                        cd /home/ubuntu/workspace/test_docker-hub/ansible_repository
                        ansible-playbook argo-cd-deploy-playbook.yml

                        """
                }
            }
        }

    }
}