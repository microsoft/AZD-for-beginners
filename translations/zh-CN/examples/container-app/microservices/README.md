# Microservices Architecture - Container App Example

⏱️ **Estimated Time**: 25-35 minutes | 💰 **Estimated Cost**: ~$50-100/month | ⭐ **Complexity**: Advanced

一个部署到 Azure Container Apps 并使用 AZD CLI 的**简化但可运行**的微服务架构示例。此示例展示了服务间通信、容器编排和监控，采用一个实用的两服务设置。

> **📚 学习方法**：本示例从一个最小的两服务架构（API 网关 + 后端服务）开始，你可以实际部署并学习。掌握此基础后，我们提供扩展到完整微服务生态系统的指导。

## What You'll Learn

通过完成本示例，你将：
- 将多个容器部署到 Azure Container Apps
- 使用内部网络实现服务间通信
- 配置基于环境的扩展和健康检查
- 使用 Application Insights 监控分布式应用
- 理解微服务部署模式和最佳实践
- 学习从简单到复杂的渐进式扩展

## Architecture

### Phase 1: What We're Building (Included in This Example)

```
                    ┌─────────────────────────────┐
                    │         Internet            │
                    └──────────────┬──────────────┘
                                   │
                                   │ HTTPS
                                   │
                    ┌──────────────▼──────────────┐
                    │      API Gateway            │
                    │   (Node.js Container)       │
                    │   - Routes requests         │
                    │   - Health checks           │
                    │   - Request logging         │
                    └──────────────┬──────────────┘
                                   │
                                   │ HTTP (internal)
                                   │
                    ┌──────────────▼──────────────┐
                    │    Product Service          │
                    │   (Python Container)        │
                    │   - Product CRUD            │
                    │   - In-memory data store    │
                    │   - REST API                │
                    └──────────────┬──────────────┘
                                   │
                    ┌──────────────▼──────────────┐
                    │   Application Insights      │
                    │   (Monitoring & Logs)       │
                    └─────────────────────────────┘
```

**Why Start Simple?**
- ✅ 快速部署和理解（25-35 分钟）
- ✅ 在没有复杂性的情况下学习核心微服务模式
- ✅ 可修改和实验的工作代码
- ✅ 学习成本更低（大约 $50-100/月 对比 $300-1400/月）
- ✅ 在添加数据库和消息队列之前建立信心

**类比**：把这比作学开车。你先从空旷的停车场（2 个服务）开始，掌握基础，然后再进阶到城市道路（5 个以上服务并含数据库）。

### Phase 2: Future Expansion (Reference Architecture)

一旦掌握了两服务架构，你可以扩展到：

```
Full Architecture (Not Included - For Reference)
├── API Gateway (✅ Included)
├── Product Service (✅ Included)
├── Order Service (🔜 Add next)
├── User Service (🔜 Add next)
├── Notification Service (🔜 Add last)
├── Azure Service Bus (🔜 For async communication)
├── Cosmos DB (🔜 For product persistence)
├── Azure SQL (🔜 For order management)
└── Azure Storage (🔜 For file storage)
```

请参阅结尾的“Expansion Guide”部分获取逐步说明。

## Features Included

✅ **服务发现**：容器间基于 DNS 的自动发现  
✅ **负载均衡**：跨副本的内置负载均衡  
✅ **自动扩缩**：基于 HTTP 请求的服务独立扩缩  
✅ **健康监控**：为两个服务提供存活和就绪探针  
✅ **分布式日志**：使用 Application Insights 的集中式日志  
✅ **内部网络**：安全的服务间通信  
✅ **容器编排**：自动部署和扩缩  
✅ **零停机更新**：带修订管理的滚动更新  

## Prerequisites

### Required Tools

在开始之前，请确认已安装这些工具：

1. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (版本 1.0.0 或更高)
   ```bash
   azd version
   # 预期输出：azd 版本 1.0.0 或更高
   ```

2. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (版本 2.50.0 或更高)
   ```bash
   az --version
   # 预期输出：azure-cli 2.50.0 或更高版本
   ```

3. **[Docker](https://www.docker.com/get-started)** (用于本地开发/测试 - 可选)
   ```bash
   docker --version
   # 预期输出：Docker 版本 20.10 或更高
   ```

### Azure 要求

- 一个有效的 **Azure 订阅**（[创建免费账户](https://azure.microsoft.com/free/)）
- 在订阅中创建资源的权限
- 在订阅或资源组上具有 **Contributor** 角色

### 知识先决条件

这是一个**高级**示例。你应该具备：
- 已完成 [Simple Flask API example](../../../../../examples/container-app/simple-flask-api) 
- 对微服务架构的基本理解
- 熟悉 REST API 和 HTTP
- 对容器概念有一定了解

**容器应用新手？** 请先从 [Simple Flask API example](../../../../../examples/container-app/simple-flask-api) 开始以学习基础知识。

## Quick Start (Step-by-Step)

### Step 1: Clone and Navigate

```bash
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/container-app/microservices
```

**✓ 成功检查**：确认你看到 `azure.yaml`:
```bash
ls
# 预期：README.md、azure.yaml、infra/、src/
```

### Step 2: Authenticate with Azure

```bash
azd auth login
```

这会在浏览器中打开 Azure 身份验证。使用你的 Azure 凭据登录。

**✓ 成功检查**：你应该看到：
```
Logged in to Azure.
```

### Step 3: Initialize the Environment

```bash
azd init
```

**你会看到的提示**：
- **Environment name**: 输入一个简短名称（例如 `microservices-dev`）
- **Azure subscription**: 选择你的订阅
- **Azure location**: 选择一个区域（例如 `eastus`, `westeurope`）

**✓ 成功检查**：你应该看到：
```
SUCCESS: New project initialized!
```

### Step 4: Deploy Infrastructure and Services

```bash
azd up
```

**会发生什么**（需要 8-12 分钟）：
1. 创建 Container Apps 环境
2. 创建用于监控的 Application Insights
3. 构建 API Gateway 容器（Node.js）
4. 构建 Product Service 容器（Python）
5. 将两个容器部署到 Azure
6. 配置网络和健康检查
7. 设置监控和日志

**✓ 成功检查**：你应该看到：
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
Endpoint: https://api-gateway-<unique-id>.azurecontainerapps.io
```

**⏱️ 时间**：8-12 分钟

### Step 5: Test the Deployment

```bash
# 获取网关端点
GATEWAY_URL=$(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')

# 测试 API 网关健康状况
curl $GATEWAY_URL/health

# 预期输出:
# {"status":"healthy","service":"api-gateway","timestamp":"2025-11-19T10:30:00Z"}
```

**通过网关测试产品服务**：
```bash
# 列出产品
curl $GATEWAY_URL/api/products

# 预期输出：
# [
#   {"id":1,"name":"笔记本电脑","price":999.99,"stock":50},
#   {"id":2,"name":"鼠标","price":29.99,"stock":200},
#   {"id":3,"name":"键盘","price":79.99,"stock":150}
# ]
```

**✓ 成功检查**：两个端点都返回 JSON 数据且无错误。

---

**🎉 恭喜！** 你已将微服务架构部署到 Azure！

## Project Structure

所有实现文件均已包含——这是一个完整、可运行的示例：

```
microservices/
│
├── README.md                         # This file
├── azure.yaml                        # AZD configuration
├── .gitignore                        # Git ignore patterns
│
├── infra/                           # Infrastructure as Code (Bicep)
│   ├── main.bicep                   # Main orchestration
│   ├── abbreviations.json           # Naming conventions
│   ├── core/                        # Shared infrastructure
│   │   ├── container-apps-environment.bicep  # Container environment + registry
│   │   └── monitor.bicep            # Application Insights + Log Analytics
│   └── app/                         # Service definitions
│       ├── api-gateway.bicep        # API Gateway container app
│       └── product-service.bicep    # Product Service container app
│
└── src/                             # Application source code
    ├── api-gateway/                 # Node.js API Gateway
    │   ├── app.js                   # Express server with routing
    │   ├── package.json             # Node dependencies
    │   └── Dockerfile               # Container definition
    └── product-service/             # Python Product Service
        ├── main.py                  # Flask API with product data
        ├── requirements.txt         # Python dependencies
        └── Dockerfile               # Container definition
```

**各组件作用：**

**Infrastructure (infra/)**:
- `main.bicep`: 协调所有 Azure 资源及其依赖关系
- `core/container-apps-environment.bicep`: 创建 Container Apps 环境和 Azure Container Registry
- `core/monitor.bicep`: 为分布式日志设置 Application Insights
- `app/*.bicep`: 带有扩缩和健康检查的各个容器应用定义

**API Gateway (src/api-gateway/)**:
- 面向公众的服务，负责将请求路由到后端服务
- 实现日志记录、错误处理和请求转发
- 演示服务间的 HTTP 通信

**Product Service (src/product-service/)**:
- 内部服务，带有产品目录（为简单起见使用内存存储）
- 提供带健康检查的 REST API
- 后端微服务模式示例

## Services Overview

### API Gateway (Node.js/Express)

**端口**：8080  
**访问**：公开（外部入口）  
**用途**：将传入请求路由到相应的后端服务  

**端点**：
- `GET /` - 服务信息
- `GET /health` - 健康检查端点
- `GET /api/products` - 转发到产品服务（列出所有）
- `GET /api/products/:id` - 转发到产品服务（按 ID 获取）

**关键特性**：
- 使用 axios 的请求路由
- 集中式日志
- 错误处理和超时管理
- 通过环境变量的服务发现
- Application Insights 集成

**代码亮点** (`src/api-gateway/app.js`):
```javascript
// 内部服务通信
app.get('/api/products', async (req, res) => {
  const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
  res.json(response.data);
});
```

### Product Service (Python/Flask)

**端口**：8000  
**访问**：仅内部（无外部入口）  
**用途**：使用内存数据管理产品目录  

**端点**：
- `GET /` - 服务信息
- `GET /health` - 健康检查端点
- `GET /products` - 列出所有产品
- `GET /products/<id>` - 按 ID 获取产品

**关键特性**：
- 基于 Flask 的 RESTful API
- 内存产品存储（简单，无需数据库）
- 带探针的健康监控
- 结构化日志
- Application Insights 集成

**数据模型**：
```python
{
  "id": 1,
  "name": "Laptop",
  "description": "High-performance laptop",
  "price": 999.99,
  "stock": 50
}
```

**为什么仅内部？**
产品服务不对外公开。所有请求必须通过 API 网关，这提供了：
- 安全性：受控的访问点
- 灵活性：可更改后端而不影响客户端
- 监控：集中式请求日志

## Understanding Service Communication

### How Services Talk to Each Other

在此示例中，API 网关使用**内部 HTTP 调用**与产品服务通信：

```javascript
// API 网关 (src/api-gateway/app.js)
const PRODUCT_SERVICE_URL = process.env.PRODUCT_SERVICE_URL;

// 发起内部 HTTP 请求
const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
```

**关键点**：

1. **基于 DNS 的发现**：Container Apps 自动为内部服务提供 DNS
   - 产品服务 FQDN：`product-service.internal.<environment>.azurecontainerapps.io`
   - 简化为：`http://product-service`（Container Apps 会解析它）

2. **无公网暴露**：在 Bicep 中产品服务设置为 `external: false`
   - 仅能在 Container Apps 环境内访问
   - 无法从互联网直接访问

3. **环境变量**：服务 URL 在部署时注入
   - Bicep 将内部 FQDN 传递给网关
   - 应用代码中没有硬编码的 URL

**类比**：把这比作办公室的房间。API 网关是前台（面向公众），产品服务是办公室（仅内部）。访客必须通过前台才能到达任何办公室。

## Deployment Options

### Full Deployment (Recommended)

```bash
# 部署基础设施和两个服务
azd up
```

这将部署：
1. Container Apps 环境
2. Application Insights
3. Container Registry
4. API Gateway 容器
5. Product Service 容器

**时间**：8-12 分钟

### Deploy Individual Service

```bash
# 仅部署单个服务（在初始 azd up 之后）
azd deploy api-gateway

# 或者部署 product 服务
azd deploy product-service
```

**使用场景**：当你更新了某个服务的代码并且只想重新部署该服务时。

### Update Configuration

```bash
# 更改缩放参数
azd env set GATEWAY_MAX_REPLICAS 30

# 使用新配置重新部署
azd up
```

## Configuration

### Scaling Configuration

两个服务都在它们的 Bicep 文件中配置了基于 HTTP 的自动扩缩：

**API Gateway**：
- 最小副本数：2（为可用性始终至少 2 个）
- 最大副本数：20
- 扩缩触发器：每副本 50 个并发请求

**Product Service**：
- 最小副本数：1（如果需要可以扩缩到零）
- 最大副本数：10
- 扩缩触发器：每副本 100 个并发请求

**自定义扩缩**（在 `infra/app/*.bicep` 中）：
```bicep
scale: {
  minReplicas: 1
  maxReplicas: 10
  rules: [
    {
      name: 'http-scale-rule'
      http: {
        metadata: {
          concurrentRequests: '100'  // Adjust this
        }
      }
    }
  ]
}
```

### 资源分配

**API Gateway**：
- CPU：1.0 vCPU
- 内存：2 GiB
- 原因：处理所有外部流量

**Product Service**：
- CPU：0.5 vCPU
- 内存：1 GiB
- 原因：轻量级的内存操作

### 健康检查

两个服务都包含存活与就绪探针：

```bicep
probes: [
  {
    type: 'Liveness'
    httpGet: {
      path: '/health'
      port: 8080
    }
    initialDelaySeconds: 10
    periodSeconds: 30
  }
  {
    type: 'Readiness'
    httpGet: {
      path: '/health'
      port: 8080
    }
    initialDelaySeconds: 5
    periodSeconds: 10
  }
]
```

**这意味着什么**：
- **存活**：如果健康检查失败，Container Apps 会重启容器
- **就绪**：如果未就绪，Container Apps 会停止将流量路由到该副本



## Monitoring & Observability

### 查看服务日志

```bash
# 使用 azd monitor 查看日志
azd monitor --logs

# 或使用 Azure CLI 针对特定的容器应用：
# 从 API 网关流式传输日志
az containerapp logs show --name api-gateway --resource-group $RG_NAME --follow

# 查看最近的产品服务日志
az containerapp logs show --name product-service --resource-group $RG_NAME --tail 100
```

**预期输出**：
```
[api-gateway] API Gateway listening on port 8080
[api-gateway] Product Service URL: http://product-service
[api-gateway] GET /api/products 200 - 45ms
[product-service] Retrieved 5 products
```

### Application Insights 查询

在 Azure 门户访问 Application Insights，然后运行这些查询：

**查找慢请求**：
```kusto
requests
| where timestamp > ago(1h)
| where duration > 1000  // Requests taking >1 second
| summarize count() by name, cloud_RoleName
| order by count_ desc
```

**跟踪服务间调用**：
```kusto
dependencies
| where timestamp > ago(1h)
| where type == "Http"
| project timestamp, name, target, duration, success
| order by timestamp desc
```

**按服务统计错误率**：
```kusto
exceptions
| where timestamp > ago(24h)
| summarize errorCount = count() by cloud_RoleName, type
| order by errorCount desc
```

**请求量随时间变化**：
```kusto
requests
| where timestamp > ago(1h)
| summarize requestCount = count() by bin(timestamp, 5m), cloud_RoleName
| render timechart
```

### 访问监控仪表板

```bash
# 获取 Application Insights 的详细信息
azd env get-values | grep APPLICATIONINSIGHTS

# 打开 Azure 门户中的监视
az monitor app-insights component show \
  --app $(azd env get-values | grep APPLICATIONINSIGHTS_CONNECTION_STRING | cut -d '=' -f2) \
  --resource-group $(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2) \
  --query "appId" -o tsv
```

### 实时指标

1. 在 Azure 门户中导航到 Application Insights
2. 点击“Live Metrics”
3. 查看实时请求、失败和性能
4. 通过运行测试：`curl $(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')/api/products`

## Practical Exercises

[Note: See full exercises above in the "Practical Exercises" section for detailed step-by-step exercises including deployment verification, data modification, autoscaling tests, error handling, and adding a third service.]

## Cost Analysis

### Estimated Monthly Costs (For This 2-Service Example)

| Resource | Configuration | Estimated Cost |
|----------|--------------|----------------|
| API Gateway | 2-20 replicas, 1 vCPU, 2GB RAM | $30-150 |
| Product Service | 1-10 replicas, 0.5 vCPU, 1GB RAM | $15-75 |
| Container Registry | Basic tier | $5 |
| Application Insights | 1-2 GB/month | $5-10 |
| Log Analytics | 1 GB/month | $3 |
| **Total** | | **$58-243/month** |

**按使用情况的成本细分**：
- **轻量流量**（测试/学习）：~$60/月
- **中度流量**（小型生产）：~$120/月
- **高流量**（繁忙期）：~$240/月

### Cost Optimization Tips

1. **开发时缩放到零**：
   ```bicep
   scale: {
     minReplicas: 0  // Save $30-40/month when not in use
     maxReplicas: 10
   }
   ```

2. **为 Cosmos DB 使用按需消费计划**（当你添加它时）：
   - 只为实际使用付费
   - 无最低费用

3. **设置 Application Insights 采样**：
   ```javascript
   appInsights.defaultClient.config.samplingPercentage = 50; // 对 50% 的请求进行抽样
   ```

4. **不需要时清理资源**：
   ```bash
   azd down
   ```

### 免费层选项
用于学习/测试，请考虑：
- 使用 Azure 免费额度（前 30 天）
- 保持最小副本数
- 测试后删除（无持续费用）

---

## 清理

为避免持续费用，请删除所有资源：

```bash
azd down --force --purge
```

**确认提示**：
```
? Total resources to delete: 6, are you sure you want to continue? (y/N)
```

输入 `y` 确认。

**将被删除的内容**：
- Container Apps 环境
- 两个 Container Apps（网关和产品服务）
- 容器注册表
- Application Insights
- Log Analytics 工作区
- 资源组

**✓ 验证清理**：
```bash
az group list --query "[?starts_with(name,'rg-microservices')]" --output table
```

应返回空。

---

## 扩展指南：从 2 个服务到 5 个以上

一旦掌握了这个由 2 个服务组成的架构，以下是扩展的方法：

### 阶段 1：添加数据库持久化（下一步）

**为产品服务添加 Cosmos DB**：

1. 创建 `infra/core/cosmos.bicep`：
   ```bicep
   resource cosmosAccount 'Microsoft.DocumentDB/databaseAccounts@2023-04-15' = {
     name: name
     location: location
     kind: 'GlobalDocumentDB'
     properties: {
       databaseAccountOfferType: 'Standard'
       locations: [{ locationName: location, failoverPriority: 0 }]
     }
   }
   ```

2. 更新产品服务以使用 Cosmos DB 而不是内存数据

3. 预计额外费用：约 $25/月（无服务器）

### 阶段 2：添加第三个服务（订单管理）

**创建订单服务**：

1. 新建文件夹：`src/order-service/`（Python/Node.js/C#）
2. 新的 Bicep：`infra/app/order-service.bicep`
3. 更新 API 网关以路由 `/api/orders`
4. 为订单持久化添加 Azure SQL 数据库

**架构变为**：
```
API Gateway → Product Service (Cosmos DB)
           → Order Service (Azure SQL)
```

### 阶段 3：添加异步通信（Service Bus）

**实现事件驱动架构**：

1. 添加 Azure Service Bus：`infra/core/servicebus.bicep`
2. 产品服务发布 "ProductCreated" 事件
3. 订单服务订阅产品事件
4. 添加通知服务以处理事件

**模式**：请求/响应（HTTP）+ 事件驱动（Service Bus）

### 阶段 4：添加用户身份验证

**实现用户服务**：

1. 创建 `src/user-service/`（Go/Node.js）
2. 添加 Azure AD B2C 或 自定义 JWT 身份验证
3. API 网关验证令牌
4. 服务检查用户权限

### 阶段 5：生产就绪

**添加以下组件**：
- Azure Front Door（全局负载均衡）
- Azure Key Vault（机密管理）
- Azure Monitor Workbooks（自定义仪表板）
- CI/CD 管道（GitHub Actions）
- 蓝绿部署
- 为所有服务配置托管身份

**完整生产架构成本**：约 $300-1,400/月

---

## 了解更多

### 相关文档
- [Azure Container Apps 文档](https://learn.microsoft.com/azure/container-apps/)
- [微服务架构指南](https://learn.microsoft.com/azure/architecture/guide/architecture-styles/microservices)
- [用于分布式跟踪的 Application Insights](https://learn.microsoft.com/azure/azure-monitor/app/distributed-tracing)
- [Azure Developer CLI 文档](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

### 本课程的下一步
- ← 上一步: [Simple Flask API](../../../../../examples/container-app/simple-flask-api) - 入门单容器示例
- → 下一步: [AI 集成指南](../../../../../examples/docs/ai-foundry) - 添加 AI 功能
- 🏠 [课程首页](../../README.md)

### 比较：何时使用何种方案

**单容器应用**（Simple Flask API 示例）：
- ✅ 简单应用
- ✅ 单体架构
- ✅ 快速部署
- ❌ 可扩展性有限
- **成本**：约 $15-50/月

**微服务**（本示例）：
- ✅ 适用于复杂应用
- ✅ 服务可独立伸缩
- ✅ 团队自治（不同服务由不同团队）
- ❌ 管理更复杂
- **成本**：约 $60-250/月

**Kubernetes（AKS）**：
- ✅ 最大程度的控制和灵活性
- ✅ 多云可移植性
- ✅ 高级网络功能
- ❌ 需要 Kubernetes 专业知识
- **成本**：最低约 $150-500/月

**推荐**：从 Container Apps（本示例）开始，只有在需要 Kubernetes 特定功能时再迁移到 AKS。

---

## 常见问题

**问：为什么只有 2 个服务而不是 5 个以上？**  
答：逐步教学。先掌握基础（服务通信、监控、伸缩），使用简单示例再增加复杂性。这里学到的模式适用于拥有 100 个服务的架构。

**问：我可以自己添加更多服务吗？**  
答：当然！请按照上面的扩展指南操作。每个新服务遵循相同模式：创建 src 文件夹，创建 Bicep 文件，更新 azure.yaml，部署。

**问：这可以用于生产吗？**  
答：这是一个坚实的基础。要用于生产，请添加：托管身份、Key Vault、持久化数据库、CI/CD 管道、监控告警和备份策略。

**问：为什么不使用 Dapr 或其他服务网格？**  
答：为便于学习保持简单。一旦了解了原生 Container Apps 网络，就可以在高级场景中加入 Dapr。

**问：如何在本地调试？**  
答：使用 Docker 在本地运行服务：
```bash
cd src/api-gateway
docker build -t local-gateway .
docker run -p 8080:8080 -e PRODUCT_SERVICE_URL=http://localhost:8000 local-gateway
```

**问：我可以使用不同的编程语言吗？**  
答：可以！本示例展示了 Node.js（网关）+ Python（产品服务）。您可以混合任何可以运行在容器中的语言。

**问：如果我没有 Azure 积分怎么办？**  
答：使用 Azure 免费层（新账户前 30 天）或仅进行短期测试并立即删除。

---

> **🎓 学习路径摘要**：您已学会部署具有自动伸缩、内部网络、集中监控和生产就绪模式的多服务架构。这个基础将使您为复杂的分布式系统和企业级微服务架构做好准备。

**📚 课程导航：**
- ← 上一步: [Simple Flask API](../../../../../examples/container-app/simple-flask-api)
- → 下一步: [数据库集成示例](../../../../../examples/database-app)
- 🏠 [课程首页](../../../README.md)
- 📖 [Container Apps 最佳实践](../../../docs/chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免责声明：
本文件使用 AI 翻译服务 [Co-op Translator](https://github.com/Azure/co-op-translator) 进行翻译。尽管我们力求准确，但请注意自动翻译可能包含错误或不准确之处。原始语言的原文应被视为权威来源。对于关键信息，建议使用专业人工翻译。我们不对因使用本翻译而产生的任何误解或错误解释承担责任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->