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
        

 // stage('Docker Build and Tag') {
  //         steps {
              
     //           bat 'docker build -t samplewebapp:latest .' 
      //          bat 'docker tag samplewebapp vsmartlab/samplewebapp:latest'
                //sh 'docker tag samplewebapp nikhilnidhi/samplewebapp:$BUILD_NUMBER'
               
       //   }
     //   }
     
 // stage('Publish image to Docker Hub') {
          
          //  steps {
       // withDockerRegistry([ credentialsId: "dockerHub", url: "" ]) {
       //   bat  'docker push vsmartlab/samplewebapp:latest'
        //  sh  'docker push nikhilnidhi/samplewebapp:$BUILD_NUMBER' 
       // }
                  
        //  }
      //  }
     
      stage('Run Docker container on Jenkins Agent') {
             
            steps 
			{
                bat "docker run -d -p 8089:8080 --name samplewebapp-demo vsmartlab/samplewebapp"
 
            }
        }
 //stage('Run Docker container on remote hosts') {
             
            //steps {
            //    sh "docker -H ssh://jenkins@172.31.28.25 run -d -p 8003:8080 nikhilnidhi/samplewebapp"
 
            //}
        //}
    }
	}
    
