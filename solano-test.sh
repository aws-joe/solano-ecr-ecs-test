#!/bin/bash

export AWS_ACCESS_KEY_ID=$AWS_ASSUME_ROLE_ACCESS_KEY_ID
export AWS_SECRET_ACCESS_KEY=$AWS_ASSUME_ROLE_SECRET_ACCESS_KEY
export AWS_SESSION_TOKEN=$AWS_ASSUME_ROLE_SESSION_TOKEN

sudo docker run ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com/${DOCKER_APP}:${TDDIUM_SESSION_ID} /usr/bin/php /var/www/html/www/index.php
AWSELBDNS=`aws elb describe-load-balancers --load-balancer-names ${AWS_ELB_NAME} --region ${AWS_DEFAULT_REGION} | jq ".LoadBalancerDescriptions[] | .CanonicalHostedZoneName" | xargs`
FULL_ELB_DNS="http://${AWSELBDNS}/"
echo "ELB URL: $FULL_ELB_URL"
