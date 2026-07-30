FROM nvidia/cuda:12.6.2-cudnn-devel-ubuntu22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    gdb \
    cmake \
    git \
    nlohmann-json3-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /rsa
