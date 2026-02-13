# 零售多代理解决方案 - 基础设施模板

**第5章：生产部署包**
- **📚 课程主页**：[AZD 初学者指南](../../README.md)
- **📖 相关章节**：[第5章：多代理AI解决方案](../../README.md#-chapter-5-multi-agent-ai-solutions-advanced)
- **📝 场景指南**：[完整架构](../retail-scenario.md)
- **🎯 快速部署**：[一键部署](../../../../examples/retail-multiagent-arm-template)

> **⚠️ 仅限基础设施模板**  
> 此ARM模板用于部署多代理系统的**Azure资源**。  
>  
> **部署内容（15-25分钟）：**
> - ✅ Azure OpenAI（GPT-4o、GPT-4o-mini、跨3个区域的嵌入模型）
> - ✅ AI搜索服务（空白，准备创建索引）
> - ✅ 容器应用（占位镜像，准备好您的代码）
> - ✅ 存储、Cosmos DB、Key Vault、Application Insights
>  
> **未包含内容（需要开发）：**
> - ❌ 代理实现代码（客户代理、库存代理）
> - ❌ 路由逻辑和API端点
> - ❌ 前端聊天界面
> - ❌ 搜索索引架构和数据管道
> - ❌ **预计开发时间：80-120小时**
>  
> **使用此模板的条件：**
> - ✅ 您希望为多代理项目配置Azure基础设施
> - ✅ 您计划单独开发代理实现
> - ✅ 您需要生产就绪的基础设施基线
>  
> **不适用的情况：**
> - ❌ 您期望立即获得一个可用的多代理演示
> - ❌ 您正在寻找完整的应用代码示例

## 概述

此目录包含一个全面的Azure资源管理器（ARM）模板，用于部署多代理客户支持系统的**基础设施基础**。该模板会配置所有必要的Azure服务，并正确连接，准备好您的应用开发。

**部署后，您将拥有：** 生产就绪的Azure基础设施  
**完成系统所需：** 代理代码、前端UI和数据配置（参见[架构指南](../retail-scenario.md)）

## 🎯 部署内容

### 核心基础设施（部署后状态）

✅ **Azure OpenAI服务**（准备好API调用）
  - 主区域：GPT-4o部署（20K TPM容量）
  - 次区域：GPT-4o-mini部署（10K TPM容量）
  - 第三区域：文本嵌入模型（30K TPM容量）
  - 评估区域：GPT-4o评分模型（15K TPM容量）
  - **状态：** 完全功能 - 可立即进行API调用

✅ **Azure AI搜索**（空白 - 准备配置）
  - 启用向量搜索功能
  - 标准层，1个分区，1个副本
  - **状态：** 服务运行，但需要创建索引
  - **需要操作：** 使用您的架构创建搜索索引

✅ **Azure存储账户**（空白 - 准备上传）
  - Blob容器：`documents`，`uploads`
  - 安全配置（仅HTTPS，无公共访问）
  - **状态：** 准备接收文件
  - **需要操作：** 上传您的产品数据和文档

⚠️ **容器应用环境**（部署了占位镜像）
  - 代理路由应用（nginx默认镜像）
  - 前端应用（nginx默认镜像）
  - 自动扩展配置（0-10实例）
  - **状态：** 运行占位容器
  - **需要操作：** 构建并部署您的代理应用

✅ **Azure Cosmos DB**（空白 - 准备数据）
  - 数据库和容器已预配置
  - 优化低延迟操作
  - 启用TTL自动清理
  - **状态：** 准备存储聊天记录

✅ **Azure Key Vault**（可选 - 准备存储机密）
  - 启用软删除
  - 为托管身份配置RBAC
  - **状态：** 准备存储API密钥和连接字符串

✅ **Application Insights**（可选 - 监控已激活）
  - 连接到日志分析工作区
  - 配置了自定义指标和警报
  - **状态：** 准备接收应用的遥测数据

✅ **文档智能**（准备好API调用）
  - S0层用于生产工作负载
  - **状态：** 准备处理上传的文档

✅ **必应搜索API**（准备好API调用）
  - S1层用于实时搜索
  - **状态：** 准备进行网页搜索查询

### 部署模式

| 模式 | OpenAI容量 | 容器实例 | 搜索层 | 存储冗余 | 最适合 |
|------|------------|----------|---------|----------|--------|
| **最小化** | 10K-20K TPM | 0-2副本 | 基础 | LRS（本地） | 开发/测试、学习、概念验证 |
| **标准** | 30K-60K TPM | 2-5副本 | 标准 | ZRS（区域） | 生产、中等流量（<10K用户） |
| **高级** | 80K-150K TPM | 5-10副本，区域冗余 | 高级 | GRS（地理） | 企业、高流量（>10K用户），99.99% SLA |

**成本影响：**
- **最小化 → 标准：** 成本约增加4倍（$100-370/月 → $420-1,450/月）
- **标准 → 高级：** 成本约增加3倍（$420-1,450/月 → $1,150-3,500/月）
- **选择依据：** 预期负载、SLA要求、预算限制

**容量规划：**
- **TPM（每分钟令牌数）：** 所有模型部署的总量
- **容器实例：** 自动扩展范围（最小-最大副本）
- **搜索层：** 影响查询性能和索引大小限制

## 📋 前提条件

### 必需工具
1. **Azure CLI**（版本2.50.0或更高）
   ```bash
   az --version  # 检查版本
   az login      # 认证
   ```

2. **有效的Azure订阅**，具有所有者或贡献者权限
   ```bash
   az account show  # 验证订阅
   ```

### 必需的Azure配额

在部署之前，请验证目标区域是否有足够的配额：

```bash
# 检查 Azure OpenAI 在您所在地区的可用性
az cognitiveservices account list-skus \
  --kind OpenAI \
  --location eastus2

# 验证 OpenAI 配额（以 gpt-4o 为例）
az cognitiveservices usage list \
  --location eastus2 \
  --query "[?name.value=='OpenAI.Standard.gpt-4o']"

# 检查容器应用配额
az provider show \
  --namespace Microsoft.App \
  --query "resourceTypes[?resourceType=='managedEnvironments'].locations"
```

**最低要求配额：**
- **Azure OpenAI：** 跨区域部署3-4个模型
  - GPT-4o：20K TPM（每分钟令牌数）
  - GPT-4o-mini：10K TPM
  - text-embedding-ada-002：30K TPM
  - **注意：** GPT-4o在某些区域可能有候补名单 - 检查[模型可用性](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- **容器应用：** 托管环境 + 2-10个容器实例
- **AI搜索：** 标准层（基础层不足以支持向量搜索）
- **Cosmos DB：** 标准预配置吞吐量

**如果配额不足：**
1. 前往Azure门户 → 配额 → 请求增加
2. 或使用Azure CLI：
   ```bash
   az support tickets create \
     --ticket-name "OpenAI-Quota-Increase" \
     --severity "minimal" \
     --description "Request quota increase for Azure OpenAI GPT-4o in eastus2"
   ```
3. 考虑具有可用性的替代区域

## 🚀 快速部署

### 选项1：使用Azure CLI

```bash
# 克隆或下载模板文件
git clone <repository-url>
cd examples/retail-multiagent-arm-template

# 使部署脚本可执行
chmod +x deploy.sh

# 使用默认设置进行部署
./deploy.sh -g myResourceGroup

# 为生产环境部署高级功能
./deploy.sh -g myProdRG -e prod -m premium -l eastus2
```

### 选项2：使用Azure门户

[![部署到Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2Fazd-for-beginners%2Fmain%2Fexamples%2Fretail-multiagent-arm-template%2Fazuredeploy.json)

### 选项3：直接使用Azure CLI

```bash
# 创建资源组
az group create --name myResourceGroup --location eastus2

# 部署模板
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json
```

## ⏱️ 部署时间表

### 预期情况

| 阶段 | 时长 | 发生了什么 |
|------|------|------------|
| **模板验证** | 30-60秒 | Azure验证ARM模板语法和参数 |
| **资源组设置** | 10-20秒 | 创建资源组（如有需要） |
| **OpenAI配置** | 5-8分钟 | 创建3-4个OpenAI账户并部署模型 |
| **容器应用** | 3-5分钟 | 创建环境并部署占位容器 |
| **搜索与存储** | 2-4分钟 | 配置AI搜索服务和存储账户 |
| **Cosmos DB** | 2-3分钟 | 创建数据库并配置容器 |
| **监控设置** | 2-3分钟 | 设置Application Insights和日志分析 |
| **RBAC配置** | 1-2分钟 | 配置托管身份和权限 |
| **总部署时间** | **15-25分钟** | 完成基础设施准备 |

**部署后：**
- ✅ **基础设施就绪：** 所有Azure服务已配置并运行
- ⏱️ **应用开发：** 80-120小时（您的责任）
- ⏱️ **索引配置：** 15-30分钟（需要您的架构）
- ⏱️ **数据上传：** 根据数据集大小而定
- ⏱️ **测试与验证：** 2-4小时

---

## ✅ 验证部署成功

### 步骤1：检查资源配置（2分钟）

```bash
# 验证所有资源是否成功部署
az resource list \
  --resource-group myResourceGroup \
  --query "[?provisioningState!='Succeeded'].{Name:name, Status:provisioningState, Type:type}" \
  --output table
```

**预期：** 空表（所有资源显示“成功”状态）

### 步骤2：验证Azure OpenAI部署（3分钟）

```bash
# 列出所有OpenAI账户
az cognitiveservices account list \
  --resource-group myResourceGroup \
  --query "[?kind=='OpenAI'].{Name:name, Location:location, Status:properties.provisioningState}" \
  --output table

# 检查主要区域的模型部署
OPENAI_NAME=$(az cognitiveservices account list \
  --resource-group myResourceGroup \
  --query "[?kind=='OpenAI'] | [0].name" -o tsv)

az cognitiveservices account deployment list \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --output table
```

**预期：** 
- 3-4个OpenAI账户（主、次、第三、评估区域）
- 每个账户1-2个模型部署（gpt-4o、gpt-4o-mini、text-embedding-ada-002）

### 步骤3：测试基础设施端点（5分钟）

```bash
# 获取容器应用程序URL
az containerapp list \
  --resource-group myResourceGroup \
  --query "[].{Name:name, URL:properties.configuration.ingress.fqdn, Status:properties.runningStatus}" \
  --output table

# 测试路由器端点（占位符图像将响应）
ROUTER_URL=$(az containerapp show \
  --name retail-router \
  --resource-group myResourceGroup \
  --query "properties.configuration.ingress.fqdn" -o tsv)

echo "Testing: https://$ROUTER_URL"
curl -I https://$ROUTER_URL || echo "Container running (placeholder image - expected)"
```

**预期：** 
- 容器应用显示“运行”状态
- 占位nginx响应HTTP 200或404（尚无应用代码）

### 步骤4：验证Azure OpenAI API访问（3分钟）

```bash
# 获取OpenAI端点和密钥
OPENAI_ENDPOINT=$(az cognitiveservices account show \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --query "properties.endpoint" -o tsv)

OPENAI_KEY=$(az cognitiveservices account keys list \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --query "key1" -o tsv)

# 测试GPT-4o部署
curl "${OPENAI_ENDPOINT}openai/deployments/gpt-4o/chat/completions?api-version=2024-08-01-preview" \
  -H "Content-Type: application/json" \
  -H "api-key: $OPENAI_KEY" \
  -d '{
    "messages": [{"role": "user", "content": "Say hello"}],
    "max_tokens": 10
  }'
```

**预期：** JSON响应包含聊天完成（确认OpenAI功能正常）

### 工作与未工作内容

**✅ 部署后可用：**
- Azure OpenAI模型已部署并接受API调用
- AI搜索服务运行（空白，无索引）
- 容器应用运行（占位nginx镜像）
- 存储账户可访问并准备上传
- Cosmos DB准备进行数据操作
- Application Insights收集基础设施遥测数据
- Key Vault准备存储机密

**❌ 尚未工作（需要开发）：**
- 代理端点（未部署应用代码）
- 聊天功能（需要前后端实现）
- 搜索查询（尚未创建搜索索引）
- 文档处理管道（尚未上传数据）
- 自定义遥测（需要应用仪表化）

**下一步：** 参见[部署后配置](../../../../examples/retail-multiagent-arm-template)以开发和部署您的应用

---

## ⚙️ 配置选项

### 模板参数

| 参数 | 类型 | 默认值 | 描述 |
|------|------|--------|------|
| `projectName` | string | "retail" | 所有资源名称的前缀 |
| `location` | string | 资源组位置 | 主部署区域 |
| `secondaryLocation` | string | "westus2" | 多区域部署的次区域 |
| `tertiaryLocation` | string | "francecentral" | 嵌入模型的区域 |
| `environmentName` | string | "dev" | 环境标识（开发/预生产/生产） |
| `deploymentMode` | string | "standard" | 部署配置（最小化/标准/高级） |
| `enableMultiRegion` | bool | true | 启用多区域部署 |
| `enableMonitoring` | bool | true | 启用Application Insights和日志记录 |
| `enableSecurity` | bool | true | 启用Key Vault和增强安全性 |

### 自定义参数

编辑`azuredeploy.parameters.json`：

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

## 🏗️ 架构概述

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
# 显示帮助
./deploy.sh --help

# 基本部署
./deploy.sh -g myResourceGroup

# 使用自定义设置的高级部署
./deploy.sh \
  -g myProductionRG \
  -p companyname \
  -e prod \
  -m premium \
  -l eastus2

# 无多区域的开发部署
./deploy.sh \
  -g myDevRG \
  -e dev \
  -m minimal \
  --no-multi-region \
  --no-security
```

### 脚本功能

- ✅ **前提条件验证**（Azure CLI、登录状态、模板文件）
- ✅ **资源组管理**（如不存在则创建）
- ✅ **模板验证**在部署前
- ✅ **进度监控**带有彩色输出
- ✅ **部署输出**显示
- ✅ **部署后指导**

## 📊 部署监控

### 检查部署状态

```bash
# 列出部署
az deployment group list --resource-group myResourceGroup --output table

# 获取部署详情
az deployment group show \
  --resource-group myResourceGroup \
  --name retail-deployment-YYYYMMDD-HHMMSS

# 监视部署进度
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --verbose
```

### 部署输出

成功部署后，以下输出可用：

- **前端URL：** Web界面的公共端点
- **路由器URL：** 代理路由的API端点
- **OpenAI端点：** 主和次OpenAI服务端点
- **搜索服务：** Azure AI搜索服务端点
- **存储账户：** 文档存储账户名称
- **Key Vault：** Key Vault名称（如启用）
- **Application Insights：** 监控服务名称（如启用）

## 🔧 部署后：下一步
> **📝 重要提示:** 基础设施已部署，但您需要开发并部署应用程序代码。

### 阶段 1：开发代理应用程序（您的责任）

ARM 模板创建了**空的容器应用**，并使用了占位的 nginx 镜像。您需要完成以下任务：

**需要开发的内容：**
1. **代理实现**（30-40 小时）
   - 集成 GPT-4o 的客户服务代理
   - 集成 GPT-4o-mini 的库存代理
   - 代理路由逻辑

2. **前端开发**（20-30 小时）
   - 聊天界面 UI（React/Vue/Angular）
   - 文件上传功能
   - 响应渲染和格式化

3. **后端服务**（12-16 小时）
   - FastAPI 或 Express 路由器
   - 身份验证中间件
   - 遥测集成

**参考:** [架构指南](../retail-scenario.md) 了解详细的实现模式和代码示例

### 阶段 2：配置 AI 搜索索引（15-30 分钟）

创建与您的数据模型匹配的搜索索引：

```bash
# 获取搜索服务详情
SEARCH_NAME=$(az search service list \
  --resource-group myResourceGroup \
  --query "[0].name" -o tsv)

SEARCH_KEY=$(az search admin-key show \
  --service-name $SEARCH_NAME \
  --resource-group myResourceGroup \
  --query "primaryKey" -o tsv)

# 使用您的模式创建索引（示例）
curl -X POST "https://${SEARCH_NAME}.search.windows.net/indexes?api-version=2023-11-01" \
  -H "Content-Type: application/json" \
  -H "api-key: ${SEARCH_KEY}" \
  -d '{
    "name": "products",
    "fields": [
      {"name": "id", "type": "Edm.String", "key": true},
      {"name": "title", "type": "Edm.String", "searchable": true},
      {"name": "content", "type": "Edm.String", "searchable": true},
      {"name": "category", "type": "Edm.String", "filterable": true},
      {"name": "content_vector", "type": "Collection(Edm.Single)", 
       "searchable": true, "dimensions": 1536, "vectorSearchProfile": "default"}
    ],
    "vectorSearch": {
      "algorithms": [{"name": "default", "kind": "hnsw"}],
      "profiles": [{"name": "default", "algorithm": "default"}]
    }
  }'
```

**资源:**
- [AI 搜索索引架构设计](https://learn.microsoft.com/azure/search/search-what-is-an-index)
- [向量搜索配置](https://learn.microsoft.com/azure/search/vector-search-how-to-create-index)

### 阶段 3：上传您的数据（时间因情况而异）

一旦您拥有产品数据和文档：

```bash
# 获取存储账户详情
STORAGE_NAME=$(az storage account list \
  --resource-group myResourceGroup \
  --query "[0].name" -o tsv)

STORAGE_KEY=$(az storage account keys list \
  --account-name $STORAGE_NAME \
  --resource-group myResourceGroup \
  --query "[0].value" -o tsv)

# 上传您的文档
az storage blob upload-batch \
  --destination documents \
  --source /path/to/your/product/docs \
  --account-name $STORAGE_NAME \
  --account-key $STORAGE_KEY

# 示例：上传单个文件
az storage blob upload \
  --container-name documents \
  --name "product-manual.pdf" \
  --file /path/to/product-manual.pdf \
  --account-name $STORAGE_NAME \
  --account-key $STORAGE_KEY
```

### 阶段 4：构建并部署您的应用程序（8-12 小时）

完成代理代码开发后：

```bash
# 1. 创建 Azure 容器注册表（如果需要）
az acr create \
  --name myregistry \
  --resource-group myResourceGroup \
  --sku Basic

# 2. 构建并推送代理路由器镜像
docker build -t myregistry.azurecr.io/agent-router:v1 /path/to/your/router/code
az acr login --name myregistry
docker push myregistry.azurecr.io/agent-router:v1

# 3. 构建并推送前端镜像
docker build -t myregistry.azurecr.io/frontend:v1 /path/to/your/frontend/code
docker push myregistry.azurecr.io/frontend:v1

# 4. 使用您的镜像更新容器应用
az containerapp update \
  --name retail-router \
  --resource-group myResourceGroup \
  --image myregistry.azurecr.io/agent-router:v1

az containerapp update \
  --name retail-frontend \
  --resource-group myResourceGroup \
  --image myregistry.azurecr.io/frontend:v1

# 5. 配置环境变量
az containerapp update \
  --name retail-router \
  --resource-group myResourceGroup \
  --set-env-vars \
    OPENAI_ENDPOINT=secretref:openai-endpoint \
    OPENAI_KEY=secretref:openai-key \
    SEARCH_ENDPOINT=secretref:search-endpoint \
    SEARCH_KEY=secretref:search-key
```

### 阶段 5：测试您的应用程序（2-4 小时）

```bash
# 获取您的应用程序 URL
ROUTER_URL=$(az containerapp show \
  --name retail-router \
  --resource-group myResourceGroup \
  --query "properties.configuration.ingress.fqdn" -o tsv)

# 测试代理端点（代码部署后）
curl -X POST "https://${ROUTER_URL}/chat" \
  -H "Content-Type: application/json" \
  -d '{
    "message": "Hello, I need help with my order",
    "agent": "customer"
  }'

# 检查应用程序日志
az containerapp logs show \
  --name retail-router \
  --resource-group myResourceGroup \
  --follow
```

### 实现资源

**架构与设计:**
- 📖 [完整架构指南](../retail-scenario.md) - 详细的实现模式
- 📖 [多代理设计模式](https://learn.microsoft.com/azure/architecture/ai-ml/guide/multi-agent-systems)

**代码示例:**
- 🔗 [Azure OpenAI 聊天示例](https://github.com/Azure-Samples/azure-search-openai-demo) - RAG 模式
- 🔗 [Semantic Kernel](https://github.com/microsoft/semantic-kernel) - 代理框架 (C#)
- 🔗 [LangChain Azure](https://github.com/langchain-ai/langchain) - 代理编排 (Python)
- 🔗 [AutoGen](https://github.com/microsoft/autogen) - 多代理对话

**预计总工作量:**
- 基础设施部署：15-25 分钟（✅ 已完成）
- 应用程序开发：80-120 小时（🔨 您的工作）
- 测试与优化：15-25 小时（🔨 您的工作）

## 🛠️ 故障排除

### 常见问题

#### 1. Azure OpenAI 配额超限

```bash
# 检查当前配额使用情况
az cognitiveservices usage list --location eastus2

# 请求增加配额
az support tickets create \
  --ticket-name "OpenAI-Quota-Increase" \
  --severity "minimal" \
  --description "Request quota increase for Azure OpenAI in region X"
```

#### 2. 容器应用部署失败

```bash
# 检查容器应用日志
az containerapp logs show \
  --name retail-router \
  --resource-group myResourceGroup \
  --follow

# 重启容器应用
az containerapp revision restart \
  --name retail-router \
  --resource-group myResourceGroup
```

#### 3. 搜索服务初始化

```bash
# 验证搜索服务状态
az search service show \
  --name <search-service-name> \
  --resource-group myResourceGroup

# 测试搜索服务连接
curl -X GET "https://<search-service-name>.search.windows.net/indexes?api-version=2023-11-01" \
  -H "api-key: <search-admin-key>"
```

### 部署验证

```bash
# 验证所有资源已创建
az resource list \
  --resource-group myResourceGroup \
  --output table

# 检查资源健康状况
az resource list \
  --resource-group myResourceGroup \
  --query "[?provisioningState!='Succeeded'].{Name:name, Status:provisioningState, Type:type}" \
  --output table
```

## 🔐 安全注意事项

### 密钥管理
- 所有密钥存储在 Azure Key Vault（启用时）
- 容器应用使用托管身份进行身份验证
- 存储账户启用了安全默认设置（仅 HTTPS，无公共 Blob 访问）

### 网络安全
- 容器应用尽可能使用内部网络
- 搜索服务配置为私有端点选项
- Cosmos DB 配置为最低必要权限

### RBAC 配置
```bash
# 为托管身份分配必要的角色
az role assignment create \
  --assignee <container-app-managed-identity> \
  --role "Cognitive Services OpenAI User" \
  --scope <openai-resource-id>
```

## 💰 成本优化

### 成本估算（每月，美元）

| 模式 | OpenAI | 容器应用 | 搜索 | 存储 | 总计估算 |
|------|--------|----------|------|-------|----------|
| 最低 | $50-200 | $20-50 | $25-100 | $5-20 | $100-370 |
| 标准 | $200-800 | $100-300 | $100-300 | $20-50 | $420-1450 |
| 高级 | $500-2000 | $300-800 | $300-600 | $50-100 | $1150-3500 |

### 成本监控

```bash
# 设置预算提醒
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
- 对 ARM 模板文件进行版本控制
- 在开发环境中先测试更改
- 使用增量部署模式进行更新

### 资源更新
```bash
# 使用新参数更新
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --mode Incremental
```

### 备份与恢复
- Cosmos DB 启用了自动备份
- Key Vault 启用了软删除
- 容器应用保留了修订版本以便回滚

## 📞 支持

- **模板问题**: [GitHub Issues](https://github.com/microsoft/azd-for-beginners/issues)
- **Azure 支持**: [Azure 支持门户](https://portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade)
- **社区**: [Azure AI Discord](https://discord.gg/microsoft-azure)

---

**⚡ 准备好部署您的多代理解决方案了吗？**

开始: `./deploy.sh -g myResourceGroup`

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免责声明**：  
本文档使用AI翻译服务[Co-op Translator](https://github.com/Azure/co-op-translator)进行翻译。尽管我们努力确保翻译的准确性，但请注意，自动翻译可能包含错误或不准确之处。原始语言的文档应被视为权威来源。对于重要信息，建议使用专业人工翻译。我们对因使用此翻译而产生的任何误解或误读不承担责任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->