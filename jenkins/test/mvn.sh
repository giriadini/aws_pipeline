#! /bin/bash

echo "****************************"
echo "**** testing the jar ****"
echo "****************************"

WORKSPACE=/Users/giriadini/Documents/Docker-Images/jenkins/jenkins_home/workspace/aws_pipeline

docker run --rm  -v $WORKSPACE/gitClient:/app -v /Users/giriadini/dockermount_share/.m2:/root/.m2 -w /app maven:3-alpine "$@"
