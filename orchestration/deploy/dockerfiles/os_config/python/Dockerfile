ARG IMAGE_NAME
FROM ${IMAGE_NAME}

LABEL maintainer="Sergio Marti <sergio.marti@tyris.ai>"

ARG PYTHON_VERSION
ARG PYTHON_V


USER root
WORKDIR /

# ==============================================================================
#                            PYTHON INSTALLATION
# ==============================================================================
ENV FOLDER_PYDONWLOAD=tmp_Python
RUN mkdir /${FOLDER_PYDONWLOAD}
WORKDIR /${FOLDER_PYDONWLOAD}

RUN wget https://www.python.org/ftp/python/${PYTHON_VERSION}/Python-${PYTHON_VERSION}.tgz \
	&& tar -xf Python-${PYTHON_VERSION}.tgz

WORKDIR /${FOLDER_PYDONWLOAD}/Python-${PYTHON_VERSION}

RUN ./configure --enable-optimizations --enable-shared \
	# Python installation
	# set ${PYTHON_VERSION} as python3 default
	&& make -j "$(nproc)" \
	&& make install \
	&& rm -R /${FOLDER_PYDONWLOAD}
# mantain multiple versions of python3
# && make -j altinstall && rm -R /${FOLDER_PYDONWLOAD}

RUN apt-key del 7fa2af80 \
	&& curl -L -O https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-keyring_1.0-1_all.deb \
	&& rm /etc/apt/sources.list.d/cuda.list \
	&& rm -rf /etc/apt/sources.list.d/nvidia-ml.list \
	&&  dpkg -i cuda-keyring_1.0-1_all.deb

RUN apt-get update && apt-get install -y --no-install-recommends \
	python${PYTHON_V}-dev \
	&& apt-get clean && \
	rm -rf /var/lib/apt/lists/*

WORKDIR /

# Set last python3 version by default as python:
RUN update-alternatives --install /usr/bin/python python /usr/local/bin/python${PYTHON_V} 3 \
	&& update-alternatives --install /usr/bin/python python $(which python3) 2 \
	&& update-alternatives --install /usr/bin/python python $(which python2) 1 \
	&& update-alternatives --set python /usr/local/bin/python${PYTHON_V}
# list python alternatieves:
# update-alternatives --config python


# ==============================================================================
#                              PIP INSTALLATION
# ==============================================================================
RUN python --version && python -m pip install --upgrade pip


# ==============================================================================
#                      IPYTHON / IPYKERNEL (for VSCode)
# ==============================================================================
RUN pip install ipython ipykernel