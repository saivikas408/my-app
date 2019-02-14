node{
  stage('git checkout') {
    git credentialsId: 'gituserpass', url: 'https://github.com/saivikas408/my-app.git' 
  }
  stage('Build'){
    def HOME = tool name: 'mymvn', type: 'maven'
    def mvnHOME = "${HOME}/bin/mvn"
    sh "${mvnHOME} clean package"
  }
  stage('Docker Build image'){
   sh label: '', script: 'docker build -t saivikas408/my-app:2.0.0 .'
  }
  stage('push to DockerHub'){
    withCredentials([string(credentialsId: 'f47160ce-2157-47bd-96b9-8d7052ede4b2', variable: 'password')]) {
      sh "docker login -u saivikas408 -p ${password}"
    }
   sh label: '', script: 'docker push saivikas408/my-app:2.0.0'
  }
  stage('Run the container'){
    sshagent(['sshkey']) {
      def dockerrun = 'docker run -d -p 9090:8080 --name testtomcat saivikas408/my-app:2.0.0'
      sh label: '', script: "ssh -o StrictHostKeyChecking=no ec2-user@52.87.210.119 ${dockerrun}"
    }
  
  }
}
