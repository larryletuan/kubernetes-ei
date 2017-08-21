#!/usr/bin/env bash

# ------------------------------------------------------------------------
#
# Copyright 2017 WSO2, Inc. (http://wso2.com)
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
# limitations under the License
#
# ------------------------------------------------------------------------

# Product Context
product=wso2ei
productVersion=6.1.1
profile=integrator
patternNumber=2
# Image Info
repository=${product}-pattern${patternNumber}-${profile}
tag=${productVersion}

echo "Creating ${profile} profile for pattern ${patternNumber} ..."
docker login docker.wso2.com
docker build -t ${repository}:${tag} . --squash
docker rmi $(docker images --filter "dangling=true" -q --no-trunc) > /dev/null 2>&1
