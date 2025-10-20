# example-pytorch

## 構成図

![structure-diagram](./images/enviroment.drawio.svg)

- dockerフォルダ  
    Dockerimageやdocker-compose.ymlなどの資材を格納
- projectフォルダ  
    実装したソースやノートブックを格納。(サンプルのノートブックを格納している)
- logsフォルダ  
    tensorboardで表示するためのログを格納
- mlflow-artifacts/mlrunsフォルダ  
    mlflowで表示するデータを格納

## 環境準備

環境としては、Dockerを使用する。  
なおGPUが使用できる環境を想定して`Dockerfile`と`docker-compose.yml`を用意している。  
( docker-compose.yml はGPU版とCPU版で用意している )

### コンテナ起動コマンド

- GPUを使用する場合

    ```bash
    cd docker
    docker compose -f docker-compose.cu129.yml up -d
    ```

- GPUを使用しない場合

    ```bash
    cd docker
    docker compose -f docker-compose.cpu.yml up -d
    ```

起動ずるコンテナは下記の通り。

- **example-pytorch-[ gpu | cpu ]**  
    PyTorchを使用してML開発を行うためのコンテナ。  
    JupyterLab には `http://localhost:8888` からアクセスできる。  

    TensorBoard で表示したいログに関しては、 [torch.utils.tensorboard](https://docs.pytorch.org/docs/stable/tensorboard.html) のAPIを用いて `/logs` にログデータを格納する。

    MLflow へのArtifact登録に関しては、pythonスクリプトで以下のコードでURL設定したのち、 [MLflowのAPI](https://mlflow.org/docs/latest/api_reference/python_api/index.html) を使って実施することができる。　
    
    ```python
    import mlflow, os

    # MLFLOW_TRACKING_URI: http://mlflow:5000
    mlflow.set_tracking_uri(os.getenv(MLFLOW_TRACKING_URI))
    ```

- **example-pytorch-tensorboard**  
    TensorBorad を表示するために用意したコンテナ。  
    `http://localhost:6006` からアクセスできる。  
    `/logs` に格納されたログデータをTensorBoard上で表示する。

- **example-pytorch-mlflow**  
    MLflow を使用するために用意したコンテナ。  
    `http://localhost:5000` からアクセスできる。  


### コンテナ終了コマンド

なお、コンテナを修了させる場合は `docker-compose.yml` が存在するフォルダに移動し、下記のコマンドを実施すれば良い。

```bash
docker compose down
```

## サンプルのノートブックに関して

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
