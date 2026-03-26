# AI 工作坊實驗：使您的 AI 解決方案可透過 AZD 部署

**章節導覽：**
- **📚 課程首頁**: [AZD 入門](../../README.md)
- **📖 目前章節**: 第 2 章 - AI 優先開發
- **⬅️ 上一章**: [AI 模型部署](ai-model-deployment.md)
- **➡️ 下一章**: [生產 AI 最佳實務](production-ai-practices.md)
- **🚀 下一章節**: [第 3 章：組態](../chapter-03-configuration/configuration.md)

## 工作坊概覽

此實作實驗引導開發人員透過 Azure Developer CLI (AZD) 將現有的 AI 範本部署。您將學習使用 Microsoft Foundry 服務進行生產級 AI 部署的基本範式。

**時長：** 2-3 小時  
**程度：** 中階  
**先決條件：** 基本 Azure 知識、熟悉 AI/ML 概念

## 🎓 學習目標

完成此工作坊後，您將能夠：
- ✅ 將現有 AI 應用轉換為使用 AZD 範本
- ✅ 使用 AZD 設定 Microsoft Foundry 服務
- ✅ 為 AI 服務實作安全的憑證管理
- ✅ 部署具備監控的生產就緒 AI 應用
- ✅ 偵錯常見的 AI 部署問題

## 先決條件

### 所需工具
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) 已安裝
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) 已安裝
- [Git](https://git-scm.com/) 已安裝
- 程式編輯器（建議使用 VS Code）

### Azure 資源
- 具備貢獻者存取權的 Azure 訂閱
- 可存取 Microsoft Foundry Models 服務（或能夠申請存取）
- 建立資源群組的權限

### 所需知識
- 基本的 Azure 服務理解
- 熟悉命令列介面
- 基本 AI/ML 概念（API、模型、提示詞）

## 實驗室設定

### 第 1 步：環境準備

1. **驗證工具是否已安裝：**
```bash
# 檢查 AZD 是否已安裝
azd version

# 檢查 Azure CLI 是否已安裝
az --version

# 登入 Azure
az login
azd auth login
```

2. **複製工作坊程式庫：**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## 模組 1：了解 AI 應用的 AZD 結構

### AI AZD 範本的結構分析

探索 AI 就緒的 AZD 範本中的關鍵檔案：

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

### **實驗練習 1.1：探索設定**

1. **檢視 azure.yaml 檔案：**
```bash
cat azure.yaml
```

**檢視重點：**
- AI 組件的服務定義
- 環境變數對應
- 主機設定

2. **查看 main.bicep 基礎架構：**
```bash
cat infra/main.bicep
```

**要識別的主要 AI 範式：**
- Microsoft Foundry Models 服務的配置
- Cognitive Search 整合
- 安全金鑰管理
- 網路安全設定

### **討論要點：** 為什麼這些範式對 AI 很重要

- <strong>服務相依性</strong>：AI 應用通常需要多個協調運作的服務
- <strong>安全性</strong>：API 金鑰和端點需要安全管理
- <strong>可擴充性</strong>：AI 工作負載有其獨特的擴充需求
- <strong>成本管理</strong>：若未適當配置，AI 服務可能相當昂貴

## 模組 2：部署您的第一個 AI 應用程式

### 第 2.1 步：初始化環境

1. **建立新的 AZD 環境：**
```bash
azd env new myai-workshop
```

2. **設定所需參數：**
```bash
# 設定你首選的 Azure 區域
azd env set AZURE_LOCATION eastus

# 可選：設定特定的 OpenAI 模型
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### 第 2.2 步：部署基礎架構與應用程式

1. **使用 AZD 部署：**
```bash
azd up
```

**執行 `azd up` 時會發生的事項：**
- ✅ 佈建 Microsoft Foundry Models 服務
- ✅ 建立 Cognitive Search 服務
- ✅ 為 Web 應用建立 App Service
- ✅ 設定網路與安全性
- ✅ 部署應用程式程式碼
- ✅ 設定監控與日誌

2. <strong>監控部署進度</strong> 並記錄正在建立的資源。

### 第 2.3 步：驗證您的部署

1. **檢查已部署的資源：**
```bash
azd show
```

2. **開啟已部署的應用程式：**
```bash
azd show --output json | grep "webAppUrl"
```

3. **測試 AI 功能：**
   - 導覽至 Web 應用
   - 嘗試範例查詢
   - 驗證 AI 回應是否正常

### **實驗練習 2.1：疑難排解實作**

<strong>情境</strong>：您的部署成功，但 AI 未回應。

**常見檢查項目：**
1. **OpenAI API 金鑰**：驗證是否已正確設定
2. <strong>模型可用性</strong>：檢查您所在區域是否支援該模型
3. <strong>網路連線性</strong>：確保服務之間能互相通訊
4. **RBAC 權限**：驗證應用是否能存取 OpenAI

**偵錯指令：**
```bash
# 檢查環境變數
azd env get-values

# 檢視部署日誌
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# 檢查 OpenAI 部署狀態
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## 模組 3：為您的需求客製化 AI 應用

### 第 3.1 步：修改 AI 設定

1. **更新 OpenAI 模型：**
```bash
# 更換為不同的模型（若在您所在地區可用）
azd env set AZURE_OPENAI_MODEL gpt-4.1

# 使用新配置重新部署
azd deploy
```

2. **新增其他 AI 服務：**

編輯 `infra/main.bicep` 以加入 Document Intelligence：

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

### 第 3.2 步：環境特定設定

<strong>最佳實務</strong>：開發與生產使用不同設定。

1. **建立生產環境：**
```bash
azd env new myai-production
```

2. **設定生產特定參數：**
```bash
# 生產環境通常會使用較高階的 SKU
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# 啟用額外的安全功能
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **實驗練習 3.1：成本優化**

<strong>挑戰</strong>：配置範本以達到具成本效益的開發環境。

**任務：**
1. 識別哪些 SKU 可以設為免費/基本層級
2. 為最低成本設定環境變數
3. 部署並與生產配置比較成本

**解決提示：**
- 在可能時使用 Cognitive Services 的 F0（免費）層
- 開發時對 Search Service 使用 Basic 層
- 考慮對 Functions 使用 Consumption 計畫

## 模組 4：安全性與生產最佳實務

### 第 4.1 步：安全憑證管理

<strong>目前的挑戰</strong>：許多 AI 應用將 API 金鑰硬編碼或使用不安全的儲存。

**AZD 解決方案**：Managed Identity + Key Vault 整合。

1. **檢視範本中的安全性設定：**
```bash
# 尋找金鑰保管庫及託管身分識別的設定
grep -r "keyVault\|managedIdentity" infra/
```

2. **驗證 Managed Identity 是否運作：**
```bash
# 檢查該網頁應用程式是否具有正確的身份設定
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### 第 4.2 步：網路安全

1. **啟用 private endpoints**（如果尚未設定）：

將下列加入您的 bicep 範本：
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

### 第 4.3 步：監控與可觀察性

1. **設定 Application Insights：**
```bash
# Application Insights 應該會自動設定
# 檢查設定：
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **設定 AI 專用監控：**

為 AI 操作新增自訂指標：
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

### **實驗練習 4.1：安全稽核**

<strong>任務</strong>：檢視您的部署是否符合安全最佳實務。

**檢查清單：**
- [ ] 程式碼或設定中沒有硬編碼的祕密
- [ ] 服務對服務驗證使用 Managed Identity
- [ ] Key Vault 儲存敏感設定
- [ ] 網路存取已妥善限制
- [ ] 已啟用監控與日誌

## 模組 5：轉換您自己的 AI 應用

### 第 5.1 步：評估工作表

<strong>在轉換應用程式之前</strong>，回答以下問題：

1. **應用程式架構：**
   - 您的應用程式使用哪些 AI 服務？
   - 需要哪些運算資源？
   - 是否需要資料庫？
   - 服務之間的相依性為何？

2. **安全需求：**
   - 您的應用處理哪些敏感資料？
   - 有哪些合規性的要求？
   - 是否需要私有網路？

3. **擴充需求：**
   - 預期負載為何？
   - 是否需要自動擴充？
   - 有區域性需求嗎？

### 第 5.2 步：建立您的 AZD 範本

**依據此模式轉換您的應用程式：**

1. **建立基本結構：**
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

3. **建立基礎架構範本：**

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

### **實驗練習 5.1：範本建立挑戰**

<strong>挑戰</strong>：為文件處理 AI 應用建立一個 AZD 範本。

**需求：**
- Microsoft Foundry Models 用於內容分析
- Document Intelligence 用於 OCR
- Storage Account 用於文件上傳
- Function App 用於處理邏輯
- Web app 作為使用者介面

**加分項：**
- 新增適當的錯誤處理
- 包含成本估算
- 設定監控儀表板

## 模組 6：疑難排解常見問題

### 常見部署問題

#### 問題 1：OpenAI 服務配額超出
**症狀：** 部署失敗並顯示配額錯誤  
**解決方案：**
```bash
# 檢查目前配額
az cognitiveservices usage list --location eastus

# 申請提高配額或嘗試不同地區
azd env set AZURE_LOCATION westus2
azd up
```

#### 問題 2：模型在該區域不可用
**症狀：** AI 回應失敗或模型部署錯誤  
**解決方案：**
```bash
# 按地區檢查模型可用性
az cognitiveservices model list --location eastus

# 更新為可用的模型
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### 問題 3：權限問題
**症狀：** 呼叫 AI 服務時出現 403 Forbidden 錯誤  
**解決方案：**
```bash
# 檢查角色分配
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# 新增遺漏的角色
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### 效能問題

#### 問題 4：AI 回應緩慢
**調查步驟：**
1. 檢查 Application Insights 的效能指標
2. 在 Azure 入口網站檢視 OpenAI 服務指標
3. 驗證網路連線與延遲

**解決方案：**
- 為常見查詢實作快取
- 使用適合使用情境的 OpenAI 模型
- 在高負載情況下考慮讀取複本

### **實驗練習 6.1：除錯挑戰**

<strong>情境</strong>：您的部署成功，但應用程式回傳 500 錯誤。

**除錯任務：**
1. 檢查應用程式日誌
2. 驗證服務連線
3. 測試驗證機制
4. 檢視設定

**可使用的工具：**
- `azd show` 取得部署概覽
- 在 Azure 入口網站查看詳細服務日誌
- 使用 Application Insights 取得應用程式遙測

## 模組 7：監控與優化

### 第 7.1 步：建立完整監控

1. **建立自訂儀表板：**

前往 Azure 入口網站並建立包含以下項目的儀表板：
- OpenAI 請求數與延遲
- 應用程式錯誤率
- 資源使用情況
- 成本追蹤

2. **設定警示：**
```bash
# 高錯誤率警示
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### 第 7.2 步：成本優化

1. **分析目前成本：**
```bash
# 使用 Azure CLI 取得成本資料
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **實施成本控制：**
- 設定預算警示
- 使用自動擴充策略
- 實作請求快取
- 監控 OpenAI 的 token 使用量

### **實驗練習 7.1：效能優化**

<strong>任務</strong>：優化您的 AI 應用以兼顧效能與成本。

**要改善的指標：**
- 將平均回應時間減少 20%
- 將每月成本降低 15%
- 維持 99.9% 的可用率

**可嘗試的策略：**
- 實作回應快取
- 優化提示詞以節省 token
- 使用合適的運算 SKU
- 設定適當的自動擴充

## 最終挑戰：端對端實作

### 挑戰情境

您負責建立一個生產就緒的 AI 客服聊天機器人，需求如下：

**功能性需求：**
- 提供用戶互動的 Web 介面
- 整合 Microsoft Foundry Models 以產生回應
- 使用 Cognitive Search 提供文件搜尋功能
- 與現有客戶資料庫整合
- 支援多語言

**非功能性需求：**
- 能處理 1000 名同時使用者
- 99.9% 的可用性 SLA
- SOC 2 合規
- 每月成本低於 $500
- 部署至多個環境（dev、staging、prod）

### 實作步驟

1. <strong>設計架構</strong>
2. **建立 AZD 範本**
3. <strong>實作安全措施</strong>
4. <strong>設定監控與警示</strong>
5. <strong>建立部署管線</strong>
6. <strong>撰寫解決方案文件</strong>

### 評估標準

- ✅ <strong>功能性</strong>：是否符合所有需求？
- ✅ <strong>安全性</strong>：是否實作最佳實務？
- ✅ <strong>可擴充性</strong>：能否應付負載？
- ✅ <strong>可維護性</strong>：程式與基礎架構是否有良好組織？
- ✅ <strong>成本</strong>：是否在預算內？

## 附加資源

### Microsoft 文件
- [Azure Developer CLI 文件](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models 服務文件](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry 文件](https://learn.microsoft.com/azure/ai-studio/)

### 範本示例
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App 快速入門](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat 範例](https://github.com/Azure-Samples/contoso-chat)

### 社群資源
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 完成證書

恭喜！您已完成 AI 工作坊實驗。您現在應該能夠：
- ✅ 將現有 AI 應用程式轉換為 AZD 範本
- ✅ 部署可投入生產的 AI 應用程式
- ✅ 針對 AI 工作負載實作安全最佳做法
- ✅ 監控並優化 AI 應用程式效能
- ✅ 排解常見部署問題

### 下一步
1. 將這些模式套用到您自己的 AI 專案中
2. 向社群回饋範本
3. 加入 Microsoft Foundry Discord 以獲得持續支援
4. 探索進階主題，例如多區域部署

---

<strong>工作坊回饋</strong>: 請在 [Microsoft Foundry Discord #Azure 頻道](https://discord.gg/microsoft-azure) 分享您的體驗，協助我們改進此工作坊。

---

**章節導覽:**
- **📚 課程首頁**: [AZD 初學者指南](../../README.md)
- **📖 目前章節**: 第 2 章 - AI 優先開發
- **⬅️ 上一頁**: [AI 模型部署](ai-model-deployment.md)
- **➡️ 下一頁**: [生產 AI 最佳實踐](production-ai-practices.md)
- **🚀 下一章**: [第 3 章: 設定](../chapter-03-configuration/configuration.md)

**需要幫助嗎?** 加入我們的社群以獲得關於 AZD 和 AI 部署的支援與討論。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
本文件係使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 所翻譯。雖然我們力求準確，但請注意自動翻譯可能包含錯誤或不準確之處。原始文件以其原文應被視為具權威性的來源。對於重要資訊，建議採用專業人工翻譯。我們不就因使用本翻譯而產生的任何誤解或誤譯承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->