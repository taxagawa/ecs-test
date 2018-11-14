#!/bin/bash

set -e
sleep 5

AWS_REGION=ap-northeast-1
AWS_CODEDEPLOY_APPLICATION_NAME=smartmat-app
AWS_CODEDEPLOY_DEPLOYMENT_GROUP=smartmat-deploy-group
AWS_CODEDEPLOY_DEPLOYMENT_GROUP_ID=$( aws deploy get-deployment-group --application-name ${AWS_CODEDEPLOY_APPLICATION_NAME} --deployment-group-name ${AWS_CODEDEPLOY_DEPLOYMENT_GROUP} --region ${AWS_REGION} | jq --raw-output ".deploymentGroupInfo.deploymentGroupId" )

# Remove the old docker images and kill working containers
docker kill $( docker ps -aq ) 2>/dev/null || true
docker system prune -f 2>/dev/null || true
docker rmi -f $( docker images -q ) 2>/dev/null || true

# Delete mounted folder and revision on last time
REMOVE_FOLDER=$( aws deploy list-deployments --region ${AWS_REGION} | jq --raw-output ".deployments[1]" )
rm -rf /opt/codedeploy-agent/deployment-root/${AWS_CODEDEPLOY_DEPLOYMENT_GROUP_ID}/${REMOVE_FOLDER} 2>/dev/null || true
rm -rf /opt/codedeploy-agent/deployment-root/deployment-instructions/ 2>/dev/null || true
