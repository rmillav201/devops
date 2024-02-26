pipeline {
    agent any
    
    tools {
        maven 'mavenjenkins'
    }
    
    stages {
        stage('Build') {
            steps {
                sh 'mvn -B -DskipTests clean package'
            }
        }
        stage('Deploy') {
            steps {
                sh 'whoami'
                sh 'ls -l ./jenkins/scripts/deliver.sh'
                sh 'chmod +x ./jenkins/scripts/deliver.sh'
                sh 'ls -l ./jenkins/scripts/deliver.sh'
                sh './jenkins/scripts/deliver.sh'
            }
        }
    }
}
