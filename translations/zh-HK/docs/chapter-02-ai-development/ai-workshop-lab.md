# AI 工作坊實驗室：令你的 AI 解決方案可用 AZD 部署

**章節導覽:**
- **📚 課程主頁**: [AZD 初學者指南](../../README.md)
- **📖 目前章節**: 第 2 章 - 以 AI 為先的開發
- **⬅️ 上一節**: [AI 模型部署](ai-model-deployment.md)
- **➡️ 下一節**: [生產環境 AI 最佳實務](production-ai-practices.md)
- **🚀 下一章節**: [第 3 章：配置](../chapter-03-configuration/configuration.md)

## 工作坊概覽

此實作實驗室指導開發者透過 Azure Developer CLI (AZD)，從現有的 AI 模板部署應用。你將學習使用 Microsoft Foundry 服務進行生產環境 AI 部署的關鍵模式。

> **驗證說明 (2026-03-25)：** 本工作坊已針對 `azd` `1.23.12` 進行檢視。如果你本地安裝的版本較舊，請在開始前更新 AZD，以確保認證、範本和部署工作流程符合下列步驟。

**Duration:** 2-3 hours  
**Level:** Intermediate  
**Prerequisites:** Basic Azure knowledge, familiarity with AI/ML concepts

## 🎓 學習目標

By the end of this workshop, you will be able to:
- ✅ 將現有的 AI 應用轉為使用 AZD 範本
- ✅ 使用 AZD 配置 Microsoft Foundry 服務
- ✅ 為 AI 服務實作安全的憑證管理
- ✅ 部署具生產能力且含監控的 AI 應用
- ✅ 排解常見的 AI 部署問題

## 先決條件

### 必需工具
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) 已安裝
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) 已安裝
- [Git](https://git-scm.com/) 已安裝
- 程式碼編輯器（建議使用 VS Code）

### Azure 資源
- 具有貢獻者權限的 Azure 訂閱
- 可使用 Microsoft Foundry Models 服務（或可提出存取申請）
- 資源群組建立權限

### 知識先決
- 對 Azure 服務有基本了解
- 熟悉命令列介面
- 基本 AI/ML 概念（API、模型、提示）

## 實驗室設定

### 第 1 步：環境準備

1. **驗證工具是否已安裝：**
```bash
# 檢查 AZD 是否已安裝
azd version

# 檢查 Azure CLI 是否已安裝
az --version

# 登入 Azure 以用於 AZD 工作流程
azd auth login

# 只有在你打算於診斷期間執行 az 命令時，才登入 Azure CLI
az login
```

If you work across multiple tenants or your subscription is not detected automatically, retry with `azd auth login --tenant-id <tenant-id>`.

2. **複製工作坊儲存庫：**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## 模組 1：了解適用於 AI 應用的 AZD 結構

### AI AZD 範本的構成

探索 AI 就緒的 AZD 範本中的主要檔案：

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

### **實驗練習 1.1：探索配置**

1. **檢視 azure.yaml 檔案：**
```bash
cat azure.yaml
```

**檢查重點：**
- AI 元件的服務定義
- 環境變數映射
- 主機設定

2. **檢閱 main.bicep 基礎架構：**
```bash
cat infra/main.bicep
```

**要識別的主要 AI 模式：**
- Microsoft Foundry Models 服務的佈署
- Cognitive Search 整合
- 安全的金鑰管理
- 網路安全設定

### **討論重點：為何這些模式對 AI 很重要**

- <strong>服務相依性</strong>：AI 應用通常需要多個協調的服務
- <strong>安全性</strong>：API 金鑰與端點需要安全管理
- <strong>可擴充性</strong>：AI 工作負載有其獨特的擴展需求
- <strong>成本管理</strong>：若未妥善設定，AI 服務可能相當昂貴

## 模組 2：部署你的第一個 AI 應用

### 第 2.1 步：初始化環境

1. **建立新的 AZD 環境：**
```bash
azd env new myai-workshop
```

2. **設定所需參數：**
```bash
# 設定你偏好的 Azure 區域
azd env set AZURE_LOCATION eastus

# 可選：設定特定的 OpenAI 模型
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### 第 2.2 步：部署基礎架構和應用程式

1. **使用 AZD 部署：**
```bash
azd up
```

**執行 `azd up` 時會發生的事：**
- ✅ 佈署 Microsoft Foundry Models 服務
- ✅ 建立 Cognitive Search 服務
- ✅ 為 Web 應用建立 App Service
- ✅ 設定網路與安全性
- ✅ 部署應用程式程式碼
- ✅ 設定監控與日誌

2. <strong>監控部署進度</strong> 並注意正在建立的資源。

### 第 2.3 步：驗證你的部署

1. **檢查已部署的資源：**
```bash
azd show
```

2. **開啟已部署的應用：**
```bash
azd show
```

Open the web endpoint shown in the `azd show` output.

3. **測試 AI 功能：**
   - 前往 Web 應用
   - 嘗試範例查詢
   - 確認 AI 回應運作正常

### **實驗練習 2.1：排錯練習**

<strong>情境</strong>：部署成功，但 AI 未回應。

**常見檢查項目：**
1. **OpenAI API 金鑰**：確認已正確設定
2. <strong>模型可用性</strong>：檢查你的區域是否支援該模型
3. <strong>網路連線</strong>：確保服務之間能互相通訊
4. **RBAC 權限**：確認應用能存取 OpenAI

**除錯指令：**
```bash
# 檢查環境變數
azd env get-values

# 檢視部署日誌
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# 檢查 OpenAI 部署狀態
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## 模組 3：為你的需求自訂 AI 應用

### 第 3.1 步：修改 AI 配置

1. **更新 OpenAI 模型：**
```bash
# 改用其他模型（若你所在地區可用）
azd env set AZURE_OPENAI_MODEL gpt-4.1

# 以新配置重新部署
azd deploy
```

2. **新增額外的 AI 服務：**

編輯 `infra/main.bicep`，加入 Document Intelligence：

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

### 第 3.2 步：環境專屬配置

<strong>最佳實務</strong>：為開發與生產使用不同的配置。

1. **建立生產環境：**
```bash
azd env new myai-production
```

2. **設定生產專用參數：**
```bash
# 生產環境通常會使用較高的 SKU
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# 啟用額外的安全性功能
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **實驗練習 3.1：成本優化**

<strong>挑戰</strong>：為低成本開發配置範本。

**任務：**
1. 找出哪些 SKUs 可設定為免費/基礎層
2. 配置環境變數以達到最低成本
3. 部署並與生產配置比較成本

**解題提示：**
- 在可能情況下，對 Cognitive Services 使用 F0 (免費) 層
- 開發環境對 Search Service 使用 Basic 層
- 考慮對 Functions 使用 Consumption 計劃

## 模組 4：安全性與生產最佳實務

### 第 4.1 步：安全憑證管理

<strong>目前挑戰</strong>：許多 AI 應用將 API 金鑰寫死或使用不安全的儲存方式。

**AZD 解決方案**：Managed Identity + Key Vault 整合。

1. **檢視範本中的安全性設定：**
```bash
# 尋找 Key Vault 及 Managed Identity 的設定
grep -r "keyVault\|managedIdentity" infra/
```

2. **驗證 Managed Identity 是否運作：**
```bash
# 檢查網頁應用程式的身份設定是否正確
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### 第 4.2 步：網路安全

1. **啟用私有端點 (private endpoints)**（若尚未配置）：

將以下加入你的 bicep 範本：
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

### 第 4.3 步：監控與可觀測性

1. **設定 Application Insights：**
```bash
# Application Insights 應該會自動設定
# 檢查設定:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **設立 AI 專屬監控：**

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

<strong>任務</strong>：檢視你的部署是否符合安全最佳實務。

**檢查清單：**
- [ ] 程式碼或配置中沒有硬編碼的祕密
- [ ] 使用 Managed Identity 進行服務對服務的驗證
- [ ] Key Vault 儲存敏感設定
- [ ] 網路存取已適當限制
- [ ] 已啟用監控與日誌

## 模組 5：轉換你自己的 AI 應用

### 第 5.1 步：評估工作表

<strong>在轉換應用之前</strong>，回答以下問題：

1. **應用架構：**
   - 你的應用使用哪些 AI 服務？
   - 需要哪些運算資源？
   - 是否需要資料庫？
   - 服務之間有哪些相依性？

2. **安全性需求：**
   - 你的應用處理哪些敏感資料？
   - 有哪些合規性需求？
   - 是否需要私有網路？

3. **擴充需求：**
   - 預期負載為何？
   - 是否需要自動擴充？
   - 是否有地區性需求？

### 第 5.2 步：建立你的 AZD 範本

**依照此範式轉換你的應用：**

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

**infra/main.bicep** - Main template:
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

**infra/modules/openai.bicep** - OpenAI module:
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

<strong>挑戰</strong>：為文件處理的 AI 應用建立 AZD 範本。

**需求：**
- 使用 Microsoft Foundry Models 進行內容分析
- Document Intelligence 做光學字元辨識 (OCR)
- 文件上傳的 Storage Account
- 處理邏輯的 Function App
- 提供使用者介面的 Web 應用

**加分項目：**
- 加入適當的錯誤處理
- 包含成本估算
- 設定監控儀表板

## 模組 6：排解常見問題

### 常見部署問題

#### 問題 1：OpenAI 服務額度超過
**症狀：** 部署因額度錯誤失敗
**解決方法：**
```bash
# 檢查目前配額
az cognitiveservices usage list --location eastus

# 申請提高配額或嘗試其他地區
azd env set AZURE_LOCATION westus2
azd up
```

#### 問題 2：模型在該區域不可用
**症狀：** AI 回應失敗或模型部署錯誤
**解決方法：**
```bash
# 按地區檢查模型可用性
az cognitiveservices model list --location eastus

# 更新至可用模型
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### 問題 3：權限問題
**症狀：** 呼叫 AI 服務時出現 403 Forbidden 錯誤
**解決方法：**
```bash
# 檢查角色指派
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# 補上遺漏的角色
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### 效能問題

#### 問題 4：AI 回應緩慢
**調查步驟：**
1. 檢查 Application Insights 的效能指標
2. 在 Azure 入口網站檢閱 OpenAI 服務指標
3. 驗證網路連線與延遲

**解決方法：**
- 為常見查詢實作快取
- 使用適合你案例的 OpenAI 模型
- 對高負載情境考慮使用唯讀複本

### **實驗練習 6.1：除錯挑戰**

<strong>情境</strong>：部署成功，但應用回傳 500 錯誤。

**除錯任務：**
1. 檢查應用日誌
2. 驗證服務連線
3. 測試身份驗證
4. 檢閱配置

**可使用的工具：**
- `azd show` 用於部署總覽
- Azure 入口網站查看詳細服務日誌
- Application Insights 查看應用遙測

## 模組 7：監控與優化

### 第 7.1 步：設定完整監控

1. **建立自訂儀表板：**

前往 Azure 入口網站並建立包含以下項目的儀表板：
- OpenAI 請求數與延遲
- 應用錯誤率
- 資源使用情況
- 成本追蹤

2. **設定警示：**
```bash
# 高錯誤率警報
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

2. **執行成本控制：**
- 設定預算警示
- 使用自動調整配置政策
- 實作請求快取
- 監控 OpenAI 的 token 使用量

### **實驗練習 7.1：效能優化**

<strong>任務</strong>：為效能及成本優化你的 AI 應用。

**要改善的指標：**
- 將平均回應時間減少 20%
- 將每月成本降低 15%
- 維持 99.9% 正常運作時間

**可嘗試的策略：**
- 實作回應快取
- 優化提示以提升 token 效率
- 使用適當的運算 SKU
- 設定妥善的自動擴充

## 最後挑戰：端到端實作

### 挑戰情境

你的任務是建立一個具生產就緒能力的 AI 客戶服務聊天機器人，需符合以下需求：

**功能性需求：**
- 提供客戶互動的 Web 介面
- 整合 Microsoft Foundry Models 作為回應來源
- 使用 Cognitive Search 的文件搜尋功能
- 與現有客戶資料庫整合
- 多語言支援

**非功能性需求：**
- 能處理 1000 名同時使用者
- 99.9% 的可用性 SLA
- 符合 SOC 2 合規
- 每月成本低於 $500
- 部署到多個環境（dev、staging、prod）

### 實作步驟

1. 設計架構
2. 建立 AZD 範本
3. 實作安全措施
4. 設定監控與警示
5. 建立部署管線
6. 撰寫解決方案文件

### 評估準則

- ✅ <strong>功能性</strong>：是否符合所有需求？
- ✅ <strong>安全性</strong>：是否實施了最佳實務？
- ✅ <strong>可擴充性</strong>：能否應付負載？
- ✅ <strong>可維護性</strong>：程式碼與基礎架構是否易於組織與維護？
- ✅ <strong>成本</strong>：是否在預算內？

## 額外資源

### Microsoft 文件
- [Azure Developer CLI 文件](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models 服務文件](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry 文件](https://learn.microsoft.com/azure/ai-studio/)

### 範例範本
- [Microsoft Foundry 模型聊天應用程式](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI 聊天應用程式 快速入門](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso 聊天](https://github.com/Azure-Samples/contoso-chat)

### 社群資源
- [Microsoft Foundry Discord 社群](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub 倉庫](https://github.com/Azure/azure-dev)
- [Awesome AZD 模板](https://azure.github.io/awesome-azd/)

## 🎓 完成證書

恭喜！你已完成 AI 工作坊實驗。你現在應該能夠：

- ✅ 將現有 AI 應用程式轉換為 AZD 模板
- ✅ 部署可投入生產的 AI 應用程式
- ✅ 為 AI 工作負載實施安全最佳做法
- ✅ 監控並優化 AI 應用程式效能
- ✅ 疑難排解常見部署問題

### 下一步
1. 將這些模式套用到你自己的 AI 專案
2. 將模板貢獻回社群
3. 加入 Microsoft Foundry 的 Discord 獲取持續支援
4. 探索進階主題，例如多區域部署

---

<strong>工作坊回饋</strong>: 幫助我們改進此工作坊，請在 [Microsoft Foundry Discord #Azure 頻道](https://discord.gg/microsoft-azure) 分享你的經驗。

---

**章節導覽:**
- **📚 課程主頁**: [AZD 新手入門](../../README.md)
- **📖 目前章節**: 第 2 章 - 以 AI 為先的開發
- **⬅️ 上一章**: [AI 模型部署](ai-model-deployment.md)
- **➡️ 下一章**: [生產 AI 最佳實務](production-ai-practices.md)
- **🚀 下一章節**: [第 3 章：組態](../chapter-03-configuration/configuration.md)

**需要協助嗎？** 加入我們的社群，獲取有關 AZD 與 AI 部署的支援與討論。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**:
本文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們力求準確，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文件的原文應被視為具權威性的版本。若涉及重要資訊，建議使用專業人工翻譯。我們不對因使用本翻譯而引致的任何誤解或錯誤詮釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->