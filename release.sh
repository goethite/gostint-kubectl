#!/bin/bash -e
# release to docker hub

echo "Logging in to dockerhub"
docker login || exit 2

echo "Building goethite/gostint-kubectl:latest image"
docker build -t goethite/gostint-kubectl:latest . || exit 2

echo "Pushing goethite/gostint-kubectl:latest to dockerhub"
docker push goethite/gostint-kubectl:latest || exit 2
