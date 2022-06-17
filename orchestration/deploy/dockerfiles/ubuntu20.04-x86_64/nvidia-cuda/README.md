# Nvidia/CUDA (use from official DockerHub):

## Repositorios oficiales:

- Docker Hub: [nvidia/cuda](https://hub.docker.com/r/nvidia/cuda)

- GitLab: [Nvidia](https://gitlab.com/nvidia)

    - [cuda](https://gitlab.com/nvidia/container-images/cuda)

## Composición de los dockers:

- FROM ubuntu:20.04

    - FROM base

        - FROM runtime 

            - FROM devel

Runtime y devel tambien tienen la opción de instalar cudnn.