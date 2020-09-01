#!/usr/bin/env bash

ARCH=$(uname -m)

echo $ARCH

# Docker
DOCKER_VERSION=19.03.12
if [[ ${ARCH} == 'x86_64' ]]; then
  curl -f https://download.docker.com/linux/static/stable/x86_64/docker-$DOCKER_VERSION.tgz | tar xvz && \
  mv docker/docker /usr/bin/ && \
  rm -rf docker
elif [[ ${ARCH} == 'aarch64' ]]
then
  curl -f https://download.docker.com/linux/static/stable/aarch64/docker-$DOCKER_VERSION.tgz | tar xvz && \
  mv docker/docker /usr/bin/ && \
  rm -rf docker
else
  echo "do not support this arch"
  exit 1
fi

# Helm
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh

# kubectl
if [[ ${ARCH} == 'x86_64' ]]; then
  curl -f -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl && \
  chmod +x kubectl && \
  mv kubectl /usr/bin/
elif [[ ${ARCH} == 'aarch64' ]]
then
  curl -f -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/arm64/kubectl && \
  chmod +x kubectl && \
  mv kubectl /usr/bin/ && kubectl --help
else
  echo "do not support this arch"
  exit 1
fi
