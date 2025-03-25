# ypspur_ros_docker
ROS Noetic環境でypspur_rosを使用するためのDocker設定を提供する

## セットアップ

### 前提条件

- Dockerがインストールされていること
- Docker Composeがインストールされていること

## 使用方法
`docker-compose up`でコンテナ起動したら、以下のコマンドでROS環境に入る

```sh
docker exec -it ypspur_ros_docker_ros_1 bash
```

## volume
マウントされてるvolume：

- `$HOME/researches/programs/platform/yp-robot-params/` -> `/root/researches/programs/platform`
- `/etc/localtime` -> `/etc/localtime`

## device
接続されてるデバイス(修正が必要な場合あり)：

- `/dev/ttyACM0` -> `/dev/ttyACM0`
