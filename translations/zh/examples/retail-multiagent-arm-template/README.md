<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "eb84941706983946ae03bfa0433c0bb6",
  "translation_date": "2025-09-17T13:37:58+00:00",
  "source_file": "examples/retail-multiagent-arm-template/README.md",
  "language_code": "zh"
}
-->
# 零售多代理解决方案 - ARM模板部署

**第五章：生产部署包**
- **📚 课程主页**: [AZD 初学者指南](../../README.md)
- **📖 相关章节**: [第五章：多代理AI解决方案](../../README.md#-chapter-5-multi-agent-ai-solutions-advanced)
- **📝 场景指南**: [完整实施](../retail-scenario.md)
- **🎯 快速部署**: [一键部署](../../../../examples/retail-multiagent-arm-template)

此目录包含用于部署零售多代理客户支持解决方案的完整Azure资源管理器（ARM）模板，为整个架构提供基础设施即代码。

## 🎯 部署内容

### 核心基础设施
- **Azure OpenAI 服务**（多区域以确保高可用性）
  - 主区域：GPT-4o用于客户代理
  - 次区域：GPT-4o-mini用于库存代理  
  - 第三区域：文本嵌入模型
  - 评估区域：GPT-4o评分模型
- **Azure AI 搜索**，支持向量搜索功能
- **Azure 存储账户**，包含用于文档和上传的Blob容器
- **Azure 容器应用环境**，支持自动扩展
- **容器应用**，用于代理路由器和前端
- **Azure Cosmos DB**，用于聊天记录存储
- **Azure Key Vault**，用于密钥管理（可选）
- **Application Insights** 和日志分析，用于监控（可选）
- **文档智能**，用于文档处理
- **Bing 搜索 API**，用于实时信息查询

### 部署模式

| 模式 | 描述 | 使用场景 | 资源 |
|------|-------------|----------|-----------|
| **Minimal** | 成本优化的基础部署 | 开发、测试 | 基础SKU，单区域，容量较低 |
| **Standard** | 平衡的生产部署 | 生产、中等规模 | 标准SKU，多区域，标准容量 |
| **Premium** | 高性能企业级部署 | 企业、高规模 | 高级SKU，多区域，高容量 |

## 📋 前置条件

1. **已安装并配置Azure CLI**
2. **有效的Azure订阅**，具有足够的配额
3. **适当的权限**，以便在目标订阅中创建资源
4. **资源配额**:
   - Azure OpenAI（检查区域可用性）
   - 容器应用（因区域而异）
   - AI 搜索（建议使用标准层或更高）

## 🚀 快速部署

### 选项1：使用Azure CLI

```bash
# Clone or download the template files
git clone <repository-url>
cd examples/retail-multiagent-arm-template

# Make the deployment script executable
chmod +x deploy.sh

# Deploy with default settings
./deploy.sh -g myResourceGroup

# Deploy for production with premium features
./deploy.sh -g myProdRG -e prod -m premium -l eastus2
```

### 选项2：使用Azure门户

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2Fazd-for-beginners%2Fmain%2Fexamples%2Fretail-multiagent-arm-template%2Fazuredeploy.json)

### 选项3：直接使用Azure CLI

```bash
# Create resource group
az group create --name myResourceGroup --location eastus2

# Deploy template
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json
```

## ⚙️ 配置选项

### 模板参数

| 参数 | 类型 | 默认值 | 描述 |
|-----------|------|---------|-------------|
| `projectName` | string | "retail" | 所有资源名称的前缀 |
| `location` | string | 资源组位置 | 主部署区域 |
| `secondaryLocation` | string | "westus2" | 用于多区域部署的次区域 |
| `tertiaryLocation` | string | "francecentral" | 嵌入模型的区域 |
| `environmentName` | string | "dev" | 环境标识（开发/测试/生产） |
| `deploymentMode` | string | "standard" | 部署配置（minimal/standard/premium） |
| `enableMultiRegion` | bool | true | 启用多区域部署 |
| `enableMonitoring` | bool | true | 启用Application Insights和日志记录 |
| `enableSecurity` | bool | true | 启用Key Vault和增强安全性 |

### 自定义参数

编辑 `azuredeploy.parameters.json`:

```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "projectName": {
      "value": "mycompany"
    },
    "environmentName": {
      "value": "prod"
    },
    "deploymentMode": {
      "value": "premium"
    },
    "location": {
      "value": "eastus2"
    }
  }
}
```

## 🏗️ 架构概览

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Frontend      │    │  Agent Router   │    │     Agents      │
│ (Container App) │───▶│ (Container App) │───▶│ Customer + Inv  │
└─────────────────┘    └─────────────────┘    └─────────────────┘
                                │                        │
                                ▼                        ▼
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   AI Search     │    │  Azure OpenAI   │    │    Storage      │
│   (Vector DB)   │    │ (Multi-region)  │    │   (Documents)   │
└─────────────────┘    └─────────────────┘    └─────────────────┘
                                │                        │
                                ▼                        ▼
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│  Cosmos DB      │    │ App Insights    │    │   Key Vault     │
│ (Chat History)  │    │  (Monitoring)   │    │   (Secrets)     │
└─────────────────┘    └─────────────────┘    └─────────────────┘
```

## 📖 部署脚本使用

`deploy.sh`脚本提供交互式部署体验：

```bash
# Show help
./deploy.sh --help

# Basic deployment
./deploy.sh -g myResourceGroup

# Advanced deployment with custom settings
./deploy.sh \
  -g myProductionRG \
  -p companyname \
  -e prod \
  -m premium \
  -l eastus2

# Development deployment without multi-region
./deploy.sh \
  -g myDevRG \
  -e dev \
  -m minimal \
  --no-multi-region \
  --no-security
```

### 脚本功能

- ✅ **前置条件验证**（Azure CLI、登录状态、模板文件）
- ✅ **资源组管理**（如果不存在则创建）
- ✅ **模板验证**，确保部署前无错误
- ✅ **进度监控**，带有彩色输出
- ✅ **部署输出**显示
- ✅ **部署后指导**

## 📊 部署监控

### 检查部署状态

```bash
# List deployments
az deployment group list --resource-group myResourceGroup --output table

# Get deployment details
az deployment group show \
  --resource-group myResourceGroup \
  --name retail-deployment-YYYYMMDD-HHMMSS

# Watch deployment progress
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --verbose
```

### 部署输出

成功部署后，可用以下输出：

- **前端URL**：Web界面的公共端点
- **路由器URL**：代理路由器的API端点
- **OpenAI端点**：主次OpenAI服务端点
- **搜索服务**：Azure AI搜索服务端点
- **存储账户**：用于文档的存储账户名称
- **Key Vault**：Key Vault的名称（如果启用）
- **Application Insights**：监控服务的名称（如果启用）

## 🔧 部署后配置

### 1. 配置搜索索引

```bash
# Set environment variables from deployment outputs
export SEARCH_SERVICE_NAME="<search-service-name>"
export SEARCH_ADMIN_KEY="<search-admin-key>"

# Create search index (customize schema as needed)
curl -X POST "https://${SEARCH_SERVICE_NAME}.search.windows.net/indexes?api-version=2023-11-01" \
  -H "Content-Type: application/json" \
  -H "api-key: ${SEARCH_ADMIN_KEY}" \
  -d @../data/search-schema.json
```

### 2. 上传初始数据

```bash
# Upload documents to storage
az storage blob upload-batch \
  --destination documents \
  --source ../data/initial-docs \
  --account-name <storage-account-name>
```

### 3. 测试代理端点

```bash
# Test router endpoint
curl -X POST "<router-url>/chat" \
  -H "Content-Type: application/json" \
  -d '{
    "message": "Hello, I need help with my order",
    "agent": "customer"
  }'
```

### 4. 配置容器应用

ARM模板部署了占位容器镜像。要部署实际代理代码：

```bash
# Build and push agent images
docker build -t myregistry.azurecr.io/agent-router:latest ./src/router
docker build -t myregistry.azurecr.io/frontend:latest ./src/frontend

# Update container apps
az containerapp update \
  --name retail-router \
  --resource-group myResourceGroup \
  --image myregistry.azurecr.io/agent-router:latest
```

## 🛠️ 故障排除

### 常见问题

#### 1. Azure OpenAI 配额超限

```bash
# Check current quota usage
az cognitiveservices usage list --location eastus2

# Request quota increase
az support tickets create \
  --ticket-name "OpenAI-Quota-Increase" \
  --severity "minimal" \
  --description "Request quota increase for Azure OpenAI in region X"
```

#### 2. 容器应用部署失败

```bash
# Check container app logs
az containerapp logs show \
  --name retail-router \
  --resource-group myResourceGroup \
  --follow

# Restart container app
az containerapp revision restart \
  --name retail-router \
  --resource-group myResourceGroup
```

#### 3. 搜索服务初始化问题

```bash
# Verify search service status
az search service show \
  --name <search-service-name> \
  --resource-group myResourceGroup

# Test search service connectivity
curl -X GET "https://<search-service-name>.search.windows.net/indexes?api-version=2023-11-01" \
  -H "api-key: <search-admin-key>"
```

### 部署验证

```bash
# Validate all resources are created
az resource list \
  --resource-group myResourceGroup \
  --output table

# Check resource health
az resource list \
  --resource-group myResourceGroup \
  --query "[?provisioningState!='Succeeded'].{Name:name, Status:provisioningState, Type:type}" \
  --output table
```

## 🔐 安全注意事项

### 密钥管理
- 所有密钥存储在Azure Key Vault中（如果启用）
- 容器应用使用托管身份进行认证
- 存储账户启用安全默认值（仅HTTPS，无公共Blob访问）

### 网络安全
- 容器应用尽可能使用内部网络
- 搜索服务配置为私有端点选项
- Cosmos DB配置为最低必要权限

### RBAC配置
```bash
# Assign necessary roles for managed identity
az role assignment create \
  --assignee <container-app-managed-identity> \
  --role "Cognitive Services OpenAI User" \
  --scope <openai-resource-id>
```

## 💰 成本优化

### 成本估算（每月，美元）

| 模式 | OpenAI | 容器应用 | 搜索 | 存储 | 总计估算 |
|------|--------|----------------|--------|---------|------------|
| Minimal | $50-200 | $20-50 | $25-100 | $5-20 | $100-370 |
| Standard | $200-800 | $100-300 | $100-300 | $20-50 | $420-1450 |
| Premium | $500-2000 | $300-800 | $300-600 | $50-100 | $1150-3500 |

### 成本监控

```bash
# Set up budget alerts
az consumption budget create \
  --account-name <subscription-id> \
  --budget-name "retail-budget" \
  --amount 500 \
  --time-grain Monthly \
  --start-date 2024-01-01 \
  --end-date 2024-12-31
```

## 🔄 更新与维护

### 模板更新
- 对ARM模板文件进行版本控制
- 在开发环境中先测试更改
- 使用增量部署模式进行更新

### 资源更新
```bash
# Update with new parameters
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --mode Incremental
```

### 备份与恢复
- Cosmos DB启用自动备份
- Key Vault启用软删除
- 容器应用保留修订版本以便回滚

## 📞 支持

- **模板问题**: [GitHub Issues](https://github.com/microsoft/azd-for-beginners/issues)
- **Azure支持**: [Azure支持门户](https://portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade)
- **社区**: [Azure AI Discord](https://discord.gg/microsoft-azure)

---

**⚡ 准备好部署您的多代理解决方案了吗？**

开始命令：`./deploy.sh -g myResourceGroup`

---

**免责声明**：  
本文档使用AI翻译服务[Co-op Translator](https://github.com/Azure/co-op-translator)进行翻译。尽管我们努力确保翻译的准确性，但请注意，自动翻译可能包含错误或不准确之处。原始语言的文档应被视为权威来源。对于关键信息，建议使用专业人工翻译。我们不对因使用此翻译而产生的任何误解或误读承担责任。