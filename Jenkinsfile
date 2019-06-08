pipeline{
	agent any
	
	stages{
		stage('Git Checkout ') {
 			 steps {
  			  git credentialsId: 'usernamepassword', url: 'https://github.com/saivikas408/my-app.git'
			}
		}
		stage('Build'){
			tools {
					maven 'mvnhome'
			}
			steps {
				sh "mvn clean package"			
			}
		}
	}
}
