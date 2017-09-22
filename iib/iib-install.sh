#!/bin/bash
# -*- mode: sh -*-
# (C) Copyright IBM Corporation 2016
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Note this step only installs the product. It does not accept the licence or create an IIB userid
# That is done in the next stage when the AMI is instantiated using Cloud Formation.
# This processing is deferred to the next step so that a /var/mqsi file system
# can be mounted prior to accepting the licence which will automatically create entries in /var/mqsi

# Fail on error
set -e
export DEBIAN_FRONTEND=noninteractive
# Recommended: Update all packages to the latest level
apt-get update
apt-get upgrade -y
apt-get update
# These packages should already be present, but let's make sure
apt-get install -y \
    bash \
    curl \
    rpm \
    super \
    tar
# Make the destination directory
mkdir -p /opt/ibm

# Download and extract the MQ installation files
mkdir -p /tmp/iib
cd /tmp/iib
curl -LO ${IIB_URL}
tar -zxvf ./*.tar.gz --exclude ${IIB_VERSION}/tools -C /opt/ibm

# Clean up all the downloaded files
rm -rf /tmp/iib
# Clean up unwanted files, to help ensure a smaller image file is created
apt-get clean -y
