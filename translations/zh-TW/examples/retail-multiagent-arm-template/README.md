# 零售多代理解決方案 - 基礎架構範本

**第 5 章：生產部署套件**
- **📚 課程首頁**：[AZD 初學者指南](../../README.md)
- **📖 相關章節**：[第 5 章：多代理 AI 解決方案](../../README.md#-chapter-5-multi-agent-ai-solutions-advanced)
- **📝 情境指南**：[完整架構](../retail-scenario.md)
- **🎯 快速部署**：[一鍵部署](../../../../examples/retail-multiagent-arm-template)

> **⚠️ 僅限基礎架構範本**  
> 此 ARM 範本部署 **Azure 資源** 用於多代理系統。  
>  
> **部署內容 (15-25 分鐘)：**
> - ✅ Azure OpenAI (GPT-4o, GPT-4o-mini，跨 3 個區域的嵌入模型)
> - ✅ AI 搜索服務 (空白，準備建立索引)
> - ✅ 容器應用 (預設映像，準備加入您的程式碼)
> - ✅ 儲存體、Cosmos DB、Key Vault、Application Insights
>  
> **未包含內容 (需自行開發)：**
> - ❌ 代理實作程式碼 (客戶代理、庫存代理)
> - ❌ 路由邏輯與 API 端點
> - ❌ 前端聊天介面
> - ❌ 搜索索引結構與資料管道
> - ❌ **預估開發時間：80-120 小時**
>  
> **適用於：**
> - ✅ 想為多代理專案配置 Azure 基礎架構
> - ✅ 計劃自行開發代理實作
> - ✅ 需要生產就緒的基礎架構基線
>  
> **不適用於：**
> - ❌ 期望立即有可運行的多代理示範
> - ❌ 尋找完整的應用程式程式碼範例

## 概述

此目錄包含一個完整的 Azure Resource Manager (ARM) 範本，用於部署多代理客戶支援系統的 **基礎架構基礎**。該範本會配置所有必要的 Azure 服務，並進行適當的設定與互連，準備好供您進行應用程式開發。

**部署後，您將擁有：** 生產就緒的 Azure 基礎架構  
**完成系統所需：** 代理程式碼、前端 UI 和資料配置 (請參閱 [架構指南](../retail-scenario.md))

## 🎯 部署內容

### 核心基礎架構 (部署後狀態)

✅ **Azure OpenAI 服務** (可立即進行 API 呼叫)
  - 主要區域：GPT-4o 部署 (20K TPM 容量)
  - 次要區域：GPT-4o-mini 部署 (10K TPM 容量)
  - 第三區域：文字嵌入模型 (30K TPM 容量)
  - 評估區域：GPT-4o 評分模型 (15K TPM 容量)
  - **狀態：** 完全運行 - 可立即進行 API 呼叫

✅ **Azure AI 搜索** (空白 - 準備配置)
  - 啟用向量搜索功能
  - 標準層級，1 個分區，1 個副本
  - **狀態：** 服務運行中，但需要建立索引
  - **需要操作：** 使用您的結構建立搜索索引

✅ **Azure 儲存體帳戶** (空白 - 準備上傳)
  - Blob 容器：`documents`、`uploads`
  - 安全配置 (僅限 HTTPS，無公開存取)
  - **狀態：** 準備接收檔案
  - **需要操作：** 上傳您的產品資料與文件

⚠️ **容器應用環境** (部署預設映像)
  - 代理路由應用 (nginx 預設映像)
  - 前端應用 (nginx 預設映像)
  - 自動調整配置 (0-10 個實例)
  - **狀態：** 運行預設容器
  - **需要操作：** 建置並部署您的代理應用程式

✅ **Azure Cosmos DB** (空白 - 準備存儲資料)
  - 預先配置的資料庫與容器
  - 優化低延遲操作
  - 啟用 TTL 自動清理
  - **狀態：** 準備存儲聊天記錄

✅ **Azure Key Vault** (選用 - 準備存儲機密)
  - 啟用軟刪除
  - 為受管理的身分識別配置 RBAC
  - **狀態：** 準備存儲 API 金鑰與連接字串

✅ **Application Insights** (選用 - 監控啟用)
  - 已連接到 Log Analytics 工作區
  - 配置自訂指標與警報
  - **狀態：** 準備接收應用程式的遙測數據

✅ **文件智能** (可進行 API 呼叫)
  - S0 層級，適用於生產工作負載
  - **狀態：** 準備處理上傳的文件

✅ **Bing 搜索 API** (可進行 API 呼叫)
  - S1 層級，適用於即時搜索
  - **狀態：** 準備進行網頁搜索查詢

### 部署模式

| 模式 | OpenAI 容量 | 容器實例 | 搜索層級 | 儲存體冗餘 | 適用場景 |
|------|-------------|----------|----------|------------|----------|
| **Minimal** | 10K-20K TPM | 0-2 副本 | 基本 | LRS (本地) | 開發/測試、學習、概念驗證 |
| **Standard** | 30K-60K TPM | 2-5 副本 | 標準 | ZRS (區域) | 生產、中等流量 (<10K 用戶) |
| **Premium** | 80K-150K TPM | 5-10 副本，區域冗餘 | 高級 | GRS (地理) | 企業、高流量 (>10K 用戶)、99.99% SLA |

**成本影響：**
- **Minimal → Standard：** 成本約增加 4 倍 ($100-370/月 → $420-1,450/月)
- **Standard → Premium：** 成本約增加 3 倍 ($420-1,450/月 → $1,150-3,500/月)
- **選擇依據：** 預期負載、SLA 要求、預算限制

**容量規劃：**
- **TPM (每分鐘處理的 Token 數)：** 所有模型部署的總和
- **容器實例：** 自動調整範圍 (最小-最大副本數)
- **搜索層級：** 影響查詢效能與索引大小限制

## 📋 先決條件

### 必需工具
1. **Azure CLI** (版本 2.50.0 或更高)
   ```bash
   az --version  # 檢查版本
   az login      # 驗證身份
   ```

2. **有效的 Azure 訂閱**，具有擁有者或貢獻者權限
   ```bash
   az account show  # 驗證訂閱
   ```

### 必需的 Azure 配額

在部署前，請確認目標區域的配額是否足夠：

```bash
# 檢查 Azure OpenAI 在您所在區域的可用性
az cognitiveservices account list-skus \
  --kind OpenAI \
  --location eastus2

# 驗證 OpenAI 配額（以 gpt-4o 為例）
az cognitiveservices usage list \
  --location eastus2 \
  --query "[?name.value=='OpenAI.Standard.gpt-4o']"

# 檢查容器應用程式配額
az provider show \
  --namespace Microsoft.App \
  --query "resourceTypes[?resourceType=='managedEnvironments'].locations"
```

**最低所需配額：**
- **Azure OpenAI：** 3-4 個模型部署，跨多個區域
  - GPT-4o：20K TPM (每分鐘處理的 Token 數)
  - GPT-4o-mini：10K TPM
  - text-embedding-ada-002：30K TPM
  - **注意：** GPT-4o 在某些區域可能需要候補名單 - 請檢查 [模型可用性](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- **容器應用：** 管理環境 + 2-10 個容器實例
- **AI 搜索：** 標準層級 (基本層級不支援向量搜索)
- **Cosmos DB：** 標準預配置吞吐量

**如果配額不足：**
1. 前往 Azure Portal → 配額 → 請求增加
2. 或使用 Azure CLI：
   ```bash
   az support tickets create \
     --ticket-name "OpenAI-Quota-Increase" \
     --severity "minimal" \
     --description "Request quota increase for Azure OpenAI GPT-4o in eastus2"
   ```
3. 考慮具有可用性的其他區域

## 🚀 快速部署

### 選項 1：使用 Azure CLI

```bash
# 複製或下載模板檔案
git clone <repository-url>
cd examples/retail-multiagent-arm-template

# 使部署腳本可執行
chmod +x deploy.sh

# 使用預設設定進行部署
./deploy.sh -g myResourceGroup

# 為生產環境部署高級功能
./deploy.sh -g myProdRG -e prod -m premium -l eastus2
```

### 選項 2：使用 Azure Portal

[![部署到 Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2Fazd-for-beginners%2Fmain%2Fexamples%2Fretail-multiagent-arm-template%2Fazuredeploy.json)

### 選項 3：直接使用 Azure CLI

```bash
# 建立資源群組
az group create --name myResourceGroup --location eastus2

# 部署模板
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json
```

## ⏱️ 部署時間表

### 預期內容

| 階段 | 時間 | 發生的事情 |
|------|------|------------|
| **範本驗證** | 30-60 秒 | Azure 驗證 ARM 範本語法與參數 |
| **資源群組設置** | 10-20 秒 | 建立資源群組 (如有需要) |
| **OpenAI 配置** | 5-8 分鐘 | 建立 3-4 個 OpenAI 帳戶並部署模型 |
| **容器應用** | 3-5 分鐘 | 建立環境並部署預設容器 |
| **搜索與儲存** | 2-4 分鐘 | 配置 AI 搜索服務與儲存帳戶 |
| **Cosmos DB** | 2-3 分鐘 | 建立資料庫並配置容器 |
| **監控設置** | 2-3 分鐘 | 設置 Application Insights 與 Log Analytics |
| **RBAC 配置** | 1-2 分鐘 | 配置受管理的身分識別與權限 |
| **總部署時間** | **15-25 分鐘** | 完整基礎架構就緒 |

**部署後：**
- ✅ **基礎架構就緒：** 所有 Azure 服務已配置並運行
- ⏱️ **應用程式開發：** 80-120 小時 (您的責任)
- ⏱️ **索引配置：** 15-30 分鐘 (需要您的結構)
- ⏱️ **資料上傳：** 視數據集大小而定
- ⏱️ **測試與驗證：** 2-4 小時

---

## ✅ 驗證部署成功

### 步驟 1：檢查資源配置 (2 分鐘)

```bash
# 驗證所有資源是否成功部署
az resource list \
  --resource-group myResourceGroup \
  --query "[?provisioningState!='Succeeded'].{Name:name, Status:provisioningState, Type:type}" \
  --output table
```

**預期結果：** 空表格 (所有資源顯示 "Succeeded" 狀態)

### 步驟 2：驗證 Azure OpenAI 部署 (3 分鐘)

```bash
# 列出所有 OpenAI 帳戶
az cognitiveservices account list \
  --resource-group myResourceGroup \
  --query "[?kind=='OpenAI'].{Name:name, Location:location, Status:properties.provisioningState}" \
  --output table

# 檢查主要地區的模型部署
OPENAI_NAME=$(az cognitiveservices account list \
  --resource-group myResourceGroup \
  --query "[?kind=='OpenAI'] | [0].name" -o tsv)

az cognitiveservices account deployment list \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --output table
```

**預期結果：** 
- 3-4 個 OpenAI 帳戶 (主要、次要、第三、評估區域)
- 每個帳戶 1-2 個模型部署 (gpt-4o, gpt-4o-mini, text-embedding-ada-002)

### 步驟 3：測試基礎架構端點 (5 分鐘)

```bash
# 取得容器應用程式的 URL
az containerapp list \
  --resource-group myResourceGroup \
  --query "[].{Name:name, URL:properties.configuration.ingress.fqdn, Status:properties.runningStatus}" \
  --output table

# 測試路由端點（佔位圖像將回應）
ROUTER_URL=$(az containerapp show \
  --name retail-router \
  --resource-group myResourceGroup \
  --query "properties.configuration.ingress.fqdn" -o tsv)

echo "Testing: https://$ROUTER_URL"
curl -I https://$ROUTER_URL || echo "Container running (placeholder image - expected)"
```

**預期結果：** 
- 容器應用顯示 "Running" 狀態
- 預設 nginx 回應 HTTP 200 或 404 (尚無應用程式程式碼)

### 步驟 4：驗證 Azure OpenAI API 存取 (3 分鐘)

```bash
# 獲取 OpenAI 端點和密鑰
OPENAI_ENDPOINT=$(az cognitiveservices account show \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --query "properties.endpoint" -o tsv)

OPENAI_KEY=$(az cognitiveservices account keys list \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --query "key1" -o tsv)

# 測試 GPT-4o 部署
curl "${OPENAI_ENDPOINT}openai/deployments/gpt-4o/chat/completions?api-version=2024-08-01-preview" \
  -H "Content-Type: application/json" \
  -H "api-key: $OPENAI_KEY" \
  -d '{
    "messages": [{"role": "user", "content": "Say hello"}],
    "max_tokens": 10
  }'
```

**預期結果：** JSON 回應包含聊天完成 (確認 OpenAI 功能正常)

### 運行與未運行的部分

**✅ 部署後運行：**
- Azure OpenAI 模型已部署並接受 API 呼叫
- AI 搜索服務運行中 (空白，尚無索引)
- 容器應用運行中 (預設 nginx 映像)
- 儲存帳戶可存取並準備上傳
- Cosmos DB 準備進行資料操作
- Application Insights 收集基礎架構遙測數據
- Key Vault 準備存儲機密

**❌ 尚未運行 (需要開發)：**
- 代理端點 (尚未部署應用程式程式碼)
- 聊天功能 (需要前端 + 後端實作)
- 搜索查詢 (尚未建立搜索索引)
- 文件處理管道 (尚未上傳資料)
- 自訂遙測 (需要應用程式儀表化)

**下一步：** 請參閱 [部署後配置](../../../../examples/retail-multiagent-arm-template) 以開發並部署您的應用程式

---

## ⚙️ 配置選項

### 範本參數

| 參數 | 類型 | 預設值 | 描述 |
|------|------|--------|------|
| `projectName` | string | "retail" | 所有資源名稱的前綴 |
| `location` | string | 資源群組位置 | 主要部署區域 |
| `secondaryLocation` | string | "westus2" | 多區域部署的次要區域 |
| `tertiaryLocation` | string | "francecentral" | 嵌入模型的區域 |
| `environmentName` | string | "dev" | 環境標示 (dev/staging/prod) |
| `deploymentMode` | string | "standard" | 部署配置 (minimal/standard/premium) |
| `enableMultiRegion` | bool | true | 啟用多區域部署 |
| `enableMonitoring` | bool | true | 啟用 Application Insights 與日誌記錄 |
| `enableSecurity` | bool | true | 啟用 Key Vault 與增強安全性 |

### 自訂參數

編輯 `azuredeploy.parameters.json`：

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

## 📖 部署腳本使用方式

`deploy.sh` 腳本提供互動式部署體驗：

```bash
# 顯示幫助
./deploy.sh --help

# 基本部署
./deploy.sh -g myResourceGroup

# 使用自訂設定的進階部署
./deploy.sh \
  -g myProductionRG \
  -p companyname \
  -e prod \
  -m premium \
  -l eastus2

# 無多區域的開發部署
./deploy.sh \
  -g myDevRG \
  -e dev \
  -m minimal \
  --no-multi-region \
  --no-security
```

### 腳本功能

- ✅ **先決條件驗證** (Azure CLI、登入狀態、範本檔案)
- ✅ **資源群組管理** (如不存在則建立)
- ✅ **部署前範本驗證**
- ✅ **進度監控**，帶有彩色輸出
- ✅ **部署輸出** 顯示
- ✅ **部署後指引**

## 📊 部署監控

### 檢查部署狀態

```bash
# 列出部署
az deployment group list --resource-group myResourceGroup --output table

# 獲取部署詳細資訊
az deployment group show \
  --resource-group myResourceGroup \
  --name retail-deployment-YYYYMMDD-HHMMSS

# 監看部署進度
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --verbose
```

### 部署輸出

成功部署後，以下輸出可用：

- **前端 URL**：網頁介面的公開端點
- **路由器 URL**：代理路由的 API 端點
- **OpenAI 端點**：主要與次要 OpenAI 服務端點
- **搜索服務**：Azure AI 搜索服務端點
- **儲存帳戶**：文件儲存的帳戶名稱
- **Key Vault**：Key Vault 的名稱 (如啟用)
- **Application Insights**：監控服務的名稱 (如啟用)

## 🔧 部署後：下一步
> **📝 重要事項：** 基礎架構已部署，但您需要開發並部署應用程式代碼。

### 第1階段：開發代理應用程式（您的責任）

ARM 模板會建立**空的容器應用程式**，並使用佔位的 nginx 映像。您需要：

**必須開發：**
1. **代理實作**（30-40 小時）
   - 客戶服務代理，整合 GPT-4o
   - 庫存代理，整合 GPT-4o-mini
   - 代理路由邏輯

2. **前端開發**（20-30 小時）
   - 聊天介面 UI（React/Vue/Angular）
   - 檔案上傳功能
   - 回應呈現及格式化

3. **後端服務**（12-16 小時）
   - FastAPI 或 Express 路由器
   - 驗證中介軟體
   - 遙測整合

**參考：** [架構指南](../retail-scenario.md) 了解詳細的實作模式及代碼範例

### 第2階段：配置 AI 搜索索引（15-30 分鐘）

建立與您的資料模型相符的搜索索引：

```bash
# 獲取搜尋服務詳細資訊
SEARCH_NAME=$(az search service list \
  --resource-group myResourceGroup \
  --query "[0].name" -o tsv)

SEARCH_KEY=$(az search admin-key show \
  --service-name $SEARCH_NAME \
  --resource-group myResourceGroup \
  --query "primaryKey" -o tsv)

# 使用您的結構建立索引（範例）
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

**資源：**
- [AI 搜索索引架構設計](https://learn.microsoft.com/azure/search/search-what-is-an-index)
- [向量搜索配置](https://learn.microsoft.com/azure/search/vector-search-how-to-create-index)

### 第3階段：上傳您的資料（時間因情況而異）

當您擁有產品資料及文件時：

```bash
# 獲取儲存帳戶詳細資訊
STORAGE_NAME=$(az storage account list \
  --resource-group myResourceGroup \
  --query "[0].name" -o tsv)

STORAGE_KEY=$(az storage account keys list \
  --account-name $STORAGE_NAME \
  --resource-group myResourceGroup \
  --query "[0].value" -o tsv)

# 上傳您的文件
az storage blob upload-batch \
  --destination documents \
  --source /path/to/your/product/docs \
  --account-name $STORAGE_NAME \
  --account-key $STORAGE_KEY

# 範例：上傳單一檔案
az storage blob upload \
  --container-name documents \
  --name "product-manual.pdf" \
  --file /path/to/product-manual.pdf \
  --account-name $STORAGE_NAME \
  --account-key $STORAGE_KEY
```

### 第4階段：建置並部署您的應用程式（8-12 小時）

當您完成代理代碼開發後：

```bash
# 1. 建立 Azure 容器註冊表（如果需要）
az acr create \
  --name myregistry \
  --resource-group myResourceGroup \
  --sku Basic

# 2. 建立並推送代理路由器映像
docker build -t myregistry.azurecr.io/agent-router:v1 /path/to/your/router/code
az acr login --name myregistry
docker push myregistry.azurecr.io/agent-router:v1

# 3. 建立並推送前端映像
docker build -t myregistry.azurecr.io/frontend:v1 /path/to/your/frontend/code
docker push myregistry.azurecr.io/frontend:v1

# 4. 使用您的映像更新容器應用程式
az containerapp update \
  --name retail-router \
  --resource-group myResourceGroup \
  --image myregistry.azurecr.io/agent-router:v1

az containerapp update \
  --name retail-frontend \
  --resource-group myResourceGroup \
  --image myregistry.azurecr.io/frontend:v1

# 5. 配置環境變數
az containerapp update \
  --name retail-router \
  --resource-group myResourceGroup \
  --set-env-vars \
    OPENAI_ENDPOINT=secretref:openai-endpoint \
    OPENAI_KEY=secretref:openai-key \
    SEARCH_ENDPOINT=secretref:search-endpoint \
    SEARCH_KEY=secretref:search-key
```

### 第5階段：測試您的應用程式（2-4 小時）

```bash
# 取得您的應用程式 URL
ROUTER_URL=$(az containerapp show \
  --name retail-router \
  --resource-group myResourceGroup \
  --query "properties.configuration.ingress.fqdn" -o tsv)

# 測試代理端點（當您的程式碼部署後）
curl -X POST "https://${ROUTER_URL}/chat" \
  -H "Content-Type: application/json" \
  -d '{
    "message": "Hello, I need help with my order",
    "agent": "customer"
  }'

# 檢查應用程式日誌
az containerapp logs show \
  --name retail-router \
  --resource-group myResourceGroup \
  --follow
```

### 實作資源

**架構與設計：**
- 📖 [完整架構指南](../retail-scenario.md) - 詳細的實作模式
- 📖 [多代理設計模式](https://learn.microsoft.com/azure/architecture/ai-ml/guide/multi-agent-systems)

**代碼範例：**
- 🔗 [Azure OpenAI 聊天範例](https://github.com/Azure-Samples/azure-search-openai-demo) - RAG 模式
- 🔗 [Semantic Kernel](https://github.com/microsoft/semantic-kernel) - 代理框架（C#）
- 🔗 [LangChain Azure](https://github.com/langchain-ai/langchain) - 代理編排（Python）
- 🔗 [AutoGen](https://github.com/microsoft/autogen) - 多代理對話

**預估總工作量：**
- 基礎架構部署：15-25 分鐘（✅ 已完成）
- 應用程式開發：80-120 小時（🔨 您的工作）
- 測試及優化：15-25 小時（🔨 您的工作）

## 🛠️ 疑難排解

### 常見問題

#### 1. Azure OpenAI 配額超出

```bash
# 檢查目前配額使用情況
az cognitiveservices usage list --location eastus2

# 申請增加配額
az support tickets create \
  --ticket-name "OpenAI-Quota-Increase" \
  --severity "minimal" \
  --description "Request quota increase for Azure OpenAI in region X"
```

#### 2. 容器應用程式部署失敗

```bash
# 檢查容器應用程式日誌
az containerapp logs show \
  --name retail-router \
  --resource-group myResourceGroup \
  --follow

# 重新啟動容器應用程式
az containerapp revision restart \
  --name retail-router \
  --resource-group myResourceGroup
```

#### 3. 搜索服務初始化

```bash
# 驗證搜尋服務狀態
az search service show \
  --name <search-service-name> \
  --resource-group myResourceGroup

# 測試搜尋服務連接性
curl -X GET "https://<search-service-name>.search.windows.net/indexes?api-version=2023-11-01" \
  -H "api-key: <search-admin-key>"
```

### 部署驗證

```bash
# 驗證所有資源已建立
az resource list \
  --resource-group myResourceGroup \
  --output table

# 檢查資源健康狀態
az resource list \
  --resource-group myResourceGroup \
  --query "[?provisioningState!='Succeeded'].{Name:name, Status:provisioningState, Type:type}" \
  --output table
```

## 🔐 安全性考量

### 金鑰管理
- 所有密碼儲存在 Azure Key Vault（啟用時）
- 容器應用程式使用受管理的身份進行驗證
- 儲存帳戶啟用安全預設值（僅 HTTPS，無公共 Blob 存取）

### 網路安全
- 容器應用程式盡可能使用內部網路
- 搜索服務配置為私人端點選項
- Cosmos DB 配置為最低必要權限

### RBAC 配置
```bash
# 指派必要的角色給受管理的身分識別
az role assignment create \
  --assignee <container-app-managed-identity> \
  --role "Cognitive Services OpenAI User" \
  --scope <openai-resource-id>
```

## 💰 成本優化

### 成本估算（每月，美元）

| 模式 | OpenAI | 容器應用程式 | 搜索 | 儲存 | 總估算 |
|------|--------|----------------|--------|---------|------------|
| 最低 | $50-200 | $20-50 | $25-100 | $5-20 | $100-370 |
| 標準 | $200-800 | $100-300 | $100-300 | $20-50 | $420-1450 |
| 高級 | $500-2000 | $300-800 | $300-600 | $50-100 | $1150-3500 |

### 成本監控

```bash
# 設定預算警示
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
- 對 ARM 模板文件進行版本控制
- 先在開發環境中測試更改
- 使用增量部署模式進行更新

### 資源更新
```bash
# 使用新參數更新
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --mode Incremental
```

### 備份與恢復
- Cosmos DB 啟用自動備份
- Key Vault 啟用軟刪除
- 容器應用程式保留修訂版本以供回滾

## 📞 支援

- **模板問題**：[GitHub Issues](https://github.com/microsoft/azd-for-beginners/issues)
- **Azure 支援**：[Azure 支援入口](https://portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade)
- **社群**：[Azure AI Discord](https://discord.gg/microsoft-azure)

---

**⚡ 準備好部署您的多代理解決方案了嗎？**

開始：`./deploy.sh -g myResourceGroup`

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：  
本文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。儘管我們致力於提供準確的翻譯，請注意自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議使用專業人工翻譯。我們對因使用此翻譯而引起的任何誤解或誤釋不承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->