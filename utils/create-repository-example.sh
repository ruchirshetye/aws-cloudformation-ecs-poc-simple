#!/usr/bin/env bash

# Enumerate docker repositories.

DOCKER_REPOSITORIES=(
    "example-repository"
)

# Migrate by docker pulling and pushing.

for DOCKER_REPOSITORY in ${DOCKER_REPOSITORIES[@]};
do

    # https://awscli.amazonaws.com/v2/documentation/api/latest/reference/ecr/create-repository.html

    aws ecr create-repository \
        --repository-name ${DOCKER_REPOSITORY} \
        --image-tag-mutability IMMUTABLE \
        --image-scanning-configuration scanOnPush=true

done
