# linAcc

本项目演示如何使用 [Echo](https://echo.labstack.com) Web 框架以及 [Layui](https://www.layui.com/) 页面框架，构建一个简单的 Go 应用。

## 快速开始

1. **安装依赖**
   ```bash
   go mod tidy
   ```
   如果执行失败，可能是由于当前环境无法连接外网下载依赖。
   在这种情况下，直接通过 Docker 构建将自动下载依赖并生成 `go.sum` 文件。

2. **启动服务器**
   ```bash
   go run ./cmd/server
   ```

3. 在浏览器中访问 [http://localhost:8080](http://localhost:8080) 查看页面。

服务器提供示例接口 `/api/ping`，返回 `{"message": "pong"}`。Layui 资源通过 CDN 加载，可根据需要在 `web` 目录中自定义页面。
