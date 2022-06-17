ARG IMAGE_NAME
FROM ${IMAGE_NAME}

LABEL maintainer="Sergio Marti <sergio.marti@tyris.ai>"

ARG USER_NAME
ARG OPENCV_V
ARG CUDA_ARCH

ENV INSTALL_OPENCV=temp_opencv

USER root
WORKDIR /

RUN pip install numpy \
    && mkdir /${INSTALL_OPENCV}

WORKDIR /${INSTALL_OPENCV}

    # Download opencv & extra modules:
RUN wget -O opencv-${OPENCV_V}.zip https://github.com/opencv/opencv/archive/${OPENCV_V}.zip \
    && wget -O opencv_contrib-${OPENCV_V}.zip https://github.com/opencv/opencv_contrib/archive/${OPENCV_V}.zip \
    # Extraction package:
    && unzip opencv-${OPENCV_V}.zip \
    && unzip opencv_contrib-${OPENCV_V}.zip

WORKDIR /${INSTALL_OPENCV}/opencv-${OPENCV_V}
# Create build directory
RUN mkdir -p release
WORKDIR /${INSTALL_OPENCV}/opencv-${OPENCV_V}/release

RUN cmake \
    # Configure
    -D CMAKE_BUILD_TYPE=RELEASE \
    -D CMAKE_INSTALL_PREFIX=/usr/local \
    -D BUILD_NEW_PYTHON_SUPPORT=ON \
    -D BUILD_opencv_python3=ON \
    -D HAVE_opencv_python3=ON \
    -D PYTHON_DEFAULT_EXECUTABLE=/usr/local/bin/python3 \
    -D INSTALL_C_EXAMPLES=OFF \
    -D INSTALL_PYTHON_EXAMPLES=ON \
    -D BUILD_SHARED_LIBS=ON \
    -D WITH_CUDA=ON \
    -D WITH_CUBLAS=ON \
    -D CUDA_ARCH_BIN=${CUDA_ARCH} \
    -D CUDA_ARCH_PTX=${CUDA_ARCH} \
    -D OPENCV_DNN_CUDA=ON \
    -D WITH_OPENGL=ON \ 
    -D ENABLE_FAST_MATH=1 \
    -D CUDA_FAST_MATH=1 \
    -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib-${OPENCV_V}/modules \
    -D BUILD_EXAMPLES=ON .. \
    # Build
    && make -j"$(nproc)" && make install \
    && rm -R /${INSTALL_OPENCV}

USER $USER_NAME
WORKDIR /home/$USER_NAME