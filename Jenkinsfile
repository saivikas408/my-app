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
   sh label: '', script: 'docker push saivkas408/my-app:2.0.0'
  }
}
