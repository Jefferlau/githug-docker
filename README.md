# githug-docker
Git 使用训练的 docker 镜像

## 编写 Dockerfile 文件

```dockerfile
FROM ruby:latest

MAINTAINER Jeffer Lau "jefferlzu@gmail.com"

# Update aptitude with new repo
RUN apt-get update

# Install vim
RUN apt-get install -y vim --force-yes

# Install githug
RUN gem install githug
```

## 编译 Docker 镜像

```bash
docker build -t jefferlau/githug .
```

## 推送到 Docker Hub 存储

[https://docs.docker.com/docker-cloud/builds/push-images/]()

```bash
# tag lastest
docker tag githug jefferlau/githug
docker push jefferlau/githug
# tag githug version 0.5.0
docker tag githug jefferlau/githug:0.5.0
docker push jefferlau/githug:0.5.0
```

## 获取镜像

```bash
docker pull jefferlau/githug
# or
docker pull jefferlau/githug:0.5.0
```

## 使用镜像

初次运行：

```bash
docker run --name githug -it jefferlau/githug /bin/bash
```

再次运行时：

```bash
# 启动容器
docker start githug
# 连接容器命令行
docker exec -it githug /bin/bash
# 停止容器
docker stop githug
```

然后``githug help``可以看到：

```
Tasks:
  githug help [TASK]  # Describe available tasks or one specific task
  githug hint         # Get a hint for the current level
  githug levels       # List all of the levels
  githug play         # Initialize the game
  githug reset        # Reset the current level
  githug test         # Test a level from a file path
```


# Docker-Compose

编辑你的 docker-compose.yml 文件，然后使用 ``docker-compose`` 运行这个容器：

```bash
# 创建并启动容器
docker-compose up -d
# 连接容器命令行
docker exec -it githug /bin/bash
# 停止
docker-compose stop
# 启动
docker-compose start
# 停止并移除容器
docker-compose down
```
