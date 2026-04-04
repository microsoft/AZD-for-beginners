# AI 工作坊實作室：讓您的 AI 解決方案可用 AZD 部署

**章節導航：**
- **📚 課程首頁**：[AZD For Beginners](../../README.md)
- **📖 當前章節**：第 2 章 - AI 優先開發
- **⬅️ 前一章**：[AI 模型部署](ai-model-deployment.md)
- **➡️ 下一章**：[生產 AI 最佳實踐](production-ai-practices.md)
- **🚀 下一章節**：[第 3 章：設定](../chapter-03-configuration/configuration.md)

## 工作坊概述

此動手實作實驗室引導開發者瞭解如何使用 Azure Developer CLI (AZD) 來部署現有的 AI 範本。您將學習使用 Microsoft Foundry 服務進行生產 AI 部署的關鍵模式。

> **驗證備註 (2026-03-25)：** 本工作坊已根據 `azd` 版本 `1.23.12` 進行審核。如果您的本地版本較舊，請在開始前更新 AZD，確保驗證、範本及部署流程與下述步驟一致。

**所需時間：** 2-3 小時  
**程度：** 中階  
**先備知識：** 基本 Azure 知識，熟悉 AI/ML 概念

## 🎓 學習目標

完成本工作坊後，您將能夠：
- ✅ 將現有 AI 應用程式轉換為使用 AZD 範本
- ✅ 使用 AZD 設定 Microsoft Foundry 服務
- ✅ 實作 AI 服務的安全認證管理
- ✅ 部署具備監控功能的生產級 AI 應用程式
- ✅ 排除常見 AI 部署問題

## 先備條件

### 必要工具
- 已安裝 [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- 已安裝 [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli)
- 已安裝 [Git](https://git-scm.com/)
- 程式碼編輯器 (推薦使用 VS Code)

### Azure 資源
- 具備貢獻者權限的 Azure 訂閱
- 可存取 Microsoft Foundry Models 服務（或能申請存取）
- 有建立資源群組的權限

### 知識先備
- 基本 Azure 服務理解
- 熟悉命令列介面
- 基本 AI/ML 概念（API、模型、提示詞）

## 實驗室環境設定

### 第一步：環境準備

1. **確認工具安裝：**
```bash
# 檢查 AZD 安裝
azd version

# 檢查 Azure CLI
az --version

# 為 AZD 工作流程登入 Azure
azd auth login

# 只有在您計劃在診斷期間執行 az 指令時，才登入 Azure CLI
az login
```

如果您跨多個租戶工作或訂閱無法自動偵測，請使用 `azd auth login --tenant-id <tenant-id>` 重新登入。

2. **複製工作坊程式庫：**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## 模組 1：了解 AI 應用程式的 AZD 結構

### AI AZD 範本架構解析

探索 AI 專用 AZD 範本中的關鍵檔案：

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

### **實作練習 1.1：探索設定**

1. **查看 azure.yaml 檔案：**
```bash
cat azure.yaml
```

**重點檢查：**
- AI 組件的服務定義
- 環境變數對應設定
- 主機設定

2. **檢視 main.bicep 基礎架構：**
```bash
cat infra/main.bicep
```

**要辨識的關鍵 AI 模式：**
- Microsoft Foundry Models 服務佈署
- 認知搜尋整合
- 安全密鑰管理
- 網路安全配置

### **討論重點：這些模式為何對 AI 重要**

- <strong>服務依賴性</strong>：AI 應用程式通常需求多個協調服務
- <strong>安全性</strong>：API 金鑰與端點需妥善保護
- <strong>擴展性</strong>：AI 工作負載有獨特的擴展需求
- <strong>成本管理</strong>：若配置不當，AI 服務成本可能過高

## 模組 2：部署您的第一個 AI 應用程式

### 第 2.1 步：初始化環境

1. **建立新的 AZD 環境：**
```bash
azd env new myai-workshop
```

2. **設定必要參數：**
```bash
# 設定您偏好的 Azure 區域
azd env set AZURE_LOCATION eastus

# 選填：設定特定的 OpenAI 模型
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### 第 2.2 步：部署基礎架構與應用程式

1. **使用 AZD 部署：**
```bash
azd up
```

**`azd up` 過程中發生什麼：**
- ✅ 佈署 Microsoft Foundry Models 服務
- ✅ 建立認知搜尋服務
- ✅ 設定應用服務以承載 Web 應用程式
- ✅ 配置網路與安全設定
- ✅ 部署應用程式程式碼
- ✅ 設置監控與日誌功能

2. <strong>監控部署進度</strong> 並留意正在建立的資源。

### 第 2.3 步：驗證您的部署

1. **檢查已部署的資源：**
```bash
azd show
```

2. **開啟已部署的應用程式：**
```bash
azd show
```

請開啟 `azd show` 輸出中顯示的 Web 端點。

3. **測試 AI 功能：**
   - 瀏覽至 Web 應用程式
   - 嘗試範例查詢
   - 確認 AI 回應正常

### **實作練習 2.1：除錯練習**

<strong>情境</strong>：部署成功，但 AI 無法回應。

**常見檢查項目：**
1. **OpenAI API 金鑰**：確認設定正確
2. <strong>模型可用性</strong>：確認區域是否支援該模型
3. <strong>網路連線</strong>：確保服務間通信正常
4. **RBAC 權限**：確認應用程式能存取 OpenAI

**除錯指令：**
```bash
# 檢查環境變數
azd env get-values

# 查看部署日誌
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# 檢查 OpenAI 部署狀態
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## 模組 3：依需求自訂 AI 應用程式

### 第 3.1 步：修改 AI 設定

1. **更新 OpenAI 模型：**
```bash
# 更改為不同的模型（如果您的地區有提供）
azd env set AZURE_OPENAI_MODEL gpt-4.1

# 以新配置重新部署
azd deploy
```

2. **新增額外 AI 服務：**

編輯 `infra/main.bicep` 以新增文件智慧：

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

### 第 3.2 步：區域特定設定

<strong>最佳實踐</strong>：為開發與生產環境設不同配置。

1. **建立生產環境：**
```bash
azd env new myai-production
```

2. **設定生產環境專用參數：**
```bash
# 生產通常使用較高的SKU
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# 啟用額外的安全功能
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **實作練習 3.1：成本優化**

<strong>挑戰</strong>：配置範本以達到開發成本效益。

**任務：**
1. 識別哪些 SKU 可設為免費/基本層
2. 配置環境變數以降低成本
3. 部署並與生產設定作成本比較

**提示方案：**
- 盡量使用 Cognitive Services 的 F0（免費）層
- 開發階段使用搜尋服務的 Basic 階層
- 考慮 Functions 的用量計費方案

## 模組 4：安全性及生產最佳實踐

### 第 4.1 步：安全認證管理

<strong>現行挑戰</strong>：許多 AI 應用程式硬編碼 API 金鑰或使用不安全儲存。

**AZD 解決方案**：使用受管理身分與 Key Vault 整合。

1. **查看範本中的安全設定：**
```bash
# 尋找金鑰保管庫與受管理身份配置
grep -r "keyVault\|managedIdentity" infra/
```

2. **確認受管理身分功能運作正常：**
```bash
# 檢查網頁應用程式是否具有正確的身分設定
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### 第 4.2 步：網路安全

1. <strong>啟用私用端點</strong>（如果尚未配置）：

加入您的 bicep 範本：
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

1. **配置 Application Insights：**
```bash
# Application Insights 應該自動配置
# 檢查配置：
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **設定 AI 專屬監控：**

新增 AI 操作的自訂指標：
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

### **實作練習 4.1：安全稽核**

<strong>任務</strong>：檢視您的部署是否符合安全最佳實踐。

**檢查清單：**
- [ ] 程式碼或設定中無硬編碼的密鑰
- [ ] 使用受管理身分進行服務間驗證
- [ ] Key Vault 存放敏感設定
- [ ] 網路存取適當限制
- [ ] 已啟用監控與日誌

## 模組 5：轉換您自己的 AI 應用程式

### 第 5.1 步：評估工作表

**轉換 App 前，回答以下問題：**

1. **應用架構：**
   - 您的 App 使用哪些 AI 服務？
   - 需要哪些運算資源？
   - 需要資料庫嗎？
   - 服務彼此間有哪些依賴？

2. **安全需求：**
   - 您的 App 處理哪些敏感資料？
   - 有哪些合規要求？
   - 需要私有網路嗎？

3. **擴展需求：**
   - 預期負載為何？
   - 需要自動擴展嗎？
   - 有區域性需求嗎？

### 第 5.2 步：建立您的 AZD 範本

**請依此模式轉換您的 App：**

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

### **實作練習 5.1：範本建立挑戰**

<strong>挑戰</strong>：為文件處理 AI App 建立 AZD 範本。

**需求：**
- 使用 Microsoft Foundry Models 進行內容分析
- 使用文件智慧進行 OCR
- 儲存帳戶用於文件上傳
- Function App 負責處理邏輯
- Web App 提供使用者介面

**加分項：**
- 加入完善錯誤處理
- 包含成本估算
- 建置監控儀表板

## 模組 6：排除常見問題

### 常見部署問題

#### 問題 1：OpenAI 服務配額超過
**症狀：** 部署失敗並出現配額錯誤  
**解決方案：**
```bash
# 檢查當前配額
az cognitiveservices usage list --location eastus

# 請求增加配額或嘗試不同的區域
azd env set AZURE_LOCATION westus2
azd up
```

#### 問題 2：模型在區域不可用
**症狀：** AI 回應失敗或模型部署錯誤  
**解決方案：**
```bash
# 檢查地區的模型可用性
az cognitiveservices model list --location eastus

# 更新為可用的模型
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### 問題 3：權限問題
**症狀：** 呼叫 AI 服務時出現 403 禁止存取錯誤  
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
1. 檢查 Application Insights 性能指標
2. 查看 Azure 入口網站中的 OpenAI 服務指標
3. 確認網路連通性與延遲

**解決方案：**
- 對常見查詢實作快取
- 使用適合您用例的 OpenAI 模型
- 考慮高負載時使用讀取副本

### **實作練習 6.1：除錯挑戰**

<strong>情境</strong>：部署成功，但應用回傳 500 錯誤。

**除錯任務：**
1. 檢查應用程式日誌
2. 驗證服務連線
3. 測試認證機制
4. 檢閱設定內容

**可利用工具：**
- 使用 `azd show` 查看部署概況
- 透過 Azure 入口網站查詢服務日誌
- 使用 Application Insights 追蹤應用遙測

## 模組 7：監控與優化

### 第 7.1 步：建立全面監控

1. **建立自訂儀表板：**

前往 Azure 入口網站並建立包含以下項目的儀表板：
- OpenAI 請求數量與延遲
- 應用錯誤率
- 資源使用率
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

1. **分析當前成本：**
```bash
# 使用 Azure CLI 取得成本資料
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **實施成本控制：**
- 設定預算警示
- 使用自動擴展政策
- 實作請求快取
- 監控 OpenAI 代幣使用量

### **實作練習 7.1：效能優化**

<strong>任務</strong>：優化您的 AI 應用，改善效能與成本。

**指標目標：**
- 平均回應時間降低 20%
- 月度成本降低 15%
- 維持 99.9% 正常運作時間

**嘗試策略：**
- 實施回應快取
- 優化提示詞以提升代幣效率
- 選用適當的運算 SKU
- 設定正確的自動擴展氣規則

## 最終挑戰：端到端實作

### 挑戰情境

您被指派創建一個生產級、AI 驅動的客戶服務聊天機器人，需求如下：

**功能需求：**
- 網頁介面供客戶互動
- 整合 Microsoft Foundry Models 以產生回應
- 使用認知搜尋進行文件搜尋
- 與現有客戶資料庫整合
- 支援多語言

**非功能需求：**
- 支援 1000 名並發使用者
- 99.9% 正常運作時間 SLA
- SOC 2 合規
- 每月成本低於 500 美元
- 部署於多個環境（開發、測試、生產）

### 實作步驟

1. <strong>設計架構</strong>
2. **建立 AZD 範本**
3. <strong>實作安全措施</strong>
4. <strong>設定監控與警示</strong>
5. <strong>建立部署管線</strong>
6. <strong>撰寫解決方案文件</strong>

### 評估標準

- ✅ <strong>功能性</strong>：是否符合所有需求？
- ✅ <strong>安全性</strong>：是否實施最佳實務？
- ✅ <strong>擴展性</strong>：能否承受負載？
- ✅ <strong>可維護性</strong>：程式碼及基礎架構是否良好組織？
- ✅ <strong>成本</strong>：是否符合預算？

## 附加資源

### Microsoft 文件
- [Azure Developer CLI 文件](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models 服務文件](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry 文件](https://learn.microsoft.com/azure/ai-studio/)

### 範例範本
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### 社群資源
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 完成證書

恭喜！您已完成 AI 工作坊實驗。您現在應該能夠：

- ✅ 將現有 AI 應用程式轉換為 AZD 範本
- ✅ 部署生產就緒的 AI 應用程式
- ✅ 為 AI 工作負載實作安全最佳做法
- ✅ 監控並優化 AI 應用程式效能
- ✅ 疑難排解一般部署問題

### 下一步驟
1. 將這些模式應用於您自己的 AI 專案
2. 將範本回饋給社群
3. 加入 Microsoft Foundry Discord 獲得持續支援
4. 探索進階主題，例如多區域部署

---

<strong>工作坊回饋</strong>：透過在 [Microsoft Foundry Discord #Azure 頻道](https://discord.gg/microsoft-azure) 分享您的體驗，幫助我們改進此工作坊。

---

**章節導覽：**
- **📚 課程首頁**: [AZD 初學者指南](../../README.md)
- **📖 本章節**: 第二章 - AI 優先開發
- **⬅️ 上一章**: [AI 模型部署](ai-model-deployment.md)
- **➡️ 下一章**: [生產 AI 最佳實務](production-ai-practices.md)
- **🚀 下一章節**: [第三章：設定](../chapter-03-configuration/configuration.md)

**需要幫助？** 加入我們的社群，取得關於 AZD 與 AI 部署的支援和討論。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：  
本文件係使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們盡力確保準確性，但請注意自動翻譯可能包含錯誤或不準確之處。原始文件之母語版本應被視為權威來源。對於關鍵資訊，建議使用專業人工翻譯。我們不對因使用此翻譯所引起的任何誤解或錯誤解釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->