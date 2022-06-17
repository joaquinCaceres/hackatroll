# Copy from: https://gitlab.com/nvidia/container-images/cuda/-/blob/master/dist/11.2.0/ubuntu20.04-x86_64/devel/cudnn8/Dockerfile
# Date: 27-feb-2021
ARG IMAGE_NAME
FROM ${IMAGE_NAME}:11.2.0-devel-ubuntu20.04
LABEL maintainer "NVIDIA CORPORATION <cudatools@nvidia.com>"

ENV CUDNN_VERSION 8.1.0.77

LABEL com.nvidia.cudnn.version="${CUDNN_VERSION}"

RUN apt-get update && apt-get install -y --no-install-recommends \
    libcudnn8=$CUDNN_VERSION-1+cuda11.2 \
    libcudnn8-dev=$CUDNN_VERSION-1+cuda11.2 \
    && apt-mark hold libcudnn8 && \
    rm -rf /var/lib/apt/lists/*
