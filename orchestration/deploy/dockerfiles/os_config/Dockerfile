ARG IMAGE_NAME
FROM ${IMAGE_NAME} as os_libraries

LABEL maintainer "Sergio Marti <sergio.marti@tyris.ai>"

ARG USER_NAME
ARG USER_ID
ARG USER_GID
ARG CMAKE_VERSION


USER root
WORKDIR /

ENV TZ=Europe/Madrid
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone


# ==============================================================================
#                          UBUNTU USERS CREATION
# ==============================================================================
RUN usr/sbin/groupadd --non-unique --gid $USER_GID $USER_NAME && \
    usr/sbin/useradd -ms /bin/bash --gid $USER_NAME --uid $USER_ID $USER_NAME


# ==============================================================================
#                          UBUNTU MAIN LIBRARIES
# ==============================================================================
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential     ca-certificates     pkg-config \
    apt-utils           git                 wget \
    curl                unzip               make \
    gcc                 g++ \
    libgl1-mesa-dev     libasound2 \     
    libjpeg-dev         libpng-dev          libtiff-dev \
    libtiff5-dev \
    libpq-dev           libxine2-dev \
    zlib1g-dev          libgtk-3-dev        libxkbcommon-x11-dev \
    libxcb*-dev         libncurses5-dev     libgdbm-dev \
    libnss3-dev         libssl-dev          libreadline-dev \
    libffi-dev          liblzma-dev         libbz2-dev \
    libglib2.0-0        libxext6            libsm6 \
    libxrender1         mercurial           subversion\
    libxcb-xinerama0    libxss1 \
    qt5-default \
    libusb-1.0-0-dev    libusb-dev \
    libavcodec-dev      libavformat-dev     libswscale-dev \
    libgstreamer-plugins-base1.0-dev        libgstreamer1.0-dev \
    libtbb2             libtbb-dev          libgtk2.0-dev \
    gstreamer1.0-plugins-good \
    libglew-dev         libavutil-dev       zlib1g-dev \
    libpostproc-dev     libsqlite3-dev \
    libeigen3-dev \
    && apt-get clean && \
	rm -rf /var/lib/apt/lists/*


# ==============================================================================
#                            CMAKE INSTALLATION
# ==============================================================================
ENV CMAKE_INSTALL=temp_cmake

RUN mkdir /${CMAKE_INSTALL}
WORKDIR /${CMAKE_INSTALL}

RUN wget https://github.com/Kitware/CMake/releases/download/v${CMAKE_VERSION}/cmake-${CMAKE_VERSION}.tar.gz
RUN tar -zxvf cmake-${CMAKE_VERSION}.tar.gz
WORKDIR /${CMAKE_INSTALL}/cmake-${CMAKE_VERSION}

RUN ./bootstrap && make -j"$(nproc)" \
    && make install \
    && rm -R /${CMAKE_INSTALL}
# RUN cmake --version 

WORKDIR /

# ==============================================================================
#          OPENGL INSTALLATION TEST (execute glmark inside docker)
# ==============================================================================
# RUN apt-get update && apt-get install -y -qq glmark2