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
					 	sh 'mvn package' 
				  }
			}	 /*       
		  	stage('Docker Build image') {
		           steps {		              
		                sh 'docker build -t vsmartlab/samplewebapp .'                
		          }
		    }	*/
		  	stage('Run Docker container on Jenkins Agent') {		          
			        steps 
			        {
			            sh "docker run -d -p 8082:8080 --name samplewebapp-demo vsmartlab/samplewebapp"			
			        }
		  	}
		}
}
    
