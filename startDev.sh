#!/bin/bash
USER_ID=$(id -u)
GROUP_ID=$(id -g)
USER_NAME=$(whoami)
MASTERPORTAL_VERSION=v2.30.0

rm -f .env
touch .env

echo "UID=${USER_ID}"  >> .env
echo "GID=${GROUP_ID}" >> .env
echo "UNAME=${USER_NAME}" >> .env
echo "MASTERPORTAL_VERSION=${MASTERPORTAL_VERSION}" >> .env
