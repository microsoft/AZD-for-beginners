# Simple Flask API - Container App Example

**Learning Path:** 入门 ⭐ | **Time:** 25-35 minutes | **Cost:** $0-15/month

一个完整的、可运行的 Python Flask REST API，使用 Azure Developer CLI (azd) 部署到 Azure Container Apps。此示例演示容器部署、自动伸缩和监控基础。

## 🎯 你将学到

- 将容器化的 Python 应用部署到 Azure
- 配置支持缩放到零的自动伸缩
- 实现健康探针和就绪检查
- 监控应用日志和指标
- 使用 Azure Developer CLI 进行快速部署

## 📦 包含内容

✅ **Flask Application** - 完整的 CRUD REST API（`src/app.py`）  
✅ **Dockerfile** - 面向生产的容器配置  
✅ **Bicep Infrastructure** - Container Apps 环境和 API 部署  
✅ **AZD Configuration** - 一条命令部署设置  
✅ **Health Probes** - 已配置存活和就绪检查  
✅ **Auto-scaling** - 基于 HTTP 负载的 0-10 副本伸缩  

## 架构

```mermaid
graph TD
    subgraph ACA[Azure 容器应用环境]
        Flask[Flask API 容器<br/>健康端点<br/>REST API<br/>自动扩缩容 0-10 副本]
        AppInsights[应用程序洞察]
    end
```

## 先决条件

### 必需
- **Azure Developer CLI (azd)** - [安装指南](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Azure subscription** - [Free account](https://azure.microsoft.com/free/)
- **Docker Desktop** - [Install Docker](https://www.docker.com/products/docker-desktop/) (用于本地测试)

### 验证先决条件

```bash
# 检查 azd 版本（需要 1.5.0 或更高）
azd version

# 验证 Azure 登录
azd auth login

# 检查 Docker（可选，用于本地测试）
docker --version
```

## ⏱️ 部署时间线

| Phase | Duration | What Happens |
|-------|----------|--------------||
| Environment setup | 30 seconds | Create azd environment |
| Build container | 2-3 minutes | Docker build Flask app |
| Provision infrastructure | 3-5 minutes | Create Container Apps, registry, monitoring |
| Deploy application | 2-3 minutes | Push image and deploy to Container Apps |
| **Total** | **8-12 minutes** | Complete deployment ready |

## 快速开始

```bash
# 导航到示例
cd examples/container-app/simple-flask-api

# 初始化环境（选择唯一名称）
azd env new myflaskapi

# 部署所有内容（基础设施 + 应用）
azd up
# 您将被提示：
# 1. 选择 Azure 订阅
# 2. 选择位置（例如：eastus2）
# 3. 等待 8-12 分钟以完成部署

# 获取您的 API 端点
azd env get-values

# 测试 API
curl $(azd env get-value API_ENDPOINT)/health
```

**预期输出：**
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z",
  "service": "simple-flask-api",
  "version": "1.0.0"
}
```

## ✅ 验证部署

### 步骤 1：检查部署状态

```bash
# 查看已部署的服务
azd show

# 预期输出显示：
# - 服务：api
# - 端点：https://ca-api-[env].xxx.azurecontainerapps.io
# - 状态：运行中
```

### 步骤 2：测试 API 端点

```bash
# 获取 API 端点
API_URL=$(azd env get-value API_ENDPOINT)

# 健康检查
curl $API_URL/health

# 测试根端点
curl $API_URL/

# 创建一个条目
curl -X POST $API_URL/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "My first item"}'

# 获取所有条目
curl $API_URL/api/items
```

**成功标准：**
- ✅ 健康端点返回 HTTP 200
- ✅ 根端点显示 API 信息
- ✅ POST 创建条目并返回 HTTP 201
- ✅ GET 返回已创建的条目

### 步骤 3：查看日志

```bash
# 使用 azd monitor 实时流式传输日志
azd monitor --logs

# 或者使用 Azure CLI：
az containerapp logs show --name api --resource-group $RG_NAME --follow

# 您应该会看到：
# - Gunicorn 启动消息
# - HTTP 请求日志
# - 应用程序信息日志
```

## 项目结构

```
simple-flask-api/
├── azure.yaml              # AZD configuration
├── infra/
│   ├── main.bicep         # Main infrastructure
│   ├── main.parameters.json
│   └── app/
│       ├── container-env.bicep
│       └── api.bicep
└── src/
    ├── app.py             # Flask application
    ├── requirements.txt
    └── Dockerfile
```

## API 端点

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/health` | GET | 健康检查 |
| `/api/items` | GET | 列出所有条目 |
| `/api/items` | POST | 创建新条目 |
| `/api/items/{id}` | GET | 获取特定条目 |
| `/api/items/{id}` | PUT | 更新条目 |
| `/api/items/{id}` | DELETE | 删除条目 |

## 配置

### 环境变量

```bash
# 设置自定义配置
azd env set PORT 8000
azd env set LOG_LEVEL info
azd env set MAX_REPLICAS 20
```

### 缩放配置

API 会根据 HTTP 流量自动伸缩：
- **Min Replicas**: 0（空闲时缩放到零）
- **Max Replicas**: 10
- **Concurrent Requests per Replica**: 50

## 开发

### 本地运行

```bash
# 安装依赖
cd src
pip install -r requirements.txt

# 运行应用
python app.py

# 本地测试
curl http://localhost:8000/health
```

### 构建并测试容器

```bash
# 构建 Docker 镜像
docker build -t flask-api:local ./src

# 在本地运行容器
docker run -p 8000:8000 flask-api:local

# 测试容器
curl http://localhost:8000/health
```

## 部署

### 完整部署

```bash
# 部署基础设施和应用程序
azd up
```

### 仅代码部署

```bash
# 仅部署应用程序代码（基础设施不变）
azd deploy api
```

### 更新配置

```bash
# 更新环境变量
azd env set API_KEY "new-api-key"

# 使用新配置重新部署
azd deploy api
```

## 监控

### 查看日志

```bash
# 使用 azd monitor 实时流式查看日志
azd monitor --logs

# 或者使用 Azure CLI（用于容器应用）:
az containerapp logs show --name api --resource-group $RG_NAME --follow

# 查看最近 100 行
az containerapp logs show --name api --resource-group $RG_NAME --tail 100
```

### 监控指标

```bash
# 打开 Azure Monitor 仪表板
azd monitor --overview

# 查看特定指标
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "Requests,ResponseTime"
```

## 测试

### 健康检查

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

预期响应：
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z"
}
```

### 创建条目

```bash
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "A test item"}'
```

### 获取所有条目

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/api/items
```

## 成本优化

此部署使用缩放到零，因此只有在 API 处理请求时才产生费用：

- <strong>空闲成本</strong>：~$0/月（缩放至零）
- <strong>活动成本</strong>：~$0.000024/秒 每个副本
- <strong>预计月成本</strong>（轻度使用）：$5-15

### 进一步降低成本

```bash
# 为开发环境缩减最大副本数
azd env set MAX_REPLICAS 3

# 使用更短的空闲超时时间
azd env set SCALE_TO_ZERO_TIMEOUT 300  # 5 分钟
```

## 故障排除

### 容器无法启动

```bash
# 使用 Azure CLI 检查容器日志
az containerapp logs show --name api --resource-group $RG_NAME --tail 100

# 验证 Docker 镜像可以在本地构建
docker build -t test ./src
```

### 无法访问 API

```bash
# 验证 ingress 是否为外部
az containerapp show --name api --resource-group rg-simple-flask-api \
  --query properties.configuration.ingress.external
```

### 响应时间高

```bash
# 检查 CPU/内存使用情况
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# 如有需要，扩容资源
az containerapp update --name api --resource-group rg-simple-flask-api \
  --cpu 1.0 --memory 2Gi
```

## 清理

```bash
# 删除所有资源
azd down --force --purge
```

## 下一步

### 扩展此示例

1. **Add Database** - 集成 Azure Cosmos DB 或 SQL Database
   ```bash
   # 将 Cosmos DB 模块添加到 infra/main.bicep
   # 在 app.py 中更新数据库连接
   ```

2. **Add Authentication** - 实现 Microsoft Entra ID 或 API 密钥
   ```python
   # 在 app.py 中添加身份验证中间件
   from functools import wraps
   ```

3. **Set Up CI/CD** - GitHub Actions 工作流
   ```yaml
   # Create .github/workflows/deploy.yml
   name: Deploy to Azure
   on: [push]
   ```

4. **Add Managed Identity** - 使用托管身份以安全方式访问 Azure 服务
   ```bicep
   # Update infra/app/api.bicep
   identity: { type: 'SystemAssigned' }
   ```

### 相关示例

- **[Database App](../../../../../examples/database-app)** - 带有 SQL Database 的完整示例
- **[Microservices](../../../../../examples/container-app/microservices)** - 多服务架构
- **[Container Apps Master Guide](../README.md)** - 所有容器模式汇总

### 学习资源

- 📚 [AZD For Beginners Course](../../../README.md) - 课程主页面
- 📚 [Container Apps Patterns](../README.md) - 更多部署模式
- 📚 [AZD Templates Gallery](https://azure.github.io/awesome-azd/) - 社区模板

## 附加资源

### 文档
- **[Flask Documentation](https://flask.palletsprojects.com/)** - Flask 框架指南
- **[Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)** - 官方 Azure 文档
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - azd 命令参考

### 教程
- **[Container Apps Quickstart](https://learn.microsoft.com/azure/container-apps/quickstart-portal)** - 部署你的第一个应用
- **[Python on Azure](https://learn.microsoft.com/azure/developer/python/)** - 在 Azure 上的 Python 开发指南
- **[Bicep Language](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)** - 基础设施即代码

### 工具
- **[Azure Portal](https://portal.azure.com)** - 可视化管理资源
- **[VS Code Azure Extension](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-azurecontainerapps)** - IDE 集成

---

**🎉 恭喜！** 你已将一个支持自动伸缩和监控的生产就绪 Flask API 部署到 Azure Container Apps。

**有问题？** [Open an issue](https://github.com/microsoft/AZD-for-beginners/issues) 或查看 [FAQ](../../../resources/faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免责声明**：
本文件由 AI 翻译服务 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻译完成。尽管我们力求准确，但请注意，自动翻译可能包含错误或不准确之处。原始语言版文件应视为权威来源。对于重要信息，建议使用专业人工翻译。我们对因使用本翻译而产生的任何误解或误释不承担责任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->