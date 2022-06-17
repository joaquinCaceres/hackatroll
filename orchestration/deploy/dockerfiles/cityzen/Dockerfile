ARG IMAGE_NAME
FROM ${IMAGE_NAME}

LABEL maintainer="Joaquín Cáceres <joaquin.caceres@tyris.ai>"

ARG USER_NAME

USER root
WORKDIR /

RUN apt-get update && apt-get install -y --no-install-recommends \
    libsndfile1

RUN pip install --upgrade pip

RUN pip install \
    numpy           pandas \
    matplotlib \
    plotly          dash \
    lime

RUN pip install \
    dvc nbformat


RUN pip install black==22.1.0 \
    flake8==4.0.1 \
    flake8-bugbear==22.1.11 \
    pep8-naming==0.12.1 \
    pre-commit==2.17.0

RUN pip install  \
    pyod==0.8.3 \
    keras==2.2.5 \
    scikit-learn==0.23.2 \
    mmh3==3.0.0 \
    pysad==0.1.1 \
    scikit-multiflow==0.5.3 \
    pynomaly==0.3.3 \
    ipywidgets

USER $USER_NAME
WORKDIR /home/$USER_NAME