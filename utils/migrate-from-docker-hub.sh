#!/usr/bin/env bash

# Enumerate docker images to be migrated.
# Format: "SOURCE_IMAGE;TARGET_IMAGE"

DOCKER_IMAGE_NAMES=(
    "busybox;public.ecr.aws/d5v4a2g3/busybox"
    "senzing/entity-search-web-app:2.2.1;public.ecr.aws/d5v4a2g3/entity-search-web-app:2.2.1"
    "senzing/g2configtool:1.4.2;public.ecr.aws/d5v4a2g3/g2configtool:1.4.2"
    "senzing/init-container:1.6.8;public.ecr.aws/d5v4a2g3/init-container:1.6.8"
    "senzing/jupyter:1.2.0;public.ecr.aws/d5v4a2g3/jupyter:1.2.0"
    "senzing/postgresql-client:1.0.0;public.ecr.aws/d5v4a2g3/postgresql-client:1.0.0"
    "senzing/redoer:1.3.5;public.ecr.aws/d5v4a2g3/redoer:1.3.5"
    "senzing/senzing-api-server:2.3.2;public.ecr.aws/d5v4a2g3/senzing-api-server:2.3.2"
    "senzing/sshd:1.1.0;public.ecr.aws/d5v4a2g3/sshd:1.1.0"
    "senzing/stream-loader:1.7.2;public.ecr.aws/d5v4a2g3/stream-loader:1.7.2"
    "senzing/stream-producer:1.4.0;public.ecr.aws/d5v4a2g3/stream-producer:1.4.0"
    "senzing/xterm:1.1.0;public.ecr.aws/d5v4a2g3/xterm:1.1.0"
    "senzing/yum:1.1.4;public.ecr.aws/d5v4a2g3/yum:1.1.4"
    "swaggerapi/swagger-ui:latest;public.ecr.aws/d5v4a2g3/swagger-ui:latest"
)

# Migrate by docker pulling and pushing.

for DOCKER_IMAGE_NAME in ${DOCKER_IMAGE_NAMES[@]};
do

    # Read Source and Target

    IFS=";" read -r -a DOCKER_IMAGE_DATA <<< "${DOCKER_IMAGE_NAME}"
    SOURCE_IMAGE="${DOCKER_IMAGE_DATA[0]}"
    TARGET_IMAGE="${DOCKER_IMAGE_DATA[1]}"

    # Pull and tag

    echo "Pulling ${SOURCE_IMAGE}"
    sudo docker pull ${SOURCE_IMAGE}
    sudo docker tag ${SOURCE_IMAGE} ${TARGET_IMAGE}

    # Push

    echo "Pushing ${TARGET_IMAGE}"
    sudo docker push ${TARGET_IMAGE}
done
