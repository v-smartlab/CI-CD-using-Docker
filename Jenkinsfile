pipeline {
    agent any
	
	  tools
    {
       maven "apache-maven-3.9.2"
    }
 stages {
      stage('checkout') {
           steps {
             
                git branch: 'master', url: 'https://github.com/v-smartlab/CI-CD-using-Docker.git'
             
          }
        }
	 stage('Execute Maven') {
           steps {
             
                //sh 'mvn package'    
		            bat 'mvn package'
          }
        }
        

  stage('Docker Build image') {
           steps {
              
                bat 'docker build -t vsmartlab/samplewebapp .' 
      //          bat 'docker tag samplewebapp vsmartlab/samplewebapp:latest'
                //sh 'docker tag samplewebapp nikhilnidhi/samplewebapp:$BUILD_NUMBER'
               
          }
        }
     
  stage('Stop Docker container if it"s running') {
          
        steps {
       // withDockerRegistry([ credentialsId: "dockerHub", url: "" ]) {
          //bat  'docker stop samplewebapp-demo || true && docker rm samplewebapp-demo || true'
          bat  'docker stop $(docker ps -a -f name=samplewebapp-demo -q)'                  
          }
        }
/*
    stage('delete Docker contain if it"s exits') {
          
        steps {
       // withDockerRegistry([ credentialsId: "dockerHub", url: "" ]) {
          //bat  'docker stop samplewebapp-demo || true && docker rm samplewebapp-demo || true'
          bat  'docker rm $(docker ps -a -f name=samplewebapp-demo -q)'  
          bat  'docker container ls -al | grep samplewebapp-demo && docker container rm -f samplewebapp-demo '                 
          }
        }
      */
  stage('Run Docker container on Jenkins Agent') {
          
        steps 
        {
            bat "docker run -d -p 8082:8080 --name samplewebapp-demo vsmartlab/samplewebapp"

        }
  }
 //stage('Run Docker container on remote hosts') {
             
            //steps {
            //    sh "docker -H ssh://jenkins@172.31.28.25 run -d -p 8003:8080 nikhilnidhi/samplewebapp"
 
            //}
        //}
    }
	}
    
