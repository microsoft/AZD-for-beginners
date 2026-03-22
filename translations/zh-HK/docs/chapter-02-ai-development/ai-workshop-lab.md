# AI 工作坊實驗室：讓您的 AI 解決方案可用 AZD 部署

**章節導覽：**
- **📚 課程首頁**：[AZD For Beginners](../../README.md)
- **📖 目前章節**：第二章 - AI 優先開發
- **⬅️ 上一章**：[AI 模型部署](ai-model-deployment.md)
- **➡️ 下一章**：[生產 AI 最佳實踐](production-ai-practices.md)
- **🚀 下一章節**：[第三章：配置](../chapter-03-configuration/configuration.md)

## 工作坊概述

這個實作實驗室將引導開發人員使用 Azure Developer CLI (AZD) 對現有的 AI 範本進行部署。您將學習使用 Microsoft Foundry 服務進行生產級 AI 部署的重要模式。

**時長：** 2-3 小時  
**難度：** 中階  
**先備知識：** 基本 Azure 知識，熟悉 AI/ML 概念

## 🎓 學習目標

完成此工作坊後，您將能夠：
- ✅ 將現有 AI 應用程式轉換為使用 AZD 範本
- ✅ 使用 AZD 配置 Microsoft Foundry 服務
- ✅ 實現 AI 服務的安全憑證管理
- ✅ 部署具備監控的生產準備 AI 應用程式
- ✅ 排解常見的 AI 部署問題

## 先備條件

### 必備工具
- 已安裝 [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- 已安裝 [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli)
- 已安裝 [Git](https://git-scm.com/)
- 程式碼編輯器（推薦 VS Code）

### Azure 資源
- 具有參與者存取權的 Azure 訂閱
- 可使用 Microsoft Foundry Models 服務（或可申請使用權）
- 可建立資源群組的權限

### 知識先備
- 基本 Azure 服務理解
- 熟悉命令列介面
- 基本 AI/ML 概念（API、模型、提示）

## 實驗室設置

### 步驟 1：環境準備

1. **確認工具安裝：**
```bash
# 檢查 AZD 安裝
azd version

# 檢查 Azure CLI
az --version

# 登入 Azure
az login
azd auth login
```

2. **複製工作坊程式碼庫：**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## 模組 1：了解 AI 應用的 AZD 結構

### AI AZD 範本結構剖析

探索 AI 專用 AZD 範本的關鍵檔案：

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Microsoft Foundry Models configuration
│       ├── search.bicep    # Cognitive Search setup
│       └── webapp.bicep    # Web app configuration
├── app/                    # Application code
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

### **實驗室練習 1.1：探索設定檔**

1. **檢視 azure.yaml 檔案：**
```bash
cat azure.yaml
```

**觀察重點：**
- AI 組件的服務定義
- 環境變數映射
- 主機設定

2. **檢視 main.bicep 基礎架構：**
```bash
cat infra/main.bicep
```

**需識別的 AI 模式：**
- Microsoft Foundry Models 服務提供
- 認知搜尋整合
- 安全密鑰管理
- 網路安全設定

### **討論重點：為什麼這些模式對 AI 很重要**

- <strong>服務依賴性</strong>：AI 應用通常需要多個協調服務
- <strong>安全性</strong>：API 金鑰與端點需安全管理
- <strong>擴充性</strong>：AI 工作負載有獨特的擴展需求
- <strong>成本管理</strong>：若配置不當，AI 服務費用昂貴

## 模組 2：部署您的第一個 AI 應用

### 步驟 2.1：初始化環境

1. **建立新的 AZD 環境：**
```bash
azd env new myai-workshop
```

2. **設定必要參數：**
```bash
# 設定你偏好的 Azure 地區
azd env set AZURE_LOCATION eastus

# 選填：設定特定的 OpenAI 模型
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### 步驟 2.2：部署基礎架構與應用程式

1. **使用 AZD 部署：**
```bash
azd up
```

**azd up 過程中發生的事：**
- ✅ 提供 Microsoft Foundry Models 服務
- ✅ 建立認知搜尋服務
- ✅ 設置 Web 應用的 App Service
- ✅ 網路與安全性配置
- ✅ 部署應用程式程式碼
- ✅ 建立監控與日誌系統

2. <strong>監控部署進度</strong> 並留意建立的資源。

### 步驟 2.3：驗證您的部署

1. **檢查已部署資源：**
```bash
azd show
```

2. **開啟已部署的應用程式：**
```bash
azd show --output json | grep "webAppUrl"
```

3. **測試 AI 功能：**
   - 瀏覽至網頁應用
   - 嘗試示範查詢
   - 驗證 AI 回應是否正常

### **實驗室練習 2.1：排錯練習**

<strong>情境</strong>：您的部署成功，但 AI 沒有回應。

**常見問題檢查清單：**
1. **OpenAI API 金鑰**：確認是否正確設定
2. <strong>模型可用性</strong>：檢查地區支援模型狀態
3. <strong>網路連線</strong>：確保服務間可互相通訊
4. **RBAC 權限**：確認應用程式可存取 OpenAI

**偵錯指令：**
```bash
# 檢查環境變數
azd env get-values

# 查看部署日誌
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# 檢查 OpenAI 部署狀態
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## 模組 3：為您的需求自訂 AI 應用

### 步驟 3.1：修改 AI 配置

1. **更新 OpenAI 模型：**
```bash
# 更改至其他型號（如你地區有供應）
azd env set AZURE_OPENAI_MODEL gpt-4.1

# 使用新設定重新部署
azd deploy
```

2. **新增其他 AI 服務：**

編輯 `infra/main.bicep` 新增文件智慧：

```bicep
// Add to main.bicep
resource documentIntelligence 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: 'doc-intel-${uniqueString(resourceGroup().id)}'
  location: location
  kind: 'FormRecognizer'
  sku: {
    name: 'F0'  // Free tier for workshop
  }
  properties: {
    customSubDomainName: 'doc-intel-${uniqueString(resourceGroup().id)}'
  }
}
```

### 步驟 3.2：環境特有設定

<strong>最佳實務</strong>：開發與生產環境使用不同配置。

1. **建立生產環境：**
```bash
azd env new myai-production
```

2. **設定生產專屬參數：**
```bash
# 生產通常使用較高的 SKU
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# 啟用額外的安全功能
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **實驗室練習 3.1：成本優化**

<strong>挑戰</strong>：為開發環境配置成本效益最佳化設定。

**任務：**
1. 識別可設定為免費/基本方案的 SKU
2. 設定環境變數以降低成本
3. 部署並與生產配置成本做比較

**解決建議：**
- 盡可能使用 F0 (免費) 級別的認知服務
- 開發環境使用搜尋服務的基本方案
- 功能使用消費方案

## 模組 4：安全性與生產最佳實踐

### 步驟 4.1：安全憑證管理

<strong>當前挑戰</strong>：許多 AI 應用硬編 API 金鑰或用不安全儲存。

**AZD 解決方案**：Managed Identity 與 Key Vault 整合。

1. **檢視範本中的安全配置：**
```bash
# 尋找 Key Vault 及受管身份組態
grep -r "keyVault\|managedIdentity" infra/
```

2. **驗證 Managed Identity 功能：**
```bash
# 檢查網頁應用程式是否有正確的身份配置
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### 步驟 4.2：網路安全

1. <strong>啟用私有端點</strong>（若尚未配置）：

新增至您的 bicep 範本：
```bicep
// Private endpoint for OpenAI
resource openAIPrivateEndpoint 'Microsoft.Network/privateEndpoints@2023-04-01' = {
  name: 'pe-openai-${uniqueString(resourceGroup().id)}'
  location: location
  properties: {
    subnet: {
      id: vnet.properties.subnets[0].id
    }
    privateLinkServiceConnections: [
      {
        name: 'openai-connection'
        properties: {
          privateLinkServiceId: openAIAccount.id
          groupIds: ['account']
        }
      }
    ]
  }
}
```

### 步驟 4.3：監控與可觀察性

1. **配置 Application Insights：**
```bash
# 應用程式洞察應該被自動配置
# 檢查配置：
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **設定 AI 特定的監控：**

新增 AI 作業的自訂指標：
```bicep
// In your web app configuration
resource webApp 'Microsoft.Web/sites@2023-01-01' = {
  properties: {
    siteConfig: {
      appSettings: [
        {
          name: 'APPLICATIONINSIGHTS_CONNECTION_STRING'
          value: applicationInsights.properties.ConnectionString
        }
        {
          name: 'OPENAI_MONITOR_ENABLED'
          value: 'true'
        }
      ]
    }
  }
}
```

### **實驗室練習 4.1：安全審查**

<strong>任務</strong>：檢視您的部署安全最佳實踐。

**檢查清單：**
- [ ] 代碼或配置中無硬編秘密資訊
- [ ] 使用 Managed Identity 進行服務間認證
- [ ] Key Vault 儲存敏感設定
- [ ] 正確限制網路存取
- [ ] 啟用監控和日誌

## 模組 5：轉換您自己的 AI 應用

### 步驟 5.1：評估工作表

**轉換應用前，回答下列問題：**

1. **應用架構：**
   - 您的應用使用什麼 AI 服務？
   - 需要哪些計算資源？
   - 是否需要資料庫？
   - 服務間依賴關係為何？

2. **安全需求：**
   - 應用處理哪些敏感資料？
   - 有哪些合規要求？
   - 是否需要私有網路？

3. **擴充需求：**
   - 預期負載為何？
   - 是否需要自動擴展？
   - 是否有區域性需求？

### 步驟 5.2：建立您的 AZD 範本

**依照此模式轉換應用：**

1. **建立基礎結構：**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# 初始化 AZD 範本
azd init --template minimal
```

2. **建立 azure.yaml：**
```yaml
# Metadata
name: my-ai-app
metadata:
  template: my-ai-app-template@0.0.1-beta

# Services definition
services:
  api:
    project: ./api
    host: containerapp
  web:
    project: ./web
    host: staticwebapp
    
# Hooks for custom deployment logic  
hooks:
  predeploy:
    shell: sh
    run: echo "Preparing AI models..."
```

3. **建立基礎設施範本：**

**infra/main.bicep** - 主要範本：
```bicep
@description('Primary location for all resources')
param location string = resourceGroup().location

@description('Name of the OpenAI service')
param openAIServiceName string = 'openai-${uniqueString(resourceGroup().id)}'

// Your AI services here
module openAI 'modules/openai.bicep' = {
  name: 'openai'
  params: {
    name: openAIServiceName
    location: location
  }
}
```

**infra/modules/openai.bicep** - OpenAI 模組：
```bicep
@description('Name of the OpenAI service')
param name string

@description('Location for the OpenAI service')
param location string

resource openAIAccount 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: name
  location: location
  kind: 'OpenAI'
  sku: {
    name: 'S0'
  }
  properties: {
    customSubDomainName: name
  }
}

output endpoint string = openAIAccount.properties.endpoint
output name string = openAIAccount.name
```

### **實驗室練習 5.1：範本建立挑戰**

<strong>挑戰</strong>：為文件處理 AI 應用建立 AZD 範本。

**需求：**
- 使用 Microsoft Foundry Models 進行內容分析
- 文件智慧用於 OCR
- 文件上傳所需的儲存帳戶
- 處理邏輯的 Function App
- 使用者介面的 Web 應用

**加分項目：**
- 添加適當的錯誤處理
- 包含成本估算
- 設置監控儀表板

## 模組 6：常見問題排解

### 常見部署問題

#### 問題 1：OpenAI 服務配額超過
**症狀：** 部署時出現配額錯誤  
**解決方案：**
```bash
# 檢查當前配額
az cognitiveservices usage list --location eastus

# 請求增加配額或嘗試不同區域
azd env set AZURE_LOCATION westus2
azd up
```

#### 問題 2：模型在區域不可用
**症狀：** AI 回應失敗或模型部署錯誤  
**解決方案：**
```bash
# 檢查各地區的模型可用性
az cognitiveservices model list --location eastus

# 更新為可用的模型
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### 問題 3：權限問題
**症狀：** 呼叫 AI 服務時出現 403 禁止錯誤  
**解決方案：**
```bash
# 檢查角色指派
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# 新增缺少的角色
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### 效能問題

#### 問題 4：AI 回應緩慢
**調查步驟：**
1. 檢查 Application Insights 的效能指標
2. 於 Azure 入口網站查看 OpenAI 服務指標
3. 驗證網路連線與延遲

**解決方案：**
- 為常見查詢實作快取
- 選用適當的 OpenAI 模型
- 考慮讀取複本以應付高負載

### **實驗室練習 6.1：偵錯挑戰**

<strong>情境</strong>：部署成功，但應用程式回傳 500 錯誤。

**偵錯任務：**
1. 檢查應用程式日誌
2. 驗證服務連線
3. 測試身份驗證
4. 檢查配置設定

**使用工具：**
- `azd show` 查看部署概況
- Azure 入口網站檢視服務詳細日誌
- Application Insights 監控遙測資料

## 模組 7：監控與優化

### 步驟 7.1：設置全面監控

1. **建立自訂儀表板：**

在 Azure 入口網站建立包含以下內容的儀表板：
- OpenAI 請求數與延遲
- 應用程式錯誤率
- 資源使用量
- 成本追蹤

2. **設置警示：**
```bash
# 高錯誤率警報
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### 步驟 7.2：成本優化

1. **分析目前成本：**
```bash
# 使用 Azure CLI 獲取成本數據
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **實施成本控制：**
- 設定預算警示
- 使用自動擴縮政策
- 實施請求快取
- 監控 OpenAI 令牌使用量

### **實驗室練習 7.1：效能優化**

<strong>任務</strong>：優化您的 AI 應用程式效能和成本。

**提升指標：**
- 平均回應時間降低 20%
- 月度成本降低 15%
- 維持 99.9% 正常運作時間

**可嘗試策略：**
- 實作回應快取
- 優化提示以提升令牌效率
- 使用適合的計算 SKU
- 設置適當的自動擴展

## 最終挑戰：端到端實作

### 挑戰情境

您需建立一個生產準備的 AI 智能客戶服務聊天機器人，具備以下需求：

**功能需求：**
- 客戶互動的網頁介面
- 整合 Microsoft Foundry Models 作為回應引擎
- 使用認知搜尋進行文件搜尋
- 整合現有客戶資料庫
- 多語言支援

**非功能需求：**
- 支援 1000 位同時用戶
- 99.9% 可用性 SLA
- SOC 2 合規
- 月費不超過 500 美元
- 部署多個環境（開發、預演、生產）

### 實作步驟

1. <strong>設計架構</strong>
2. **建立 AZD 範本**
3. <strong>實施安全措施</strong>
4. <strong>設置監控與警報</strong>
5. <strong>建立部署管線</strong>
6. <strong>撰寫解決方案文件</strong>

### 評估標準

- ✅ <strong>功能</strong>：符合所有需求？
- ✅ <strong>安全性</strong>：遵循最佳實務？
- ✅ <strong>擴充性</strong>：能否承受負載？
- ✅ <strong>可維護性</strong>：代碼與基礎架構是否有序？
- ✅ <strong>成本</strong>：是否在預算內？

## 額外資源

### Microsoft 文件
- [Azure Developer CLI 文件](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models 服務文件](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry 文件](https://learn.microsoft.com/azure/ai-studio/)

### 範本範例
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App 快速入門](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### 社群資源
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 完成證書

恭喜您完成 AI 工作坊實驗室。您現在應該能夠：
- ✅ 將現有 AI 應用轉換為 AZD 範本  
- ✅ 部署生產就緒的 AI 應用  
- ✅ 實施 AI 工作負載的安全最佳實踐  
- ✅ 監控並優化 AI 應用效能  
- ✅ 排解常見部署問題  

### 下一步  
1. 將這些模式應用於您自己的 AI 專案  
2. 將範本回饋給社群  
3. 加入 Microsoft Foundry Discord 獲得持續支援  
4. 探索進階主題如多區域部署  

---

<strong>工作坊回饋</strong>：請透過 [Microsoft Foundry Discord #Azure 頻道](https://discord.gg/microsoft-azure) 分享您的體驗，幫助我們改進此工作坊。

---

**章節導航：**  
- **📚 課程首頁**: [AZD 新手入門](../../README.md)  
- **📖 目前章節**: 第 2 章 - AI 優先開發  
- **⬅️ 上一章**: [AI 模型部署](ai-model-deployment.md)  
- **➡️ 下一章**: [生產 AI 最佳實踐](production-ai-practices.md)  
- **🚀 下一章節**: [第 3 章：配置](../chapter-03-configuration/configuration.md)  

**需要幫助嗎？** 加入我們的社群，參與有關 AZD 和 AI 部署的支援與討論。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：  
本文件使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們力求準確，但請注意，自動翻譯可能包含錯誤或不準確之處。文件的原始語言版本應被視為權威來源。對於重要資訊，建議採用專業人工翻譯。我們對因使用此翻譯所產生的任何誤解或誤譯概不負責。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->