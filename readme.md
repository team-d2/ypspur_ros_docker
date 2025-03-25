# ypspur_ros_docker
ROS Noetic環境でypspur_rosを使用するためのDocker設定を提供する

## セットアップ

### 前提条件

- Dockerがインストールされていること
- Docker Composeがインストールされていること

## 使用方法(source)
`docker-compose up`でコンテナ起動したら、以下のコマンドでROS環境に入る

```sh
docker exec -it ypspur_ros_docker_ros_1 bash
```

## 使用方法(ghcr)
1. ghcrにログイン
```bash
docker login
```
パスワードは[GitHubのtoken設定](https://github.com/settings/tokens/new)から作成(read:packagesにチェックをつける)。

2. docker pull
```bash
docker pull ghcr.io/team-d2/ypspur_ros_docker:main
```

3. docker run
```bash
docker run -it --rm --ipc host --network host ros:noetic roscore
```
```bash
docker run -it --rm --ipc host --network host -v /dev:/dev -v $HOME/researches:/root/researches --privileged ghcr.io/team-d2/ypspur_ros_docker:main rosrun ypspur_ros ypspur_ros _param_file:=/root/researches/programs/platform/yp-robot-params/robot-params/<robotname>.param
```
※ パラメータファイルが$HOME/researches以下に存在する前提

## volume
マウントされてるvolume：

- `$HOME/researches/programs/platform/yp-robot-params/` -> `/root/researches/programs/platform`
- `/etc/localtime` -> `/etc/localtime`

## device
接続されてるデバイス(修正が必要な場合あり)：

- `/dev/ttyACM0` -> `/dev/ttyACM0`

## 注意事項
- rosのworkspaceなどdocker上で必要なディレクトリは順次volumeに追記していくこと