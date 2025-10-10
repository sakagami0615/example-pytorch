# example-pytorch

## 環境準備

環境としては、Dockerを使用する。  
なおGPUが使用できる環境を想定して`Dockerfile`と`docker-compose.yml`を用意している。  
GPUがない環境の場合、使用するDockerイメージなどを修正する必要がある(変更内容はAppendixに記載)。

### コンテナ起動コマンド

- GPUを使用する場合

    ```bash
    cd docker/compose/example-pytorch-gpu
    docker compose up -d
    ```

- GPUを使用しない場合

    ```bash
    cd docker/compose/example-pytorch-cpu
    docker compose up -d
    ```

起動ずるコンテナは下記の通り。

- **example-pytorch-[ gpu | cpu ]**  
    PyTorchを使用してML開発を行うためのコンテナ。  
    JupyterLab には `http://localhost:8888` からアクセスできる。  

    TensorBoard で表示したいログに関しては、 [torch.utils.tensorboard](https://docs.pytorch.org/docs/stable/tensorboard.html) のAPIを用いて `/example-pytorch/logs` にログデータを格納する。

    MLflow へのArtifact登録に関しては、pythonスクリプトで以下のコードでURL設定したのち、 [MLflowのAPI](https://mlflow.org/docs/latest/api_reference/python_api/index.html) を使って実施することができる。　
    
    ```python
    import mlflow, os

    # MLFLOW_TRACKING_URI: http://mlflow:5000
    mlflow.set_tracking_uri(os.getenv(MLFLOW_TRACKING_URI))
    ```

- **example-pytorch-tensorboard**
    TensorBorad を表示するために用意したコンテナ。  
    `http://localhost:6006` からアクセスできる。  
    `/example-pytorch/logs` に格納されたログデータをTensorBoard上で表示する。

- **example-pytorch-mlflow**  
    MLflow を使用するために用意したコンテナ。  
    `http://localhost:5000` からアクセスできる。  


### コンテナ終了コマンド

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
