pipeline {
  agent none
    stages {
        stage('Print Random Output') {
            agent { label 'linux' }
            steps {
                sh "wget https://raw.githubusercontent.com/gwaldvogel/jenkins-vagrant-swarm/master/buildScripts/randomOutput.py"
                sh "chmod +x randomOutput.py"
                sh "./randomOutput.py"
                deleteDir()
            }
        }
    }
}
