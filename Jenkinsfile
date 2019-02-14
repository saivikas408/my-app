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
   sh label: '', script: 'docker build -t saivikas408/my-app:2.0.0'
  }

}
