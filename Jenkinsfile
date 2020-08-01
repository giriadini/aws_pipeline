pipeline {

    agent any
      
    stages {

        stage('Build') {
            steps {
                sh '''
                    ./jenkins/build/mvn.sh mvn -B -DskipTests clean package
                    ./jenkins/build/build.sh
                '''
            }
        }

        stage('Test') {
            steps {
                sh './jenkins/test/mvn.sh mvn test'
            }
        }

        stage('Deploy'){
            steps {

                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'user1', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
                          sh ''' 
                                
                               aws s3 ls 
                               touch /tmp/testfile-1
                               aws s3 cp /tmp/testfile-1 s3://gar-hw-aws2 
                               ./jenkins/deploy/copy.sh

                             '''
                     }
               
            
            
            }
        }

    }
}
