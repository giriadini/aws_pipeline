#! /bin/bash

# copy the newly built jar to build location
cp -f gitClient/target/*.jar jenkins/deploy


echo "************************"
echo "**** copying docker image *****"
echo "************************"

aws s3 cp gitClient/target/*.jar s3://gar-hw-aws2 
