# AI 工作坊實驗室：讓您的 AI 解決方案可用 AZD 部署

**章節導航：**
- **📚 課程首頁**：[AZD For Beginners](../../README.md)
- **📖 當前章節**：第 2 章 - AI-First 開發
- **⬅️ 上一章**：[AI 模型部署](ai-model-deployment.md)
- **➡️ 下一章**：[生產環境 AI 最佳實踐](production-ai-practices.md)
- **🚀 下一章節**：[第 3 章：配置](../chapter-03-configuration/configuration.md)

## 工作坊概述

本實作實驗室引導開發者完成將現有 AI 範本使用 Azure Developer CLI (AZD) 部署的流程。您將學習使用 Microsoft Foundry 服務進行生產環境 AI 部署的關鍵模式。

> **驗證備註（2026-03-25）：** 本工作坊已針對 `azd` `1.23.12` 版本進行測試。如您本機安裝的版本較舊，請先更新 AZD，以確保認證、範本及部署工作流程與本文步驟相符。

**時長：** 2-3 小時  
**等級：** 中階  
**先決條件：** 基本 Azure 知識，熟悉 AI/ML 概念

## 🎓 學習目標

完成本工作坊後，您將能夠：
- ✅ 將現有 AI 應用轉換使用 AZD 範本
- ✅ 使用 AZD 配置 Microsoft Foundry 服務
- ✅ 實作 AI 服務的安全憑證管理
- ✅ 部署具備監控功能的生產級 AI 應用
- ✅ 排解常見 AI 部署問題

## 先決條件

### 必備工具
- 安裝 [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- 安裝 [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli)
- 安裝 [Git](https://git-scm.com/)
- 代碼編輯器（建議使用 VS Code）

### Azure 資源
- 擁有具備參與者（contributor）權限的 Azure 訂閱
- 具備 Microsoft Foundry Models 服務存取權限（或可申請存取）
- 資源群組建立權限

### 知識先備
- 基本 Azure 服務理解
- 熟悉命令列介面操作
- 基本 AI/ML 概念（API、模型、提示）

## 實驗室設定

### 第 1 步：環境準備

1. **確認工具安裝：**
```bash
# 檢查 AZD 安裝
azd version

# 檢查 Azure CLI
az --version

# 登入 Azure 以進行 AZD 工作流程
azd auth login

# 只有在計劃於診斷期間執行 az 命令時，才登入 Azure CLI
az login
```

如您跨多個租戶工作或系統未自動偵測到訂閱，可使用 `azd auth login --tenant-id <tenant-id>` 重新登入。

2. **複製工作坊代碼庫：**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## 模組 1：了解 AI 應用的 AZD 結構

### AI AZD 範本結構解析

探索 AI 準備就緒 AZD 範本中的關鍵檔案：

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Microsoft Foundry Models configuration
│       ├── search.bicep    # Azure AI Search setup
│       └── webapp.bicep    # Web app configuration
├── app/                    # Application code
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

### **實作練習 1.1：探索設定**

1. **檢查 azure.yaml 檔案：**
```bash
cat azure.yaml
```

**注意事項：**
- AI 元件的服務定義
- 環境變數對映
- 主機配置

2. **檢視 main.bicep 基礎結構：**
```bash
cat infra/main.bicep
```

**應識別的關鍵 AI 模式：**
- Microsoft Foundry Models 服務配置
- Azure AI 搜尋整合
- 安全金鑰管理
- 網路安全配置

### **討論焦點：為什麼這些模式對 AI 重要**

- <strong>服務依賴性</strong>：AI 應用通常需要多個協同服務
- <strong>安全性</strong>：API 金鑰及端點需安全管理
- <strong>可擴展性</strong>：AI 負載具有獨特的擴展需求
- <strong>成本管理</strong>：AI 服務若未妥善配置，可能成本高昂

## 模組 2：部署您的第一個 AI 應用

### 第 2.1 步：初始化環境

1. **建立新的 AZD 環境：**
```bash
azd env new myai-workshop
```

2. **設定必要參數：**
```bash
# 設定你偏好的 Azure 地區
azd env set AZURE_LOCATION eastus

# 選擇性：設定特定的 OpenAI 模型
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### 第 2.2 步：部署基礎架構與應用

1. **使用 AZD 部署：**
```bash
azd up
```

**`azd up` 的流程說明：**
- ✅ 預配 Microsoft Foundry Models 服務
- ✅ 建立 Azure AI 搜尋服務
- ✅ 設置 Web 應用服務
- ✅ 配置網路及安全性
- ✅ 部署應用程式碼
- ✅ 建立監控與日誌機制

2. <strong>監控部署進度</strong>，並留意建立的資源。

### 第 2.3 步：驗證部署結果

1. **檢查已部署資源：**
```bash
azd show
```

2. **開啟已部署的應用程式：**
```bash
azd show
```

開啟 `azd show` 輸出所示的網頁端點。

3. **測試 AI 功能：**
   - 瀏覽應用網頁
   - 嘗試範例查詢
   - 驗證 AI 回應是否正常

### **實作練習 2.1：疑難排解實務**

<strong>情境</strong>：部署成功但 AI 無回應。

**常見問題檢查：**
1. **OpenAI API 金鑰**：確認是否設定正確
2. <strong>模型可用性</strong>：檢查地區是否支援模型
3. <strong>網路連通性</strong>：確認服務間通訊是否正常
4. **RBAC 權限**：確保應用有權限存取 OpenAI

**偵錯指令：**
```bash
# 檢查環境變數
azd env get-values

# 查看部署日誌
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# 檢查 OpenAI 部署狀態
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## 模組 3：依需求客製化 AI 應用

### 第 3.1 步：修改 AI 設定

1. **更新 OpenAI 模型：**
```bash
# 換成另一個模型（如果你地區有提供）
azd env set AZURE_OPENAI_MODEL gpt-4.1

# 以新配置重新部署
azd deploy
```

2. **新增其他 AI 服務：**

編輯 `infra/main.bicep` 新增文件智慧（Document Intelligence）：

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

<strong>最佳實務</strong>：開發與生產環境應分別配置設定。

1. **建立生產環境：**
```bash
azd env new myai-production
```

2. **設定生產專用參數：**
```bash
# 生產環境通常使用較高的SKU
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# 啟用額外的安全功能
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **實作練習 3.1：成本優化**

<strong>挑戰</strong>：配置為成本效益良好的開發環境。

**任務：**
1. 識別可設為免費/基本層級的 SKU
2. 設定環境變數以降低成本
3. 部署並與生產設定成本做比較

**提示：**
- 儘可能使用 Azure AI 服務的 F0（免費）層
- 開發時使用搜尋服務的 Basic 層
- 考慮 Functions 使用 Consumption 計劃

## 模組 4：安全性及生產最佳實務

### 第 4.1 步：安全憑證管理

<strong>現有挑戰</strong>：許多 AI 應用硬編碼 API 金鑰或使用不安全的儲存方式。

**AZD 解決方案**：管理身分 + Key Vault 整合。

1. **複查範本中的安全性配置：**
```bash
# 搜尋 Key Vault 及受管理身份配置
grep -r "keyVault\|managedIdentity" infra/
```

2. **驗證管理身分運作正常：**
```bash
# 檢查網頁應用程式是否具有正確的身份配置
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### 第 4.2 步：網路安全

1. <strong>啟用私有端點</strong>（若尚未配置）：

將以下內容加入您的 bicep 範本：
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

2. **設置 AI 專用監控：**

加入 AI 操作的自訂指標：
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

### **實作練習 4.1：安全審核**

<strong>任務</strong>：審查您的部署是否符合安全最佳實務。

**檢查表：**
- [ ] 代碼或設定中無硬編碼密鑰
- [ ] 使用管理身分進行服務間身分驗證
- [ ] Key Vault 儲存敏感設定
- [ ] 適當限制網路存取
- [ ] 啟用監控及日誌功能

## 模組 5：轉換您自己的 AI 應用

### 第 5.1 步：評估工作表

<strong>在轉換應用前</strong>，回答以下問題：

1. **應用架構：**
   - 應用使用哪些 AI 服務？
   - 需要多少運算資源？
   - 是否需要資料庫？
   - 服務間有哪些依賴關係？

2. **安全需求：**
   - 應用處理何種敏感資料？
   - 有哪些合規要求？
   - 是否需要私有網路？

3. **擴充需求：**
   - 預期負載是多少？
   - 是否需要自動擴充？
   - 有無區域性需求？

### 第 5.2 步：建立您的 AZD 範本

**依照此模式轉換您的應用：**

1. **建立基本結構：**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# 初始化 AZD 模板
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

**infra/main.bicep** - 主範本：
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

### **實作練習 5.1：範本創建挑戰**

<strong>挑戰</strong>：為文件處理 AI 應用創建 AZD 範本。

**需求：**
- 使用 Microsoft Foundry Models 進行內容分析
- 文件智慧（Document Intelligence）進行 OCR 辨識
- 儲存帳戶供文件上傳
- Functions 應用處理邏輯
- Web 應用提供使用者介面

**加分項：**
- 加入適當錯誤處理
- 包含成本估算
- 設定監控儀表板

## 模組 6：排解常見問題

### 常見部署問題

#### 問題 1：OpenAI 服務配額超額
**症狀：** 部署因配額錯誤失敗  
**解決方案：**
```bash
# 檢查當前配額
az cognitiveservices usage list --location eastus

# 請求增加配額或嘗試不同地區
azd env set AZURE_LOCATION westus2
azd up
```

#### 問題 2：所處區域無模型可用
**症狀：** AI 回應失敗或模型部署錯誤  
**解決方案：**
```bash
# 按地區檢查模型可用性
az cognitiveservices model list --location eastus

# 更新至可用模型
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### 問題 3：權限問題
**症狀：** 呼叫 AI 服務時出現 403 禁止錯誤  
**解決方案：**
```bash
# 檢查角色分配
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
1. 檢查 Application Insights 中的效能指標
2. 稽核 Azure 入口網站中 OpenAI 服務指標
3. 驗證網路連通性及延遲

**解決方案：**
- 對常見查詢實作快取
- 使用適合用例的 OpenAI 模型
- 高負載時考慮使用讀取副本

### **實作練習 6.1：偵錯挑戰**

<strong>情境</strong>：部署成功，但應用回傳 500 錯誤。

**偵錯任務：**
1. 檢查應用日誌
2. 確認服務連線
3. 測試驗證機制
4. 檢視設定內容

**可用工具：**
- `azd show` 查詢部署概況
- Azure 入口網站追蹤詳細服務日誌
- Application Insights 應用遙測

## 模組 7：監控與優化

### 第 7.1 步：建立全面監控

1. **建立自訂儀表板：**

前往 Azure 入口網站，建立儀表板，包含：
- OpenAI 請求數及延遲
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

1. **分析目前成本：**
```bash
# 使用 Azure CLI 獲取成本數據
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **執行情況控制：**
- 訂定預算警示
- 採用自動擴縮政策
- 執行請求快取
- 監控 OpenAI 代幣用量

### **實作練習 7.1：效能優化**

<strong>任務</strong>：優化 AI 應用的效能與成本。

**改善指標：**
- 平均回應時間降低 20%
- 每月成本降低 15%
- 維持 99.9% 正常運作時間

**策略建議：**
- 實作回應快取
- 優化提示以提升代幣效率
- 選用合適的計算 SKU
- 設定妥善的自動擴縮

## 期末挑戰：端對端實作

### 挑戰情境

您須打造具備以下需求的生產級 AI 客服聊天機器人：

**功能需求：**
- 提供網頁介面與客戶互動
- 整合 Microsoft Foundry Models 回應
- 具備文件搜尋功能，利用 Azure AI Search
- 整合現有客戶資料庫
- 支援多語言

**非功能需求：**
- 支援 1000 名並行用戶
- 99.9% 可用性 SLA
- SOC 2 合規
- 每月成本低於 500 美元
- 部署至多個環境（開發、測試、生產）

### 實作步驟

1. 設計架構
2. 建立 AZD 範本
3. 實作安全措施
4. 設置監控與警示
5. 建立部署管線
6. 撰寫文件說明

### 評估標準

- ✅ <strong>功能性</strong>：是否符合所有需求？
- ✅ <strong>安全性</strong>：是否遵循最佳實踐？
- ✅ <strong>擴展性</strong>：能否支援負載？
- ✅ <strong>維護性</strong>：程式碼與基礎設施是否組織良好？
- ✅ <strong>成本</strong>：是否控制在預算內？

## 額外資源

### 微軟文件
- [Azure Developer CLI 文件](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models 服務文件](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry 文件](https://learn.microsoft.com/azure/ai-studio/)

### 範本示例
- [Microsoft Foundry Models 聊天應用](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI 聊天應用快速入門](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### 社群資源
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 完成證書

恭喜！你已完成 AI 工作坊實驗室。你現在應該能夠：

- ✅ 將現有 AI 應用程式轉換成 AZD 範本
- ✅ 部署生產等級的 AI 應用程式
- ✅ 實作 AI 工作負載的安全最佳做法
- ✅ 監控並優化 AI 應用程式效能
- ✅ 解決常見的部署問題

### 下一步
1. 將這些模式應用到你自己的 AI 專案
2. 將範本回饋給社群
3. 加入 Microsoft Foundry Discord 以獲得持續支援
4. 探索多區域部署等進階主題

---

<strong>工作坊回饋</strong>：幫助我們改進此工作坊，請在 [Microsoft Foundry Discord #Azure 頻道](https://discord.gg/microsoft-azure) 分享你的體驗。

---

**章節導覽：**
- **📚 課程首頁**: [AZD For Beginners](../../README.md)
- **📖 目前章節**: 第 2 章 - AI-First 開發
- **⬅️ 上一章**: [AI 模型部署](ai-model-deployment.md)
- **➡️ 下一章**: [生產 AI 最佳實務](production-ai-practices.md)
- **🚀 下一章節**: [第 3 章：設定](../chapter-03-configuration/configuration.md)

**需要幫助？** 加入我們的社群，討論並獲得 AZD 與 AI 部署的支援。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件由 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻譯而成。雖然我們致力於確保準確性，但請注意，機器自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議進行專業人工翻譯。我們不對因使用本翻譯而產生的任何誤解或誤釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->