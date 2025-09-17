<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "eb84941706983946ae03bfa0433c0bb6",
  "translation_date": "2025-09-17T13:38:24+00:00",
  "source_file": "examples/retail-multiagent-arm-template/README.md",
  "language_code": "tw"
}
-->
# 零售多代理解決方案 - ARM 模板部署

**第 5 章：生產部署包**
- **📚 課程首頁**: [AZD 初學者指南](../../README.md)
- **📖 相關章節**: [第 5 章：多代理 AI 解決方案](../../README.md#-chapter-5-multi-agent-ai-solutions-advanced)
- **📝 情境指南**: [完整實施](../retail-scenario.md)
- **🎯 快速部署**: [一鍵部署](../../../../examples/retail-multiagent-arm-template)

此目錄包含完整的 Azure Resource Manager (ARM) 模板，用於部署零售多代理客戶支持解決方案，提供整個架構的基礎設施即代碼。

## 🎯 部署內容

### 核心基礎設施
- **Azure OpenAI Services** (多區域以確保高可用性)
  - 主區域：GPT-4o 用於客戶代理
  - 次區域：GPT-4o-mini 用於庫存代理  
  - 第三區域：文本嵌入模型
  - 評估區域：GPT-4o 評分模型
- **Azure AI Search** 具備向量搜索功能
- **Azure Storage Account** 包含文件和上傳的 blob 容器
- **Azure Container Apps Environment** 支援自動擴展
- **Container Apps** 用於代理路由器和前端
- **Azure Cosmos DB** 用於聊天記錄存儲
- **Azure Key Vault** 用於密鑰管理 (可選)
- **Application Insights** 和 Log Analytics 用於監控 (可選)
- **Document Intelligence** 用於文件處理
- **Bing Search API** 用於即時信息

### 部署模式

| 模式 | 描述 | 使用場景 | 資源 |
|------|-------------|----------|-----------|
| **Minimal** | 成本優化的基本部署 | 開發、測試 | 基本 SKUs，單一區域，降低容量 |
| **Standard** | 平衡的部署，適合生產工作負載 | 生產、中等規模 | 標準 SKUs，多區域，標準容量 |
| **Premium** | 高性能、企業級部署 | 企業、高規模 | 高級 SKUs，多區域，高容量 |

## 📋 先決條件

1. **已安裝並配置 Azure CLI**
2. **有效的 Azure 訂閱**，具有足夠的配額
3. **適當的權限**，以便在目標訂閱中創建資源
4. **資源配額**:
   - Azure OpenAI (檢查區域可用性)
   - Container Apps (因區域而異)
   - AI Search (建議使用標準層或更高)

## 🚀 快速部署

### 選項 1：使用 Azure CLI

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

### 選項 2：使用 Azure Portal

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2Fazd-for-beginners%2Fmain%2Fexamples%2Fretail-multiagent-arm-template%2Fazuredeploy.json)

### 選項 3：直接使用 Azure CLI

```bash
# Create resource group
az group create --name myResourceGroup --location eastus2

# Deploy template
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json
```

## ⚙️ 配置選項

### 模板參數

| 參數 | 類型 | 預設值 | 描述 |
|-----------|------|---------|-------------|
| `projectName` | string | "retail" | 所有資源名稱的前綴 |
| `location` | string | 資源組位置 | 主要部署區域 |
| `secondaryLocation` | string | "westus2" | 用於多區域部署的次區域 |
| `tertiaryLocation` | string | "francecentral" | 嵌入模型的區域 |
| `environmentName` | string | "dev" | 環境標示 (dev/staging/prod) |
| `deploymentMode` | string | "standard" | 部署配置 (minimal/standard/premium) |
| `enableMultiRegion` | bool | true | 啟用多區域部署 |
| `enableMonitoring` | bool | true | 啟用 Application Insights 和日誌記錄 |
| `enableSecurity` | bool | true | 啟用 Key Vault 和增強安全性 |

### 自訂參數

編輯 `azuredeploy.parameters.json`:

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

## 🏗️ 架構概述

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

## 📖 部署腳本使用

`deploy.sh` 腳本提供互動式部署體驗：

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

### 腳本功能

- ✅ **先決條件驗證** (Azure CLI、登錄狀態、模板文件)
- ✅ **資源組管理** (如果不存在則創建)
- ✅ **模板驗證** 在部署之前
- ✅ **進度監控** 具有彩色輸出
- ✅ **部署輸出** 顯示
- ✅ **部署後指導**

## 📊 部署監控

### 檢查部署狀態

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

### 部署輸出

成功部署後，可用的輸出包括：

- **前端 URL**: 網頁界面的公共端點
- **路由器 URL**: 代理路由器的 API 端點
- **OpenAI 端點**: 主要和次要 OpenAI 服務端點
- **搜索服務**: Azure AI Search 服務端點
- **存儲帳戶**: 文件存儲的帳戶名稱
- **Key Vault**: Key Vault 的名稱 (如果啟用)
- **Application Insights**: 監控服務的名稱 (如果啟用)

## 🔧 部署後配置

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

### 2. 上傳初始數據

```bash
# Upload documents to storage
az storage blob upload-batch \
  --destination documents \
  --source ../data/initial-docs \
  --account-name <storage-account-name>
```

### 3. 測試代理端點

```bash
# Test router endpoint
curl -X POST "<router-url>/chat" \
  -H "Content-Type: application/json" \
  -d '{
    "message": "Hello, I need help with my order",
    "agent": "customer"
  }'
```

### 4. 配置容器應用

ARM 模板部署佔位容器映像。要部署實際代理代碼：

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

## 🛠️ 疑難排解

### 常見問題

#### 1. Azure OpenAI 配額超出

```bash
# Check current quota usage
az cognitiveservices usage list --location eastus2

# Request quota increase
az support tickets create \
  --ticket-name "OpenAI-Quota-Increase" \
  --severity "minimal" \
  --description "Request quota increase for Azure OpenAI in region X"
```

#### 2. 容器應用部署失敗

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

#### 3. 搜索服務初始化

```bash
# Verify search service status
az search service show \
  --name <search-service-name> \
  --resource-group myResourceGroup

# Test search service connectivity
curl -X GET "https://<search-service-name>.search.windows.net/indexes?api-version=2023-11-01" \
  -H "api-key: <search-admin-key>"
```

### 部署驗證

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

## 🔐 安全考量

### 密鑰管理
- 所有密鑰存儲在 Azure Key Vault (如果啟用)
- 容器應用使用托管身份進行身份驗證
- 存儲帳戶設置安全默認值 (僅 HTTPS，無公共 blob 訪問)

### 網絡安全
- 容器應用盡可能使用內部網絡
- 搜索服務配置為私有端點選項
- Cosmos DB 配置為最低必要權限

### RBAC 配置
```bash
# Assign necessary roles for managed identity
az role assignment create \
  --assignee <container-app-managed-identity> \
  --role "Cognitive Services OpenAI User" \
  --scope <openai-resource-id>
```

## 💰 成本優化

### 成本估算 (每月，美元)

| 模式 | OpenAI | 容器應用 | 搜索 | 存儲 | 總估算 |
|------|--------|----------------|--------|---------|------------|
| Minimal | $50-200 | $20-50 | $25-100 | $5-20 | $100-370 |
| Standard | $200-800 | $100-300 | $100-300 | $20-50 | $420-1450 |
| Premium | $500-2000 | $300-800 | $300-600 | $50-100 | $1150-3500 |

### 成本監控

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

## 🔄 更新與維護

### 模板更新
- 將 ARM 模板文件進行版本控制
- 先在開發環境中測試更改
- 使用增量部署模式進行更新

### 資源更新
```bash
# Update with new parameters
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --mode Incremental
```

### 備份與恢復
- Cosmos DB 啟用自動備份
- Key Vault 啟用軟刪除
- 容器應用保留修訂以便回滾

## 📞 支援

- **模板問題**: [GitHub Issues](https://github.com/microsoft/azd-for-beginners/issues)
- **Azure 支援**: [Azure 支援入口](https://portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade)
- **社群**: [Azure AI Discord](https://discord.gg/microsoft-azure)

---

**⚡ 準備好部署您的多代理解決方案了嗎？**

開始使用: `./deploy.sh -g myResourceGroup`

---

**免責聲明**：  
本文件使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。儘管我們努力確保翻譯的準確性，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於關鍵資訊，建議使用專業人工翻譯。我們對因使用此翻譯而引起的任何誤解或誤釋不承擔責任。