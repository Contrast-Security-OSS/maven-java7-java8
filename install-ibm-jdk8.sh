#! /bin/sh
# adapted from: https://github.com/ibmruntimes/ci.docker/blob/a1994e0c3f71ef3ca4c25a5b8e57bb7bd5ec27ff/ibmjava/8/sdk/ubuntu/Dockerfile
# (C) Copyright IBM Corporation 2016, 2018
#
# ------------------------------------------------------------------------------
#               NOTE: THIS DOCKERFILE IS GENERATED VIA "update.sh"
#
#                       PLEASE DO NOT EDIT IT DIRECTLY.
# ------------------------------------------------------------------------------
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
JAVA_VERSION='1.8.0_sr5fp36' && \
ESUM='548b35eb9677915df6819f9375567736de2ba6862e50ab1685a06becc943fa00' && \
YML_FILE='sdk/linux/x86_64/index.yml' && \
BASE_URL="https://public.dhe.ibm.com/ibmdl/export/pub/systems/cloud/runtimes/java/meta/" && \
wget -q -U UA_IBM_JAVA_Docker -O /tmp/index.yml ${BASE_URL}/${YML_FILE} && \
JAVA_URL=$(sed -n '/^'${JAVA_VERSION}:'/{n;s/\s*uri:\s//p}'< /tmp/index.yml) && \
wget -q -U UA_IBM_JAVA_Docker -O /tmp/ibm-java.bin ${JAVA_URL} && \
echo "${ESUM}  /tmp/ibm-java.bin" | sha256sum -c - && \
echo "INSTALLER_UI=silent" > /tmp/response.properties && \
echo "USER_INSTALL_DIR=/opt/ibm/java" >> /tmp/response.properties && \
echo "LICENSE_ACCEPTED=TRUE" >> /tmp/response.properties && \
mkdir -p /opt/ibm && \
chmod +x /tmp/ibm-java.bin && \
/tmp/ibm-java.bin -i silent -f /tmp/response.properties && \
rm -f /tmp/response.properties && \
rm -f /tmp/index.yml && \
rm -f /tmp/ibm-java.bin
