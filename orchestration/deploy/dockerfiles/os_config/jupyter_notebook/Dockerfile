ARG IMAGE_NAME
FROM ${IMAGE_NAME} as jupyter_notebook

LABEL maintainer="Sergio Marti <sergio.marti@tyris.ai>"

ARG USER_NAME

ENV USER_PATH=/home/$USER_NAME
ENV PATH=$USER_PATH/.local/bin/:$PATH


USER ${USER_NAME}
WORKDIR ${USER_PATH}/

# ==============================================================================
#                        JUPYTER NOTEBOOK / JUPYTERLAB
# ==============================================================================
RUN pip install \
    notebook==6.4.0 \
    jupyterlab==3.0.16




# ==============================================================================
#                            JUPYTER EXTENSIONS
# ==============================================================================
FROM jupyter_notebook as jupyter_extensions

ARG USER_NAME
ENV USER_PATH=/home/$USER_NAME

USER root
WORKDIR /

#                               NodeJS Installation:
# ------------------------------------------------------------------------------
ARG NODE_V
ARG NODE_DISTRO

RUN curl -fsSLO --compressed https://nodejs.org/dist/v${NODE_V}/node-v${NODE_V}-${NODE_DISTRO}.tar.xz \
    && mkdir -p /usr/local/lib/nodejs \
    && tar -xf "node-v${NODE_V}-${NODE_DISTRO}.tar.xz" -C /usr/local/lib/nodejs \
    && ln -s /usr/local/lib/nodejs/node-v${NODE_V}-${NODE_DISTRO}/bin/node /usr/bin/node \
    && ln -s /usr/local/lib/nodejs/node-v${NODE_V}-${NODE_DISTRO}/bin/npm /usr/bin/npm \
    && ln -s /usr/local/lib/nodejs/node-v${NODE_V}-${NODE_DISTRO}/bin/npx /usr/bin/npx \
    # check versions
    && node --version \
    && npm --version

# Other option using: nvm (Node Version Manager)
# ENV NVM_V=0.38.0
# ENV NVM_DIR /usr/local/lib/nvm
# RUN mkdir ${NVM_DIR} \
#     && curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v${NVM_V}/install.sh | bash \
#     && ln -s ${NVM_DIR}/nvm.sh /usr/bin/nvm \
#     && bash -c 'source ${NVM_DIR}/nvm.sh \
#     && nvm install ${NODE_V} '



USER ${USER_NAME}
WORKDIR ${USER_PATH}/

#                               Jupyter Lab:
# ------------------------------------------------------------------------------
    # Library Plotly:
RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager --no-build \
    && jupyter labextension install jupyterlab-plotly --no-build \
    && jupyter labextension install plotlywidget --no-build \
    && jupyter lab build \
# _______________________________ EXTENSIONS ___________________________________
    # Collapse notebook headings:
    && jupyter labextension install @aquirdturtle/collapsible_headings \
    # Git
    && jupyter labextension install @jupyterlab/git


#                               Jupyter Notebook:
# ------------------------------------------------------------------------------
USER root
WORKDIR /

RUN pip install plotly==4.14.3 \
    jupyter_contrib_nbextensions \
    && jupyter contrib nbextension install 

# _______________________________ EXTENSIONS ___________________________________
USER ${USER_NAME}
WORKDIR ${USER_PATH}/

    # Autocomplete code using tab:
RUN jupyter nbextension enable hinterland/hinterland \
    # Show variables like Matlab:
    && jupyter nbextension enable varInspector/main \
    # Web notifications:
    && jupyter nbextension enable notify/notify \
    # Split Cells Notebook
    && jupyter nbextension enable splitcell/splitcell \
    # Collapse code in notebook and editor:
    && jupyter nbextension enable codefolding/main \
    && jupyter nbextension enable codefolding/edit \
    # Collapse notebook headings:
    && jupyter nbextension enable collapsible_headings/main \
    # Table of content:
    && jupyter nbextension enable toc2/main