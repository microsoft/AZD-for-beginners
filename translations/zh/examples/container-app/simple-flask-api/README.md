<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "1c0a9f09606dbd775c684b2a1143e546",
  "translation_date": "2025-11-19T12:52:13+00:00",
  "source_file": "examples/container-app/simple-flask-api/README.md",
  "language_code": "zh"
}
-->
# 简单 Flask API - 容器应用示例

一个使用 AZD CLI 部署到 Azure 容器应用的基础 Python Flask REST API。

## 架构

```
┌─────────────────────────────────────────┐
│   Azure Container Apps Environment      │
│                                         │
│  ┌───────────────────────────────────┐ │
│  │   Flask API Container             │ │
│  │   - Health endpoints              │ │
│  │   - REST API                      │ │
│  │   - Auto-scaling (0-10 replicas)  │ │
│  └───────────────────────────────────┘ │
│                                         │
│  Application Insights ────────────────┐ │
└────────────────────────────────────────┘
```

## 前置条件

- 已安装 Azure Developer CLI (azd)
- 本地安装了 Docker
- Azure 订阅

## 快速开始

```bash
# Clone and navigate
cd examples/container-app/simple-flask-api

# Initialize environment
azd env new dev

# Deploy everything
azd up

# Test the API
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
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

| 端点 | 方法 | 描述 |
|------|------|------|
| `/health` | GET | 健康检查 |
| `/api/items` | GET | 列出所有项目 |
| `/api/items` | POST | 创建新项目 |
| `/api/items/{id}` | GET | 获取指定项目 |
| `/api/items/{id}` | PUT | 更新项目 |
| `/api/items/{id}` | DELETE | 删除项目 |

## 配置

### 环境变量

```bash
# Set custom configuration
azd env set PORT 8000
azd env set LOG_LEVEL info
azd env set MAX_REPLICAS 20
```

### 扩展配置

API 会根据 HTTP 流量自动扩展：
- **最小副本数**: 0（空闲时缩减为零）
- **最大副本数**: 10
- **每个副本的并发请求数**: 50

## 开发

### 本地运行

```bash
# Install dependencies
cd src
pip install -r requirements.txt

# Run the app
python app.py

# Test locally
curl http://localhost:8000/health
```

### 构建和测试容器

```bash
# Build Docker image
docker build -t flask-api:local ./src

# Run container locally
docker run -p 8000:8000 flask-api:local

# Test container
curl http://localhost:8000/health
```

## 部署

### 完整部署

```bash
# Deploy infrastructure and application
azd up
```

### 仅代码部署

```bash
# Deploy only application code (infrastructure unchanged)
azd deploy api
```

### 更新配置

```bash
# Update environment variables
azd env set API_KEY "new-api-key"

# Redeploy with new configuration
azd deploy api
```

## 监控

### 查看日志

```bash
# Stream live logs
azd logs api --follow

# View last 100 lines
azd logs api --tail 100
```

### 监控指标

```bash
# Open Azure Monitor dashboard
azd monitor --overview

# View specific metrics
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

### 创建项目

```bash
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "A test item"}'
```

### 获取所有项目

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/api/items
```

## 成本优化

此部署使用零扩展，因此只有在 API 处理请求时才会产生费用：

- **空闲成本**: ~$0/月（缩减为零）
- **活动成本**: ~$0.000024/秒每副本
- **预期月成本**（轻量使用）：$5-15

### 进一步降低成本

```bash
# Scale down max replicas for dev
azd env set MAX_REPLICAS 3

# Use shorter idle timeout
azd env set SCALE_TO_ZERO_TIMEOUT 300  # 5 minutes
```

## 故障排除

### 容器无法启动

```bash
# Check container logs
azd logs api --tail 100

# Verify Docker image builds locally
docker build -t test ./src
```

### API 无法访问

```bash
# Verify ingress is external
az containerapp show --name api --resource-group rg-simple-flask-api \
  --query properties.configuration.ingress.external
```

### 响应时间过长

```bash
# Check CPU/Memory usage
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# Scale up resources if needed
az containerapp update --name api --resource-group rg-simple-flask-api \
  --cpu 1.0 --memory 2Gi
```

## 清理

```bash
# Delete all resources
azd down --force --purge
```

## 后续步骤

- 添加数据库集成（参见 [database-integration 示例](../../../../../examples/container-app/database-integration)）
- 实现身份验证（参见 [auth-example](../../../../../examples/container-app/auth-example)）
- 设置 CI/CD 管道（参见 [cicd-example](../../../../../examples/container-app/cicd-example)）
- 添加 Dapr 支持微服务（参见 [dapr-example](../../../../../examples/container-app/dapr-example)）

## 其他资源

- [Flask 文档](https://flask.palletsprojects.com/)
- [Azure 容器应用文档](https://learn.microsoft.com/azure/container-apps/)
- [AZD 容器应用指南](../../../docs/microsoft-foundry/ai-model-deployment.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免责声明**：  
本文档使用AI翻译服务[Co-op Translator](https://github.com/Azure/co-op-translator)进行翻译。尽管我们努力确保翻译的准确性，但请注意，自动翻译可能包含错误或不准确之处。原始语言的文档应被视为权威来源。对于关键信息，建议使用专业人工翻译。我们对因使用此翻译而产生的任何误解或误读不承担责任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->