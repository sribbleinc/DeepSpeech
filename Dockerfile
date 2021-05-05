FROM ubuntu:16.04

RUN apt-get update \
  && apt-get install -y software-properties-common \
  && add-apt-repository -y ppa:deadsnakes/ppa \
  && apt update \
  && apt-get install -y curl \
  && apt-get install -y python3.6 \
  && curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py \
  && python3.6 get-pip.py --force-reinstall \
  && pip3 install --upgrade pip wheel setuptools \
  && apt-get install -y python3.6-venv \
  && curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-339.0.0-linux-x86_64.tar.gz \
  && tar -xf google-cloud-sdk-339.0.0-linux-x86_64.tar.gz
  # && gcloud auth activate-service-account --key-file=credential_key.json \
  # && gcloud config set project my-project
  # gcloud compute instances create training_server \
  # --machine-type=n1-standard-2 \
  # --image-project=ml-images \
  # --image-family=tf-1-8 \
  # --scopes=cloud-platform
  # gcloud compute ssh training_server
  # configure your project name and TPU zone
# gcloud config set project voice-to-ipa
# export TPU_IP=10.240.3.6
# gcloud alpha compute tpus create $USER-tpu \
# 	--range=${TPU_IP/%2/0}/29 --version=1.8 --network=default
#TODO: setup buckets with GSUTIL
CMD ["/bin/bash"]

# docker build -t ds-image .
# docker run -it ds-image
