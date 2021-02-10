#! /bin/sh

# The repo source code is cloned to $RUNNER_WORKSPACE/$REPO_NAME
# Setup the workspace path to that for easier access later
REPO_NAME=$(basename $RUNNER_WORKSPACE)
WS_PATH=$RUNNER_WORKSPACE/$REPO_NAME

cd /docker-action

echo "Creating a docker image with Dockerhub Tag: $INPUT_DOCKERHUBTAG"
docker build -t docker-action --build-arg dockerhub_tag="$INPUT_DOCKERHUBTAG" .

echo "Run Docker Action container"
docker run -e BRANCH_NAME -e INPUT_DOCKERHUBTAG -e INPUT_CATEGORIES -e DOCKER_WORK_DIR -e DOCKER_DATA_DIR -e DOCKER_USERNAME -e DOCKER_PASSWORD -v $WS_PATH:$GITHUB_WORKSPACE  --workdir $GITHUB_WORKSPACE docker-action
