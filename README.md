# linAcc

本项目演示如何使用 [Echo](https://echo.labstack.com/) 与 [Layui](https://www.layui.com/) 页面框架，构建一个简单的 Go 应用。

## 快速开始

1. **安装依赖**
   需要安装 [Echo](https://echo.labstack.com/)：
   ```bash
   go get github.com/labstack/echo/v4
   ```

2. **启动服务器**
   ```bash
   go run ./cmd/server
   ```

3. 在浏览器中访问 [http://localhost:8080](http://localhost:8080) 查看页面。

服务器提供示例接口 `/api/ping`，返回 `{"message": "pong"}`。Layui 资源通过 CDN 加载，可根据需要在 `web` 目录中自定义页面。

## 构建 Docker 镜像

使用 [Docker Buildx](https://docs.docker.com/buildx/working-with-buildx/) 可生成多架构镜像：

```bash
docker buildx build --platform linux/amd64,linux/arm64 -t xianwei2022/linacc:latest .
```
