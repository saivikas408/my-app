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
		stage('Building Docker Image') {
			steps {
				sh 'docker build -t vikasawsdemo/mvnpipeline:v1 .'
			}
		}
		stage('Push Docker Image to HUB') {
			steps {
				withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'dockerpassword', usernameVariable: 'dockerusername')]) {
					sh "docker login -u ${dockerusername} -p ${dockerpassword}"
				}
				sh 'docker push vikasawsdemo/mvnpipeline:v1'
			}
		}
		stage('Running Image') {
			steps {
				sh 'docker run -d -p 9000:8080 vikasawsdemo/mvnpipeline:v1'
			}
		}
	}
}
