#!/bin/bash

AWS_ACCOUNT_ID=$( aws sts get-caller-identity --query "Account" --output text )
AWS_REGION=ap-northeast-1
AWS_CODEDEPLOY_APPLICATION_NAME=smartmat-app
AWS_CODEDEPLOY_DEPLOYMENT_GROUP=smartmat-deploy-group
AWS_CODEDEPLOY_DEPLOYMENT_GROUP_ID=$( aws deploy get-deployment-group --application-name ${AWS_CODEDEPLOY_APPLICATION_NAME} --deployment-group-name ${AWS_CODEDEPLOY_DEPLOYMENT_GROUP} --region ${AWS_REGION} | jq --raw-output ".deploymentGroupInfo.deploymentGroupId" )

# CIRCLE_SHA1 is updated during the process in config.yml
CIRCLE_SHA1=XXXXXXXXXXXXXXXXXXXX

# Pull the latest docker image from ECR using its credential-helper
#docker pull ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/smartmat.jp:${CIRCLE_SHA1}

# disable SELinux
setsebool -P httpd_setrlimit 1

# Load compressed docker image
TAR_FOLDER_NAME=$( aws deploy list-deployments --region ${AWS_REGION} | jq --raw-output ".deployments[0]" )
docker load < /opt/codedeploy-agent/deployment-root/${AWS_CODEDEPLOY_DEPLOYMENT_GROUP_ID}/${TAR_FOLDER_NAME}/deployment-archive/image.tar

# Run the latest docker image for smartmat client and server
cd /opt/codedeploy-agent/deployment-root/${AWS_CODEDEPLOY_DEPLOYMENT_GROUP_ID}/${TAR_FOLDER_NAME}/deployment-archive/
docker-compose up -d

# remove dummy file
rm /tmp/dummy.txt
