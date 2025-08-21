FROM nvidia/cuda:12.9.1-base-ubuntu24.04

RUN apt-get update && apt-get install -y \
    python3-pip \
    python3-venv \
    python-is-python3 \
    sudo \
    wget \
    git \
    vim

# virtualenv環境作成
ENV VENV_PATH=/opt/venv
RUN python3 -m venv $VENV_PATH
ENV PATH="$VENV_PATH/bin:$PATH"

# pip更新
RUN pip install --upgrade pip

# PyTorchインストール
RUN pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu129
RUN pip install torchinfo lightning

# その他パッケージのインストール
RUN pip install optuna pandas scikit-learn seaborn matplotlib 
RUN pip install tqdm ipywidgets jupyterlab jupyterlab-widgets

WORKDIR /example-pytorch

# JupyterLabを使用 (使用しない場合は /bin/bash のほうに置き替える)
#CMD ["/bin/bash"]
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--allow-root", "--LabApp.token=''"]
