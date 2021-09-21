pipeline {
    agent any 
    stages {
        stage('Compile and Clean') { 
            steps {

                sh "mvn clean compile"
            }
        }
       

        stage('deploy') { 
            steps {
                sh "mvn package"
            }
        }


        stage('Build Docker image'){
            steps {
              
                sh 'docker build -t  arjunm385/revature-railways-backend .'
            }
        }

        stage('Docker Login'){
            
            steps {
                    withCredentials([string(credentialsId: 'DockerId', variable: 'Dockerpwd')]) {
                    sh "docker login -u arjunm385 -p ${Dockerpwd}"
                }
                
            }                
        }

        stage('Docker Push'){
            steps {
                sh 'docker push arjunm385/revature-railways-backend'
            }
        }
        
        stage('Docker deploy'){
            steps {
               sh 'docker rm -f arjunm385/revature-railways-backend'
                sh 'docker run --name revature-railways-backend -itd -p  8090:9848 arjunm385/revature-railways-backend'
            }
        }

        
        stage('Archving') { 
            steps {
                 archiveArtifacts '**/target/*.jar'
            }
        }
    }
}