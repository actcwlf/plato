# Plato(柏拉图)

这是调整过Dockerfile和相关依赖的版本，主要用于构建部署于隔离环境下的镜像

镜像构建过程中会下载并安装相应的依赖，并对项目进行编译。构建完成的镜像内可直接执行scripts内的脚本进行测试


## 使用方法
```bash
cd docker
docker-build-isolated.sh
```

`build.sh`中`bazel test plato/...`有可能因为网络原因执行失败，如果失败可注释该命令后重新构建镜像