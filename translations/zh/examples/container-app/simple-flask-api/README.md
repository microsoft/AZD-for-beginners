<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9e7f581a238c1bf7f9f31a2ba118a90c",
  "translation_date": "2025-11-19T13:25:53+00:00",
  "source_file": "examples/container-app/simple-flask-api/README.md",
  "language_code": "zh"
}
-->
# 简单 Flask API - 容器应用示例

**学习路径:** 初学者 ⭐ | **时间:** 25-35 分钟 | **成本:** $0-15/月

一个完整的、可运行的 Python Flask REST API，通过 Azure Developer CLI (azd) 部署到 Azure 容器应用。本示例展示了容器部署、自动扩展和监控的基础知识。

## 🎯 学习目标

- 将容器化的 Python 应用部署到 Azure
- 配置自动扩展并支持零负载缩减
- 实现健康探测和就绪检查
- 监控应用日志和指标
- 使用 Azure Developer CLI 快速部署

## 📦 包含内容

✅ **Flask 应用** - 完整的 REST API，支持 CRUD 操作 (`src/app.py`)  
✅ **Dockerfile** - 生产环境容器配置  
✅ **Bicep 基础设施** - 容器应用环境和 API 部署  
✅ **AZD 配置** - 一键部署设置  
✅ **健康探测** - 配置了存活性和就绪性检查  
✅ **自动扩展** - 根据 HTTP 负载自动扩展 0-10 个副本  

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

### 必需条件
- **Azure Developer CLI (azd)** - [安装指南](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Azure 订阅** - [免费账户](https://azure.microsoft.com/free/)
- **Docker Desktop** - [安装 Docker](https://www.docker.com/products/docker-desktop/)（用于本地测试）

### 验证前置条件

```bash
# 检查 azd 版本（需要 1.5.0 或更高版本）
azd version

# 验证 Azure 登录
azd auth login

# 检查 Docker（可选，用于本地测试）
docker --version
```

## ⏱️ 部署时间表

| 阶段 | 时长 | 发生了什么 |
|------|------|-----------||
| 环境设置 | 30 秒 | 创建 azd 环境 |
| 构建容器 | 2-3 分钟 | Docker 构建 Flask 应用 |
| 配置基础设施 | 3-5 分钟 | 创建容器应用、注册表、监控 |
| 部署应用 | 2-3 分钟 | 推送镜像并部署到容器应用 |
| **总计** | **8-12 分钟** | 完成部署，准备就绪 |

## 快速开始

```bash
# 导航到示例
cd examples/container-app/simple-flask-api

# 初始化环境（选择唯一名称）
azd env new myflaskapi

# 部署所有内容（基础设施 + 应用程序）
azd up
# 您将被提示：
# 1. 选择 Azure 订阅
# 2. 选择位置（例如，eastus2）
# 3. 等待 8-12 分钟完成部署

# 获取您的 API 端点
azd env get-values

# 测试 API
curl $(azd env get-value API_ENDPOINT)/health
```

**预期输出:**
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z",
  "service": "simple-flask-api",
  "version": "1.0.0"
}
```

## ✅ 验证部署

### 步骤 1: 检查部署状态

```bash
# 查看已部署的服务
azd show

# 预期输出显示：
# - 服务：api
# - 端点：https://ca-api-[env].xxx.azurecontainerapps.io
# - 状态：运行中
```

### 步骤 2: 测试 API 端点

```bash
# 获取 API 端点
API_URL=$(azd env get-value API_ENDPOINT)

# 测试健康状况
curl $API_URL/health

# 测试根端点
curl $API_URL/

# 创建一个项目
curl -X POST $API_URL/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "My first item"}'

# 获取所有项目
curl $API_URL/api/items
```

**成功标准:**
- ✅ 健康端点返回 HTTP 200
- ✅ 根端点显示 API 信息
- ✅ POST 创建项目并返回 HTTP 201
- ✅ GET 返回已创建的项目

### 步骤 3: 查看日志

```bash
# 实时流日志
azd logs api --follow

# 你应该看到：
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
# 设置自定义配置
azd env set PORT 8000
azd env set LOG_LEVEL info
azd env set MAX_REPLICAS 20
```

### 扩展配置

API 会根据 HTTP 流量自动扩展:
- **最小副本数**: 0（空闲时缩减到零）
- **最大副本数**: 10
- **每个副本的并发请求数**: 50

## 开发

### 本地运行

```bash
# 安装依赖项
cd src
pip install -r requirements.txt

# 运行应用程序
python app.py

# 本地测试
curl http://localhost:8000/health
```

### 构建和测试容器

```bash
# 构建Docker镜像
docker build -t flask-api:local ./src

# 本地运行容器
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
# 仅部署应用程序代码（基础设施保持不变）
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
# 实时流日志
azd logs api --follow

# 查看最后100行
azd logs api --tail 100
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

预期响应:
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

此部署使用零负载缩减，因此只有在 API 处理请求时才会产生费用:

- **空闲成本**: ~$0/月（缩减到零）
- **活动成本**: ~$0.000024/秒每个副本
- **预期月成本**（轻量使用）: $5-15

### 进一步降低成本

```bash
# 缩减开发环境的最大副本数
azd env set MAX_REPLICAS 3

# 使用较短的空闲超时时间
azd env set SCALE_TO_ZERO_TIMEOUT 300  # 5分钟
```

## 故障排除

### 容器无法启动

```bash
# 检查容器日志
azd logs api --tail 100

# 验证Docker镜像在本地构建
docker build -t test ./src
```

### API 无法访问

```bash
# 验证入口是外部的
az containerapp show --name api --resource-group rg-simple-flask-api \
  --query properties.configuration.ingress.external
```

### 响应时间过长

```bash
# 检查CPU/内存使用情况
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# 如有需要，扩展资源
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

1. **添加数据库** - 集成 Azure Cosmos DB 或 SQL 数据库
   ```bash
   # 将 Cosmos DB 模块添加到 infra/main.bicep
   # 使用数据库连接更新 app.py
   ```

2. **添加身份验证** - 实现 Azure AD 或 API 密钥
   ```python
   # 将认证中间件添加到app.py
   from functools import wraps
   ```

3. **设置 CI/CD** - GitHub Actions 工作流
   ```yaml
   # Create .github/workflows/deploy.yml
   name: Deploy to Azure
   on: [push]
   ```

4. **添加托管身份** - 安全访问 Azure 服务
   ```bicep
   # Update infra/app/api.bicep
   identity: { type: 'SystemAssigned' }
   ```

### 相关示例

- **[数据库应用](../../../../../examples/database-app)** - 包含 SQL 数据库的完整示例
- **[微服务](../../../../../examples/container-app/microservices)** - 多服务架构
- **[容器应用指南](../README.md)** - 所有容器模式

### 学习资源

- 📚 [AZD 初学者课程](../../../README.md) - 主课程主页
- 📚 [容器应用模式](../README.md) - 更多部署模式
- 📚 [AZD 模板库](https://azure.github.io/awesome-azd/) - 社区模板

## 其他资源

### 文档
- **[Flask 文档](https://flask.palletsprojects.com/)** - Flask 框架指南
- **[Azure 容器应用](https://learn.microsoft.com/azure/container-apps/)** - 官方 Azure 文档
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - azd 命令参考

### 教程
- **[容器应用快速入门](https://learn.microsoft.com/azure/container-apps/quickstart-portal)** - 部署您的第一个应用
- **[Azure 上的 Python](https://learn.microsoft.com/azure/developer/python/)** - Python 开发指南
- **[Bicep 语言](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)** - 基础设施即代码

### 工具
- **[Azure 门户](https://portal.azure.com)** - 可视化管理资源
- **[VS Code Azure 扩展](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-azurecontainerapps)** - IDE 集成

---

**🎉 恭喜！** 您已成功将生产级 Flask API 部署到 Azure 容器应用，并实现了自动扩展和监控。

**有问题？** [提交问题](https://github.com/microsoft/AZD-for-beginners/issues) 或查看 [FAQ](../../../resources/faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免责声明**：  
本文档使用AI翻译服务[Co-op Translator](https://github.com/Azure/co-op-translator)进行翻译。尽管我们努力确保翻译的准确性，但请注意，自动翻译可能包含错误或不准确之处。原始语言的文档应被视为权威来源。对于重要信息，建议使用专业人工翻译。我们不对因使用此翻译而产生的任何误解或误读承担责任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->