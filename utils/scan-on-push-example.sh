#!/usr/bin/env bash

# Enumerate docker repositories.

DOCKER_REPOSITORIES=(
    "busybox"
)

# Migrate by docker pulling and pushing.

for DOCKER_REPOSITORY in ${DOCKER_REPOSITORIES[@]};
do

    # https://docs.aws.amazon.com/cli/latest/reference/ecr/put-image-scanning-configuration.html

    aws ecr put-image-scanning-configuration \
      --repository-name ${DOCKER_REPOSITORY} \
      --image-scanning-configuration scanOnPush=true \
      --region us-east-1

done
