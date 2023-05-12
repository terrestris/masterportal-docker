#!/bin/bash

# Stop at first command failure.
set -e

USER_ID=$(id -u)
GROUP_ID=$(id -g)
USER_NAME=$(whoami)
MASTERPORTAL_VERSION=v2.33.0

rm -f .env
touch .env

SCRIPT_DIR=$(dirname "${BASH_SOURCE[0]}")
ENV_FILE=.env

echo "UID=${USER_ID}"  >> $SCRIPT_DIR/$ENV_FILE
echo "GID=${GROUP_ID}" >> $SCRIPT_DIR/$ENV_FILE
echo "UNAME=${USER_NAME}" >> $SCRIPT_DIR/$ENV_FILE
echo "MASTERPORTAL_VERSION=${MASTERPORTAL_VERSION}" >> $SCRIPT_DIR/$ENV_FILE

if [ ! -d "masterportal" ]; then
    git clone https://geowerkstatt@bitbucket.org/geowerkstatt-hamburg/masterportal.git masterportal
fi

cd masterportal
# checkout version tag
git checkout $MASTERPORTAL_VERSION
# install dependencies
npm i

# # disable host check in webpack in order to get apache proxy working together with webpack
sed -i 's;port: 9001,;port: 9001,disableHostCheck: true,;' devtools/webpack.dev.js
# # disable https to get hot reload running again
sed -i 's;https: true,;https: false,;' devtools/webpack.dev.js

# create certificate for local development
cd ..
printf "Create the SSL certificate\n"

openssl req \
  -config ./nginx/ssl/localhost.conf \
  -batch \
  -x509 \
  -nodes \
  -days 3650 \
  -newkey rsa:2048 \
  -keyout ./nginx/ssl/private/localhost.key \
  -out ./nginx/ssl/private/localhost.crt
