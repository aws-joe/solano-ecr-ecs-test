#!/bin/bash

#Credentials provided by Solano from AssumeRole dashboard Org configuration
export AWS_ACCESS_KEY_ID=$AWS_ASSUME_ROLE_ACCESS_KEY_ID
export AWS_SECRET_ACCESS_KEY=$AWS_ASSUME_ROLE_SECRET_ACCESS_KEY
export AWS_SESSION_TOKEN=$AWS_ASSUME_ROLE_SESSION_TOKEN

#Log in to AWS ECR Docker Repository
echo "Requesting AWS ECR credentials."
DOCKER_LOGIN=`aws ecr get-login --region $AWS_DEFAULT_REGION`

echo "Performing docker login."
sudo $DOCKER_LOGIN
echo "Login Complete"

sudo docker run ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com/${DOCKER_APP}:${TDDIUM_SESSION_ID} /usr/bin/php /var/www/html/www/index.php > /dev/null
echo $?
