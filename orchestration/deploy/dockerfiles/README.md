# DOCKERFILES:

Dockerfiles and libraries to install docker images.

---

```
Dockerfiles
│
├── Anaconda    <- Anaconda tool with: Jupyter & Spyder
│
├── os_config               <- OS main libraries common to any project/tool
│   ├── python              <- Python Installation
│   ├── jupyter_notebook    <- Jupyter Notebook & JupyterLab Installation
│   └── opencv_compiled     <- OpenCV Compiled with CUDA (for Python3)
│
├── xmanai_ford
│   ├── xmanai_ford dockerfile
│           
│
└── ubuntu20.04-x86_64
    ├── nvidia-cuda  <- Download directlly from docker hub.
    │   │               Ex.: nvidia/cuda:11.2.1-cudnn8-devel-ubuntu20.04
    │   └── 10.2
    │       ├── base
    │       ├── runtime
    │       └── devel
    └── opengl          <- Nvidia/CUDA + OpenGL
        ├── base
        └── glvnd
            ├── runtime
            └── devel
```
