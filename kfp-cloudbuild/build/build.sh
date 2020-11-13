#!/usr/bin/env bash
# Copyright 2019 Google LLC
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
_PROJECT_ID='devel-jbc-ai'
# Create the kfp-util docker container image
docker build -t gcr.io/${_PROJECT_ID}/kfp-util:latest .
docker push gcr.io/${_PROJECT_ID}/kfp-util:latest

# Set substitutions
SUBSTITUTIONS=\
_REPO_URL='https://github.com/daisuke-motoki-ai/kubeflow-examples.git',\
_BRANCH='for_jbc_ai',\
_PROJECT_ID=${_PROJECT_ID},\
_COMPUTE_ZONE='asia-east1-a',\
_CLUSTER_NAME='cluster-1',\
_EXPERIMENT_NAME='calqubo_mock',\
_TAG='1.0.0'

# Submit the build job
gcloud builds submit --no-source --config cloudbuild.yaml \
--substitutions $SUBSTITUTIONS