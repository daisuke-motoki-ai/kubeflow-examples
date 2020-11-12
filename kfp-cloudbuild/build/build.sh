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

# Create the kfp-util docker container image
docker build -t gcr.io/kubeflow-294616/kfp-util:latest .
docker push gcr.io/kubeflow-294616/kfp-util:latest

# Set substitutions
SUBSTITUTIONS=\
_REPO_URL='https://github.com/dai-motoki/kubeflow-examples.git',\
_PROJECT_ID='kubeflow-294616',\
_COMPUTE_ZONE='asia-east1-a',\
_CLUSTER_NAME='cluster-1',\
_GCS_LOCATION='artifacts.kubeflow-294616.appspot.com',\
_EXPERIMENT_NAME='helloworld-dev',\
_TAG='latest'

# Submit the build job
gcloud builds submit --no-source --config cloudbuild.yaml \
--substitutions $SUBSTITUTIONS