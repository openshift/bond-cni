#!/usr/bin/env bash

# Copyright (c) 2017 Intel Corp
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
# implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -e

ORG_PATH="github.com/Intel-Corp"
REPO_PATH="${ORG_PATH}/bond-cni"

if [ ! -h gopath/src/${REPO_PATH} ]; then
	mkdir -p gopath/src/${ORG_PATH}
	ln -s ../../../.. gopath/src/${REPO_PATH} || exit 255
fi

export GO15VENDOREXPERIMENT=1
export GOBIN=${PWD}/bin
export GOPATH=${PWD}/gopath

echo "Building bond-cni plugins"
go install "$@" ${REPO_PATH}/bond
