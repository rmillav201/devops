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
        stage('Test') {
            steps {
                sh 'mvn test'
            }
            post {
                always {
                    junit 'target/surefire-reports/*.xml'
                }
            }
        }
        stage('Deploy') {
            steps {
                sh 'whoami'
                sh 'ls -l ./jenkins/scripts/deliver.sh'
                sh 'chmod +x ./jenkins/scripts/deliver.sh'
                sh 'ls -l ./jenkins/scripts/deliver.sh'
                sh 'sudo ./jenkins/scripts/deliver.sh'
            }
        }
    }
}
