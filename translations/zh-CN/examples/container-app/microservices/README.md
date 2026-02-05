# 微服务架构 - 容器应用示例

⏱️ **预计时间**：25-35 分钟 | 💰 **预计成本**：约 $50-100/月 | ⭐ **复杂度**：高级

一个**简化但功能齐全**的微服务架构，使用 AZD CLI 部署到 Azure 容器应用。本示例展示了服务间通信、容器编排和监控，采用了实用的两服务设置。

> **📚 学习方法**：本示例从一个最小的两服务架构（API 网关 + 后端服务）开始，您可以实际部署并学习。在掌握这一基础后，我们提供扩展到完整微服务生态系统的指导。

## 您将学到什么

完成本示例后，您将能够：
- 将多个容器部署到 Azure 容器应用
- 使用内部网络实现服务间通信
- 配置基于环境的扩展和健康检查
- 使用 Application Insights 监控分布式应用
- 理解微服务部署模式和最佳实践
- 学习从简单到复杂架构的渐进式扩展

## 架构

### 阶段 1：我们将构建什么（本示例包含）

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

**为什么从简单开始？**
- ✅ 快速部署和理解（25-35 分钟）
- ✅ 学习核心微服务模式而不增加复杂性
- ✅ 提供可修改和实验的工作代码
- ✅ 学习成本更低（约 $50-100/月，而非 $300-1400/月）
- ✅ 在添加数据库和消息队列之前建立信心

**类比**：这就像学习驾驶。您从空停车场（2 个服务）开始，掌握基础知识，然后逐步进入城市交通（5+ 服务，带数据库）。

### 阶段 2：未来扩展（参考架构）

在掌握两服务架构后，您可以扩展到：

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

请参阅文末的“扩展指南”部分，获取分步说明。

## 包含的功能

✅ **服务发现**：基于 DNS 的容器间自动发现  
✅ **负载均衡**：内置跨副本的负载均衡  
✅ **自动扩展**：基于 HTTP 请求的独立服务扩展  
✅ **健康监控**：两服务的存活性和就绪性探针  
✅ **分布式日志记录**：使用 Application Insights 的集中式日志记录  
✅ **内部网络**：安全的服务间通信  
✅ **容器编排**：自动部署和扩展  
✅ **零停机更新**：带版本管理的滚动更新  

## 先决条件

### 必需工具

开始之前，请确认您已安装以下工具：

1. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)**（版本 1.0.0 或更高）
   ```bash
   azd version
   # 预期输出：azd版本1.0.0或更高
   ```

2. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)**（版本 2.50.0 或更高）
   ```bash
   az --version
   # 预期输出：azure-cli 2.50.0或更高版本
   ```

3. **[Docker](https://www.docker.com/get-started)**（用于本地开发/测试 - 可选）
   ```bash
   docker --version
   # 预期输出：Docker版本20.10或更高
   ```

### Azure 要求

- 一个有效的 **Azure 订阅**（[创建免费账户](https://azure.microsoft.com/free/)）
- 在订阅中创建资源的权限
- **订阅或资源组的贡献者角色**

### 知识要求

这是一个**高级**示例。您应具备：
- 完成 [Simple Flask API 示例](../../../../../examples/container-app/simple-flask-api) 的经验
- 对微服务架构的基本理解
- 熟悉 REST API 和 HTTP
- 理解容器概念

**刚接触容器应用？** 请先从 [Simple Flask API 示例](../../../../../examples/container-app/simple-flask-api) 开始学习基础知识。

## 快速开始（分步指南）

### 第 1 步：克隆并导航

```bash
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/container-app/microservices
```

**✓ 成功检查**：确认您能看到 `azure.yaml`：
```bash
ls
# 预期：README.md, azure.yaml, infra/, src/
```

### 第 2 步：使用 Azure 进行身份验证

```bash
azd auth login
```

这将打开您的浏览器进行 Azure 身份验证。使用您的 Azure 凭据登录。

**✓ 成功检查**：您应看到：
```
Logged in to Azure.
```

### 第 3 步：初始化环境

```bash
azd init
```

**您将看到的提示**：
- **环境名称**：输入一个简短名称（例如 `microservices-dev`）
- **Azure 订阅**：选择您的订阅
- **Azure 位置**：选择一个区域（例如 `eastus`，`westeurope`）

**✓ 成功检查**：您应看到：
```
SUCCESS: New project initialized!
```

### 第 4 步：部署基础设施和服务

```bash
azd up
```

**发生了什么**（需要 8-12 分钟）：
1. 创建容器应用环境
2. 创建用于监控的 Application Insights
3. 构建 API 网关容器（Node.js）
4. 构建产品服务容器（Python）
5. 将两个容器部署到 Azure
6. 配置网络和健康检查
7. 设置监控和日志记录

**✓ 成功检查**：您应看到：
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
Endpoint: https://api-gateway-<unique-id>.azurecontainerapps.io
```

**⏱️ 时间**：8-12 分钟

### 第 5 步：测试部署

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

# 预期输出:
# [
#   {"id":1,"name":"笔记本电脑","price":999.99,"stock":50},
#   {"id":2,"name":"鼠标","price":29.99,"stock":200},
#   {"id":3,"name":"键盘","price":79.99,"stock":150}
# ]
```

**✓ 成功检查**：两个端点均返回 JSON 数据且无错误。

---

**🎉 恭喜！** 您已将微服务架构部署到 Azure！

## 项目结构

所有实现文件均已包含——这是一个完整的、可运行的示例：

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

**每个组件的作用：**

**基础设施（infra/）**：
- `main.bicep`：编排所有 Azure 资源及其依赖项
- `core/container-apps-environment.bicep`：创建容器应用环境和 Azure 容器注册表
- `core/monitor.bicep`：设置用于分布式日志记录的 Application Insights
- `app/*.bicep`：包含扩展和健康检查的单个容器应用定义

**API 网关（src/api-gateway/）**：
- 面向公众的服务，用于将请求路由到后端服务
- 实现日志记录、错误处理和请求转发
- 展示服务间 HTTP 通信

**产品服务（src/product-service/）**：
- 内部服务，包含产品目录（为简化使用内存存储）
- 带健康检查的 REST API
- 后端微服务模式示例

## 服务概览

### API 网关（Node.js/Express）

**端口**：8080  
**访问**：公共（外部入口）  
**目的**：将传入请求路由到相应的后端服务  

**端点**：
- `GET /` - 服务信息
- `GET /health` - 健康检查端点
- `GET /api/products` - 转发到产品服务（列出所有）
- `GET /api/products/:id` - 转发到产品服务（按 ID 获取）

**关键功能**：
- 使用 axios 进行请求路由
- 集中式日志记录
- 错误处理和超时管理
- 通过环境变量进行服务发现
- 集成 Application Insights

**代码亮点**（`src/api-gateway/app.js`）：
```javascript
// 内部服务通信
app.get('/api/products', async (req, res) => {
  const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
  res.json(response.data);
});
```

### 产品服务（Python/Flask）

**端口**：8000  
**访问**：仅限内部（无外部入口）  
**目的**：管理带内存数据的产品目录  

**端点**：
- `GET /` - 服务信息
- `GET /health` - 健康检查端点
- `GET /products` - 列出所有产品
- `GET /products/<id>` - 按 ID 获取产品

**关键功能**：
- 使用 Flask 的 RESTful API
- 内存产品存储（简单，无需数据库）
- 使用探针进行健康监控
- 结构化日志记录
- 集成 Application Insights

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

**为什么仅限内部？**
产品服务不对外公开。所有请求必须通过 API 网关，这提供了：
- 安全性：受控的访问点
- 灵活性：可以更改后端而不影响客户端
- 监控：集中式请求日志记录

## 理解服务通信

### 服务如何相互通信

在本示例中，API 网关通过**内部 HTTP 调用**与产品服务通信：

```javascript
// API网关 (src/api-gateway/app.js)
const PRODUCT_SERVICE_URL = process.env.PRODUCT_SERVICE_URL;

// 发起内部HTTP请求
const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
```

**关键点**：

1. **基于 DNS 的发现**：容器应用自动为内部服务提供 DNS
   - 产品服务 FQDN：`product-service.internal.<environment>.azurecontainerapps.io`
   - 简化为：`http://product-service`（容器应用会解析）

2. **无公共暴露**：产品服务在 Bicep 中设置为 `external: false`
   - 仅在容器应用环境内可访问
   - 无法从互联网访问

3. **环境变量**：服务 URL 在部署时注入
   - Bicep 将内部 FQDN 传递给网关
   - 应用代码中无硬编码 URL

**类比**：这就像办公室房间。API 网关是接待处（面向公众），而产品服务是办公室房间（仅限内部）。访客必须通过接待处才能进入任何办公室。

## 部署选项

### 完整部署（推荐）

```bash
# 部署基础设施和两个服务
azd up
```

这将部署：
1. 容器应用环境
2. Application Insights
3. 容器注册表
4. API 网关容器
5. 产品服务容器

**时间**：8-12 分钟

### 部署单个服务

```bash
# 仅部署一个服务（在初始 azd up 之后）
azd deploy api-gateway

# 或部署产品服务
azd deploy product-service
```

**使用场景**：当您更新了某个服务的代码并希望仅重新部署该服务时。

### 更新配置

```bash
# 更改缩放参数
azd env set GATEWAY_MAX_REPLICAS 30

# 使用新配置重新部署
azd up
```

## 配置

### 扩展配置

两服务在其 Bicep 文件中配置了基于 HTTP 的自动扩展：

**API 网关**：
- 最小副本数：2（始终至少 2 个以确保可用性）
- 最大副本数：20
- 扩展触发器：每副本 50 个并发请求

**产品服务**：
- 最小副本数：1（如有需要可扩展到 0）
- 最大副本数：10
- 扩展触发器：每副本 100 个并发请求

**自定义扩展**（在 `infra/app/*.bicep` 中）：
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

**API 网关**：
- CPU：1.0 vCPU
- 内存：2 GiB
- 原因：处理所有外部流量

**产品服务**：
- CPU：0.5 vCPU
- 内存：1 GiB
- 原因：轻量级内存操作

### 健康检查

两服务均包含存活性和就绪性探针：

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

**这意味着**：
- **存活性**：如果健康检查失败，容器应用将重启容器
- **就绪性**：如果未就绪，容器应用将停止将流量路由到该副本

## 监控与可观测性

### 查看服务日志

```bash
# 从 API Gateway 流式传输日志
azd logs api-gateway --follow

# 查看最近的产品服务日志
azd logs product-service --tail 100

# 查看两个服务的所有日志
azd logs --follow
```

**预期输出**：
```
[api-gateway] API Gateway listening on port 8080
[api-gateway] Product Service URL: http://product-service
[api-gateway] GET /api/products 200 - 45ms
[product-service] Retrieved 5 products
```

### Application Insights 查询

在 Azure 门户中访问 Application Insights，然后运行以下查询：

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

**按服务的错误率**：
```kusto
exceptions
| where timestamp > ago(24h)
| summarize errorCount = count() by cloud_RoleName, type
| order by errorCount desc
```

**随时间的请求量**：
```kusto
requests
| where timestamp > ago(1h)
| summarize requestCount = count() by bin(timestamp, 5m), cloud_RoleName
| render timechart
```

### 访问监控仪表板

```bash
# 获取应用程序洞察详细信息
azd env get-values | grep APPLICATIONINSIGHTS

# 打开 Azure 门户监控
az monitor app-insights component show \
  --app $(azd env get-values | grep APPLICATIONINSIGHTS_CONNECTION_STRING | cut -d '=' -f2) \
  --resource-group $(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2) \
  --query "appId" -o tsv
```

### 实时指标

1. 在 Azure 门户中导航到 Application Insights
2. 点击“实时指标”
3. 查看实时请求、失败和性能
4. 测试运行：`curl $(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')/api/products`

## 实践练习

[注意：请参阅上文“实践练习”部分，获取包括部署验证、数据修改、自动扩展测试、错误处理以及添加第三个服务的详细分步练习。]

## 成本分析

### 预计月成本（针对本两服务示例）

| 资源 | 配置 | 预计成本 |
|------|------|----------|
| API 网关 | 2-20 副本，1 vCPU，2GB RAM | $30-150 |
| 产品服务 | 1-10 副本，0.5 vCPU，1GB RAM | $15-75 |
| 容器注册表 | 基本层 | $5 |
| Application Insights | 1-2 GB/月 | $5-10 |
| 日志分析 | 1 GB/月 | $3 |
| **总计** | | **$58-243/月** |

**按使用情况的成本分解**：
- **轻量流量**（测试/学习）：约 $60/月
- **中等流量**（小型生产）：约 $120/月
- **高流量**（繁忙时段）：约 $240/月

### 成本优化提示

1. **开发时缩减到零**：
   ```bicep
   scale: {
     minReplicas: 0  // Save $30-40/month when not in use
     maxReplicas: 10
   }
   ```

2. **为 Cosmos DB 使用消费计划**（当您添加它时）：
   - 仅为实际使用付费
   - 无最低费用

3. **设置 Application Insights 采样**：
   ```javascript
   appInsights.defaultClient.config.samplingPercentage = 50; // 抽取50%的请求
   ```

4. **不需要时清理**：
   ```bash
   azd down
   ```

### 免费层选项
用于学习/测试，请考虑：
- 使用 Azure 免费额度（前 30 天）
- 保持最低副本数
- 测试后删除（避免持续费用）

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

输入 `y` 以确认。

**删除内容**：
- 容器应用环境
- 两个容器应用（网关和产品服务）
- 容器注册表
- 应用洞察
- 日志分析工作区
- 资源组

**✓ 验证清理**：
```bash
az group list --query "[?starts_with(name,'rg-microservices')]" --output table
```

应返回空结果。

---

## 扩展指南：从 2 个服务到 5 个以上服务

掌握了这个两服务架构后，可以按以下步骤扩展：

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

2. 更新产品服务以使用 Cosmos DB 替代内存数据

3. 预计额外成本：~$25/月（无服务器模式）

### 阶段 2：添加第三个服务（订单管理）

**创建订单服务**：

1. 新建文件夹：`src/order-service/`（Python/Node.js/C#）
2. 新建 Bicep 文件：`infra/app/order-service.bicep`
3. 更新 API 网关以路由 `/api/orders`
4. 添加 Azure SQL 数据库用于订单持久化

**架构变为**：
```
API Gateway → Product Service (Cosmos DB)
           → Order Service (Azure SQL)
```

### 阶段 3：添加异步通信（服务总线）

**实现事件驱动架构**：

1. 添加 Azure 服务总线：`infra/core/servicebus.bicep`
2. 产品服务发布 "ProductCreated" 事件
3. 订单服务订阅产品事件
4. 添加通知服务以处理事件

**模式**：请求/响应（HTTP）+ 事件驱动（服务总线）

### 阶段 4：添加用户认证

**实现用户服务**：

1. 创建 `src/user-service/`（Go/Node.js）
2. 添加 Azure AD B2C 或自定义 JWT 认证
3. API 网关验证令牌
4. 服务检查用户权限

### 阶段 5：生产就绪

**添加以下组件**：
- Azure Front Door（全球负载均衡）
- Azure Key Vault（密钥管理）
- Azure Monitor Workbooks（自定义仪表盘）
- CI/CD 流水线（GitHub Actions）
- 蓝绿部署
- 所有服务的托管身份

**完整生产架构成本**：~$300-1,400/月

---

## 了解更多

### 相关文档
- [Azure 容器应用文档](https://learn.microsoft.com/azure/container-apps/)
- [微服务架构指南](https://learn.microsoft.com/azure/architecture/guide/architecture-styles/microservices)
- [分布式跟踪的应用洞察](https://learn.microsoft.com/azure/azure-monitor/app/distributed-tracing)
- [Azure 开发者 CLI 文档](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

### 本课程的下一步
- ← 上一节：[简单 Flask API](../../../../../examples/container-app/simple-flask-api) - 初学者单容器示例
- → 下一节：[AI 集成指南](../../../../../examples/docs/ai-foundry) - 添加 AI 功能
- 🏠 [课程主页](../../README.md)

### 比较：何时使用哪种架构

**单容器应用**（简单 Flask API 示例）：
- ✅ 简单应用
- ✅ 单体架构
- ✅ 部署快速
- ❌ 可扩展性有限
- **成本**：~$15-50/月

**微服务**（本示例）：
- ✅ 复杂应用
- ✅ 每个服务独立扩展
- ✅ 团队自治（不同服务由不同团队负责）
- ❌ 管理更复杂
- **成本**：~$60-250/月

**Kubernetes (AKS)**：
- ✅ 最大的控制和灵活性
- ✅ 多云可移植性
- ✅ 高级网络功能
- ❌ 需要 Kubernetes 专业知识
- **成本**：~$150-500/月起

**推荐**：从容器应用（本示例）开始，仅在需要 Kubernetes 特定功能时迁移到 AKS。

---

## 常见问题解答

**问：为什么只有 2 个服务而不是 5 个以上？**  
答：学习进阶。通过简单示例掌握基础知识（服务通信、监控、扩展）后再增加复杂性。这里学到的模式适用于 100 个服务的架构。

**问：我可以自己添加更多服务吗？**  
答：当然可以！按照上面的扩展指南操作。每个新服务遵循相同的模式：创建 src 文件夹，创建 Bicep 文件，更新 azure.yaml，部署。

**问：这是生产就绪的吗？**  
答：这是一个坚实的基础。对于生产环境，请添加：托管身份、Key Vault、持久化数据库、CI/CD 流水线、监控警报和备份策略。

**问：为什么不使用 Dapr 或其他服务网格？**  
答：为了学习保持简单。一旦理解了原生容器应用的网络功能，可以在高级场景中叠加使用 Dapr。

**问：如何在本地调试？**  
答：使用 Docker 在本地运行服务：
```bash
cd src/api-gateway
docker build -t local-gateway .
docker run -p 8080:8080 -e PRODUCT_SERVICE_URL=http://localhost:8000 local-gateway
```

**问：可以使用不同的编程语言吗？**  
答：可以！本示例展示了 Node.js（网关）+ Python（产品服务）。您可以混合使用任何可以运行在容器中的语言。

**问：如果我没有 Azure 额度怎么办？**  
答：使用 Azure 免费层（新账户前 30 天）或短期测试后立即删除部署。

---

> **🎓 学习路径总结**：您已经学会了部署一个具有自动扩展、内部网络、集中监控和生产就绪模式的多服务架构。这一基础为复杂的分布式系统和企业级微服务架构做好了准备。

**📚 课程导航：**
- ← 上一节：[简单 Flask API](../../../../../examples/container-app/simple-flask-api)
- → 下一节：[数据库集成示例](../../../../../examples/database-app)
- 🏠 [课程主页](../../README.md)
- 📖 [容器应用最佳实践](../../docs/deployment/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免责声明**：  
本文档使用AI翻译服务[Co-op Translator](https://github.com/Azure/co-op-translator)进行翻译。尽管我们努力确保翻译的准确性，但请注意，自动翻译可能包含错误或不准确之处。原始语言的文档应被视为权威来源。对于关键信息，建议使用专业人工翻译。我们对因使用此翻译而产生的任何误解或误读不承担责任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->