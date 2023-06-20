# ubuntu:22.04
FROM ubuntu@sha256:2fdb1cf4995abb74c035e5f520c0f3a46f12b3377a59e86ecca66d8606ad64f9

# make dpkg noninteractive
ENV DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    software-properties-common \
    git \
    python3-pip \
  && rm -rf /var/lib/apt/lists/*

RUN pip3 install \
  ansible \
  ansible_lint==6.14.0 \
  passlib \
  yamllint==1.32.0

WORKDIR /ansible
