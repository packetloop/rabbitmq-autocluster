#!/bin/bash
BUILD_DIR=${BUILD_DIR:-${HOME}/rabbitmq-public-umbrella}
RABBIT_TAG=${RABBIT_TAG:-rabbitmq_v3_5_6}
echo "Build dir: ${BUILD_DIR}"
echo "Travis build dir: ${TRAVIS_BUILD_DIR}"
git clone -b ${RABBIT_TAG} https://github.com/rabbitmq/rabbitmq-public-umbrella.git ${BUILD_DIR}
cd ${BUILD_DIR}
make co
make BRANCH=${RABBIT_TAG} up_c
if [ -d ${BUILD_DIR}/autocluster ]; then
    rm -rf ${BUILD_DIR}/autocluster
fi
mkdir -p ${BUILD_DIR}/autocluster
cp -r ${TRAVIS_BUILD_DIR}/* ${BUILD_DIR}/autocluster/
cd ${BUILD_DIR}/autocluster
