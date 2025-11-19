<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "1a8d383064bdb1ee923677a145de53ea",
  "translation_date": "2025-11-19T14:02:13+00:00",
  "source_file": "examples/retail-multiagent-arm-template/README.md",
  "language_code": "hk"
}
-->
# 零售多代理解決方案 - 基礎設施模板

**第5章：生產部署包**
- **📚 課程主頁**: [AZD 初學者指南](../../README.md)
- **📖 相關章節**: [第5章：多代理人工智能解決方案](../../README.md#-chapter-5-multi-agent-ai-solutions-advanced)
- **📝 場景指南**: [完整架構](../retail-scenario.md)
- **🎯 快速部署**: [一鍵部署](../../../../examples/retail-multiagent-arm-template)

> **⚠️ 僅限基礎設施模板**  
> 此 ARM 模板部署 **Azure 資源** 用於多代理系統。  
>  
> **部署內容 (15-25 分鐘):**
> - ✅ Azure OpenAI (GPT-4o, GPT-4o-mini, 以及跨三個地區的嵌入模型)
> - ✅ AI 搜索服務 (空白，準備建立索引)
> - ✅ 容器應用 (佔位符映像，準備加入您的代碼)
> - ✅ 儲存、Cosmos DB、Key Vault、Application Insights
>  
> **未包含內容 (需要開發):**
> - ❌ 代理實現代碼 (客戶代理、庫存代理)
> - ❌ 路由邏輯和 API 端點
> - ❌ 前端聊天界面
> - ❌ 搜索索引結構和數據管道
> - ❌ **估計開發時間: 80-120 小時**
>  
> **使用此模板的情況:**
> - ✅ 您希望為多代理項目配置 Azure 基礎設施
> - ✅ 您計劃單獨開發代理實現
> - ✅ 您需要一個生產就緒的基礎設施基線
>  
> **不適用於:**
> - ❌ 您期望立即獲得一個可運行的多代理演示
> - ❌ 您正在尋找完整的應用代碼示例

## 概覽

此目錄包含一個全面的 Azure Resource Manager (ARM) 模板，用於部署多代理客戶支持系統的 **基礎設施基礎**。該模板配置所有必要的 Azure 服務，並進行適當的連接，為您的應用開發做好準備。

**部署後，您將擁有:** 生產就緒的 Azure 基礎設施  
**完成系統所需:** 代理代碼、前端界面和數據配置 (參見 [架構指南](../retail-scenario.md))

## 🎯 部署內容

### 核心基礎設施 (部署後狀態)

✅ **Azure OpenAI 服務** (準備進行 API 調用)
  - 主要地區: GPT-4o 部署 (20K TPM 容量)
  - 次要地區: GPT-4o-mini 部署 (10K TPM 容量)
  - 第三地區: 文本嵌入模型 (30K TPM 容量)
  - 評估地區: GPT-4o 評分模型 (15K TPM 容量)
  - **狀態:** 完全運行 - 可立即進行 API 調用

✅ **Azure AI 搜索** (空白 - 準備配置)
  - 啟用向量搜索功能
  - 標準層，1 個分區，1 個副本
  - **狀態:** 服務運行中，但需要建立索引
  - **需要操作:** 使用您的結構創建搜索索引

✅ **Azure 儲存帳戶** (空白 - 準備上傳)
  - Blob 容器: `documents`, `uploads`
  - 安全配置 (僅 HTTPS，無公共訪問)
  - **狀態:** 準備接收文件
  - **需要操作:** 上傳您的產品數據和文檔

⚠️ **容器應用環境** (已部署佔位符映像)
  - 代理路由應用 (nginx 默認映像)
  - 前端應用 (nginx 默認映像)
  - 自動縮放配置 (0-10 個實例)
  - **狀態:** 運行佔位符容器
  - **需要操作:** 構建並部署您的代理應用

✅ **Azure Cosmos DB** (空白 - 準備數據)
  - 預配置的數據庫和容器
  - 優化低延遲操作
  - 啟用 TTL 自動清理
  - **狀態:** 準備存儲聊天記錄

✅ **Azure Key Vault** (可選 - 準備存儲機密)
  - 啟用軟刪除
  - 為托管身份配置 RBAC
  - **狀態:** 準備存儲 API 密鑰和連接字符串

✅ **Application Insights** (可選 - 監控已啟用)
  - 連接到 Log Analytics 工作區
  - 配置自定義指標和警報
  - **狀態:** 準備接收應用程序的遙測數據

✅ **文檔智能** (準備進行 API 調用)
  - S0 層，用於生產工作負載
  - **狀態:** 準備處理上傳的文檔

✅ **Bing 搜索 API** (準備進行 API 調用)
  - S1 層，用於實時搜索
  - **狀態:** 準備進行網頁搜索查詢

### 部署模式

| 模式 | OpenAI 容量 | 容器實例 | 搜索層級 | 儲存冗餘 | 適用於 |
|------|-------------|----------|----------|----------|--------|
| **Minimal** | 10K-20K TPM | 0-2 副本 | 基本 | LRS (本地) | 開發/測試、學習、概念驗證 |
| **Standard** | 30K-60K TPM | 2-5 副本 | 標準 | ZRS (區域) | 生產、中等流量 (<10K 用戶) |
| **Premium** | 80K-150K TPM | 5-10 副本，區域冗餘 | 高級 | GRS (地理) | 企業、高流量 (>10K 用戶)、99.99% SLA |

**成本影響:**
- **Minimal → Standard:** ~4 倍成本增加 ($100-370/月 → $420-1,450/月)
- **Standard → Premium:** ~3 倍成本增加 ($420-1,450/月 → $1,150-3,500/月)
- **選擇依據:** 預期負載、SLA 要求、預算限制

**容量規劃:**
- **TPM (每分鐘令牌數):** 所有模型部署的總和
- **容器實例:** 自動縮放範圍 (最小-最大副本)
- **搜索層級:** 影響查詢性能和索引大小限制

## 📋 先決條件

### 必需工具
1. **Azure CLI** (版本 2.50.0 或更高)
   ```bash
   az --version  # 檢查版本
   az login      # 驗證身份
   ```

2. **有效的 Azure 訂閱**，具有擁有者或貢獻者訪問權限
   ```bash
   az account show  # 驗證訂閱
   ```

### 必需的 Azure 配額

在部署之前，請確認目標地區的配額是否足夠：

```bash
# 檢查 Azure OpenAI 在您地區的可用性
az cognitiveservices account list-skus \
  --kind OpenAI \
  --location eastus2

# 驗證 OpenAI 配額（以 gpt-4o 為例）
az cognitiveservices usage list \
  --location eastus2 \
  --query "[?name.value=='OpenAI.Standard.gpt-4o']"

# 檢查 Container Apps 配額
az provider show \
  --namespace Microsoft.App \
  --query "resourceTypes[?resourceType=='managedEnvironments'].locations"
```

**最低要求配額:**
- **Azure OpenAI:** 3-4 個模型部署，跨多個地區
  - GPT-4o: 20K TPM (每分鐘令牌數)
  - GPT-4o-mini: 10K TPM
  - text-embedding-ada-002: 30K TPM
  - **注意:** GPT-4o 在某些地區可能需要等待名單 - 查看 [模型可用性](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- **容器應用:** 托管環境 + 2-10 個容器實例
- **AI 搜索:** 標準層 (基本層不足以支持向量搜索)
- **Cosmos DB:** 標準預配吞吐量

**如果配額不足:**
1. 前往 Azure Portal → 配額 → 請求增加
2. 或使用 Azure CLI:
   ```bash
   az support tickets create \
     --ticket-name "OpenAI-Quota-Increase" \
     --severity "minimal" \
     --description "Request quota increase for Azure OpenAI GPT-4o in eastus2"
   ```
3. 考慮具有可用性的替代地區

## 🚀 快速部署

### 選項 1: 使用 Azure CLI

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

### 選項 2: 使用 Azure Portal

[![部署到 Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2Fazd-for-beginners%2Fmain%2Fexamples%2Fretail-multiagent-arm-template%2Fazuredeploy.json)

### 選項 3: 直接使用 Azure CLI

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

### 預期情況

| 階段 | 時間 | 發生什麼 |
|------|------|----------|
| **模板驗證** | 30-60 秒 | Azure 驗證 ARM 模板語法和參數 |
| **資源組設置** | 10-20 秒 | 創建資源組 (如有需要) |
| **OpenAI 配置** | 5-8 分鐘 | 創建 3-4 個 OpenAI 帳戶並部署模型 |
| **容器應用** | 3-5 分鐘 | 創建環境並部署佔位符容器 |
| **搜索與儲存** | 2-4 分鐘 | 配置 AI 搜索服務和儲存帳戶 |
| **Cosmos DB** | 2-3 分鐘 | 創建數據庫並配置容器 |
| **監控設置** | 2-3 分鐘 | 設置 Application Insights 和 Log Analytics |
| **RBAC 配置** | 1-2 分鐘 | 配置托管身份和權限 |
| **總部署時間** | **15-25 分鐘** | 完成基礎設施準備 |

**部署後:**
- ✅ **基礎設施準備就緒:** 所有 Azure 服務已配置並運行
- ⏱️ **應用開發:** 80-120 小時 (您的責任)
- ⏱️ **索引配置:** 15-30 分鐘 (需要您的結構)
- ⏱️ **數據上傳:** 根據數據集大小而異
- ⏱️ **測試與驗證:** 2-4 小時

---

## ✅ 驗證部署成功

### 步驟 1: 檢查資源配置 (2 分鐘)

```bash
# 驗證所有資源是否成功部署
az resource list \
  --resource-group myResourceGroup \
  --query "[?provisioningState!='Succeeded'].{Name:name, Status:provisioningState, Type:type}" \
  --output table
```

**預期:** 空表格 (所有資源顯示 "Succeeded" 狀態)

### 步驟 2: 驗證 Azure OpenAI 部署 (3 分鐘)

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

**預期:** 
- 3-4 個 OpenAI 帳戶 (主要、次要、第三、評估地區)
- 每個帳戶 1-2 個模型部署 (gpt-4o, gpt-4o-mini, text-embedding-ada-002)

### 步驟 3: 測試基礎設施端點 (5 分鐘)

```bash
# 獲取容器應用程式的網址
az containerapp list \
  --resource-group myResourceGroup \
  --query "[].{Name:name, URL:properties.configuration.ingress.fqdn, Status:properties.runningStatus}" \
  --output table

# 測試路由器端點（佔位圖片將回應）
ROUTER_URL=$(az containerapp show \
  --name retail-router \
  --resource-group myResourceGroup \
  --query "properties.configuration.ingress.fqdn" -o tsv)

echo "Testing: https://$ROUTER_URL"
curl -I https://$ROUTER_URL || echo "Container running (placeholder image - expected)"
```

**預期:** 
- 容器應用顯示 "Running" 狀態
- 佔位符 nginx 響應 HTTP 200 或 404 (尚無應用代碼)

### 步驟 4: 驗證 Azure OpenAI API 訪問 (3 分鐘)

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

**預期:** JSON 響應包含聊天完成 (確認 OpenAI 功能正常)

### 運行與未運行的功能

**✅ 部署後運行:**
- Azure OpenAI 模型已部署並接受 API 調用
- AI 搜索服務運行中 (空白，尚無索引)
- 容器應用運行中 (佔位符 nginx 映像)
- 儲存帳戶可訪問並準備上傳
- Cosmos DB 準備進行數據操作
- Application Insights 收集基礎設施遙測數據
- Key Vault 準備存儲機密

**❌ 尚未運行 (需要開發):**
- 代理端點 (尚未部署應用代碼)
- 聊天功能 (需要前端 + 後端實現)
- 搜索查詢 (尚未創建搜索索引)
- 文檔處理管道 (尚未上傳數據)
- 自定義遙測 (需要應用程序儀表化)

**下一步:** 參見 [部署後配置](../../../../examples/retail-multiagent-arm-template) 開發並部署您的應用

---

## ⚙️ 配置選項

### 模板參數

| 參數 | 類型 | 默認值 | 描述 |
|------|------|--------|------|
| `projectName` | string | "retail" | 所有資源名稱的前綴 |
| `location` | string | 資源組位置 | 主要部署地區 |
| `secondaryLocation` | string | "westus2" | 用於多地區部署的次要地區 |
| `tertiaryLocation` | string | "francecentral" | 嵌入模型的地區 |
| `environmentName` | string | "dev" | 環境標識 (dev/staging/prod) |
| `deploymentMode` | string | "standard" | 部署配置 (minimal/standard/premium) |
| `enableMultiRegion` | bool | true | 啟用多地區部署 |
| `enableMonitoring` | bool | true | 啟用 Application Insights 和日誌記錄 |
| `enableSecurity` | bool | true | 啟用 Key Vault 和增強安全性 |

### 自定義參數

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

## 🏗️ 架構概覽

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

`deploy.sh` 腳本提供交互式部署體驗:

```bash
# 顯示幫助
./deploy.sh --help

# 基本部署
./deploy.sh -g myResourceGroup

# 使用自定義設置的高級部署
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

- ✅ **先決條件驗證** (Azure CLI、登錄狀態、模板文件)
- ✅ **資源組管理** (如不存在則創建)
- ✅ **模板驗證** 在部署前
- ✅ **進度監控** 帶有彩色輸出
- ✅ **部署輸出** 顯示
- ✅ **部署後指導**

## 📊 部署監控

### 檢查部署狀態

```bash
# 列出部署
az deployment group list --resource-group myResourceGroup --output table

# 獲取部署詳情
az deployment group show \
  --resource-group myResourceGroup \
  --name retail-deployment-YYYYMMDD-HHMMSS

# 監察部署進度
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --verbose
```

### 部署輸出

成功部署後，以下輸出可用:

- **前端 URL**: 網頁界面的公共端點
- **路由器 URL**: 代理路由的 API 端點
- **OpenAI 端點**: 主要和次要 OpenAI 服務端點
- **搜索服務**: Azure AI 搜索服務端點
- **儲存帳戶**: 文檔儲存帳戶名稱
- **Key Vault**: Key Vault 名稱 (如啟用)
- **Application Insights**: 監控服務名稱 (如啟用)

## 🔧 部署後: 下一步
> **📝 重要提示：** 基礎設施已部署，但你需要開發及部署應用程式代碼。

### 第1階段：開發代理應用程式（你的責任）

ARM 模板會建立**空的 Container Apps**，並使用佔位的 nginx 圖像。你需要：

**必須開發：**
1. **代理實現**（30-40 小時）
   - 客戶服務代理，整合 GPT-4o
   - 庫存代理，整合 GPT-4o-mini
   - 代理路由邏輯

2. **前端開發**（20-30 小時）
   - 聊天介面 UI（React/Vue/Angular）
   - 文件上傳功能
   - 回應渲染及格式化

3. **後端服務**（12-16 小時）
   - FastAPI 或 Express 路由器
   - 認證中介軟件
   - 遙測整合

**參考：** [架構指南](../retail-scenario.md) 了解詳細實現模式及代碼範例

### 第2階段：配置 AI 搜索索引（15-30 分鐘）

建立與你的數據模型匹配的搜索索引：

```bash
# 獲取搜尋服務詳情
SEARCH_NAME=$(az search service list \
  --resource-group myResourceGroup \
  --query "[0].name" -o tsv)

SEARCH_KEY=$(az search admin-key show \
  --service-name $SEARCH_NAME \
  --resource-group myResourceGroup \
  --query "primaryKey" -o tsv)

# 使用您的架構建立索引（示例）
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

### 第3階段：上傳你的數據（時間因情況而異）

當你有產品數據及文件時：

```bash
# 獲取儲存帳戶詳情
STORAGE_NAME=$(az storage account list \
  --resource-group myResourceGroup \
  --query "[0].name" -o tsv)

STORAGE_KEY=$(az storage account keys list \
  --account-name $STORAGE_NAME \
  --resource-group myResourceGroup \
  --query "[0].value" -o tsv)

# 上載您的文件
az storage blob upload-batch \
  --destination documents \
  --source /path/to/your/product/docs \
  --account-name $STORAGE_NAME \
  --account-key $STORAGE_KEY

# 示例：上載單一檔案
az storage blob upload \
  --container-name documents \
  --name "product-manual.pdf" \
  --file /path/to/product-manual.pdf \
  --account-name $STORAGE_NAME \
  --account-key $STORAGE_KEY
```

### 第4階段：構建及部署你的應用程式（8-12 小時）

當你完成代理代碼開發後：

```bash
# 1. 建立 Azure 容器註冊表（如有需要）
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

### 第5階段：測試你的應用程式（2-4 小時）

```bash
# 獲取您的應用程式 URL
ROUTER_URL=$(az containerapp show \
  --name retail-router \
  --resource-group myResourceGroup \
  --query "properties.configuration.ingress.fqdn" -o tsv)

# 測試代理端點（當您的代碼部署後）
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

### 實現資源

**架構及設計：**
- 📖 [完整架構指南](../retail-scenario.md) - 詳細實現模式
- 📖 [多代理設計模式](https://learn.microsoft.com/azure/architecture/ai-ml/guide/multi-agent-systems)

**代碼範例：**
- 🔗 [Azure OpenAI 聊天範例](https://github.com/Azure-Samples/azure-search-openai-demo) - RAG 模式
- 🔗 [Semantic Kernel](https://github.com/microsoft/semantic-kernel) - 代理框架（C#）
- 🔗 [LangChain Azure](https://github.com/langchain-ai/langchain) - 代理編排（Python）
- 🔗 [AutoGen](https://github.com/microsoft/autogen) - 多代理對話

**預估總工作量：**
- 基礎設施部署：15-25 分鐘（✅ 已完成）
- 應用程式開發：80-120 小時（🔨 你的工作）
- 測試及優化：15-25 小時（🔨 你的工作）

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

#### 2. Container Apps 部署失敗

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

# 檢查資源狀況
az resource list \
  --resource-group myResourceGroup \
  --query "[?provisioningState!='Succeeded'].{Name:name, Status:provisioningState, Type:type}" \
  --output table
```

## 🔐 安全考量

### 密鑰管理
- 所有機密存儲於 Azure Key Vault（如啟用）
- Container Apps 使用受管理身份進行認證
- 儲存帳戶設置為安全默認值（僅 HTTPS，無公共 Blob 訪問）

### 網絡安全
- Container Apps 儘可能使用內部網絡
- 搜索服務配置為私有端點選項
- Cosmos DB 配置為最低必要權限

### RBAC 配置
```bash
# 為受管理的身份分配必要角色
az role assignment create \
  --assignee <container-app-managed-identity> \
  --role "Cognitive Services OpenAI User" \
  --scope <openai-resource-id>
```

## 💰 成本優化

### 成本估算（每月，美元）

| 模式 | OpenAI | Container Apps | 搜索 | 儲存 | 總估算 |
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

## 🔄 更新及維護

### 模板更新
- 將 ARM 模板文件進行版本控制
- 先在開發環境測試更改
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

### 備份及恢復
- Cosmos DB 啟用自動備份
- Key Vault 啟用軟刪除
- Container App 保留修訂版本以供回滾

## 📞 支援

- **模板問題**：[GitHub Issues](https://github.com/microsoft/azd-for-beginners/issues)
- **Azure 支援**：[Azure 支援入口](https://portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade)
- **社群**：[Azure AI Discord](https://discord.gg/microsoft-azure)

---

**⚡ 準備好部署你的多代理解決方案了嗎？**

開始：`./deploy.sh -g myResourceGroup`

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：  
此文件已使用人工智能翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。儘管我們致力於提供準確的翻譯，但請注意，自動翻譯可能包含錯誤或不準確之處。原始語言的文件應被視為權威來源。對於重要資訊，建議使用專業的人類翻譯。我們對因使用此翻譯而引起的任何誤解或誤釋不承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->