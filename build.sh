#!/bin/bash

CCI_DIR=${PWD}
BUILD_DIR=${BUILD_DIR:-${HOME}/rabbitmq-public-umbrella}
RABBIT_TAG=${RABBIT_TAG:-rabbitmq_v3_5_6}
make ${BUILD_DIR}/co

cd ${BUILD_DIR}
#make BRANCH=${RABBIT_TAG} up_c
if [ -d ${BUILD_DIR}/autocluster ]; then
    rm -rf ${BUILD_DIR}/autocluster
fi
mkdir -p ${BUILD_DIR}/autocluster
cp -r ${CCI_DIR}/* ${CCI_DIR}/.tool-versions ${BUILD_DIR}/autocluster/
cd ${BUILD_DIR}/autocluster

make test