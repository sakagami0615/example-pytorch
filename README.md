# example-pytorch

## 環境準備

環境としては、Dockerを使用する。  
なおGPUが使用できる環境を想定して`Dockerfile`と`docker-compose.yml`を用意している。  
GPUがない環境の場合、使用するDockerイメージなどを修正する必要がある(変更内容はAppendixに記載)。

### コンテナ起動コマンド

- GPUを使用する場合

    ```bash
    cd docker/gpu
    docker compose up -d
    ```

- GPUを使用しない場合

    ```bash
    cd docker/no_gpu
    docker compose up -d
    ```

コンテナ起動後、`http://localhost:8888`にアクセスするとJupyterLabが表示される。

なお、コンテナを修了させる場合は `docker-compose.yml` が存在するフォルダに移動し、下記のコマンドを実施すれば良い。

```bash
docker compose down
```

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
