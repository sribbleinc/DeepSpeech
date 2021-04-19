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
  && apt-get install -y python3.6-venv

CMD ["/bin/bash"]

# docker build -t ds-image .
# docker run -it ds-image
