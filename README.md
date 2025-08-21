# example-pytorch

## 環境準備

環境としては、Dockerを使用する。  
なおGPUが使用できる環境を想定して`Dockerfile`と`docker-compose.yml`を用意している。  
GPUがない環境の場合、使用するDockerイメージなどを修正する必要がある(変更内容はAppendixに記載)。

### コンテナ起動コマンド

```bash
docker compose up -d --build
```

コンテナ起動後、`http://localhost:8888`にアクセスするとJupyterLabが表示される。

## ノートブックに関して

### example01_pytorch_common.ipynb

T.B.D

### example02_pytorch_dataloader.ipynb

T.B.D

### example03_pytorch_data_augmentation.ipynb

T.B.D

### example04_pytorch_cnn.ipynb

T.B.D

### example05_pytorch_rnn.ipynb

T.B.D

### example06_pytorch_image_gen_by_rnn.ipynb

T.B.D

### example07_pytorch_fine-tuning.ipynb

T.B.D

### example08_pytorch_param_optimization.ipynb

T.B.D

## Appendix

### CPUで動かす場合

GPUを使用せず、CPUのみで動作させる場合は、以下3点の修正を行う必要がある。

- Dockerimage

    1. 使用イメージ変更
        ```Dockerfile
        ## 【GPUを使用する場合】
        FROM nvidia/cuda:12.9.1-base-ubuntu24.04

        ## 【CPUを使用する場合】
        FROM ubuntu:24.04
        ```
    2. PyTorchパッケージの変更
        ```Dockerfile
        ## 【GPUを使用する場合】
        # PyTorchインストール
        RUN pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu129

        ## 【CPUを使用する場合】
        # PyTorchインストール
        RUN pip install torch torchvision torchaudio
        ```

- docker-compose.yml

    1. gpusのパラメータ変更

        ```yaml
        ## 【GPUを使用する場合】
        volumes:
            - ./:/example-pytorch
        gpus: all                 # NVIDIA GPU を使う（NVIDIA Container Toolkit 必須）　
        shm_size: "8gb"           # 大きめの共有メモリ（DataLoaderなどで有効）
        

        ## 【CPUを使用する場合】
        # CPUの場合は、gpusの設定を削除する
        volumes:
            - ./:/example-pytorch
        shm_size: "8gb"           # 大きめの共有メモリ（DataLoaderなどで有効）
        ```