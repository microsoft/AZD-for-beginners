# AI 工作坊實驗室：使您的 AI 解決方案可用 AZD 部署

**章節導航：**
- **📚 課程首頁**: [AZD 入門](../../README.md)
- **📖 本章節**: 第二章 - AI 優先開發
- **⬅️ 上一章**: [AI 模型部署](ai-model-deployment.md)
- **➡️ 下一章**: [生產 AI 最佳實踐](production-ai-practices.md)
- **🚀 下一章節**: [第三章：配置](../chapter-03-configuration/configuration.md)

## 工作坊概述

此實作實驗室將指導開發人員如何利用 Azure Developer CLI (AZD) 從現有 AI 範本進行部署。您將學習使用 Microsoft Foundry 服務進行生產 AI 部署的基本模式。

> **驗證說明（2026-07-13）：** 此工作坊已針對 `azd` `1.27.1` 版本進行檢視。若您的本地安裝版本較舊，請於開始前更新 AZD，確保認證、範本與部署流程與以下步驟一致。

**時長：** 2-3 小時  
**難度：** 中階  
**先決條件：** 基本 Azure 知識，熟悉 AI/ML 概念

## 🎓 學習目標

完成本工作坊後，您將能夠：
- ✅ 將現有 AI 應用轉換為使用 AZD 範本
- ✅ 使用 AZD 配置 Microsoft Foundry 服務
- ✅ 實作 AI 服務的安全憑證管理
- ✅ 部署具監控功能的生產就緒 AI 應用
- ✅ 疏解常見 AI 部署問題

## 先決條件

### 所需工具
- 安裝 [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- 安裝 [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli)
- 安裝 [Git](https://git-scm.com/)
- 程式碼編輯器（建議 VS Code）

### Azure 資源
- 擁有貢獻者存取權的 Azure 訂閱
- 可使用 Microsoft Foundry Models 服務（或能申請使用權）
- 資源群組建立權限

### 知識先決條件
- 基本 Azure 服務認識
- 熟悉命令列介面
- 基本 AI/ML 概念（API、模型、提示）

## 實驗室環境設定

### 第一步：環境準備

1. **驗證工具安裝：**
```bash
# 檢查 AZD 安裝
azd version

# 檢查 Azure CLI
az --version

# 登入 Azure 以進行 AZD 工作流程
azd auth login

# 只有在診斷過程中計劃執行 az 命令時才登入 Azure CLI
az login
```

若您跨多個租戶工作或訂閱未自動偵測，請使用 `azd auth login --tenant-id <tenant-id>` 重新登入。

2. **複製工作坊版本庫：**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## 模組 1：了解 AI 應用的 AZD 結構

### AI AZD 範本結構解析

探索 AI 專用 AZD 範本的主要檔案：

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

### **實驗練習 1.1：探索配置檔**

1. **檢視 azure.yaml 檔案：**
```bash
cat azure.yaml
```

**關注重點：**
- AI 元件的服務定義
- 環境變數對應
- 主機配置

2. **檢視 main.bicep 基礎建設：**
```bash
cat infra/main.bicep
```

**需識別的關鍵 AI 模式：**
- Microsoft Foundry Models 服務佈署
- Azure AI 搜尋整合
- 安全金鑰管理
- 網路安全設定

### **討論點：這些模式為什麼對 AI 重要**

- <strong>服務依賴</strong>：AI 應用通常需要多個協調服務
- <strong>安全性</strong>：API 金鑰和端點需安全管理
- <strong>可擴展性</strong>：AI 負載有獨特的擴展需求
- <strong>成本管理</strong>：AI 服務若未妥善配置可能花費昂貴

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
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### 步驟 2.2：部署基礎架構與應用

1. **使用 AZD 部署：**
```bash
azd up
```

**`azd up` 過程中發生的事：**
- ✅ 部署 Microsoft Foundry Models 服務
- ✅ 建立 Azure AI 搜尋服務
- ✅ 配置網頁應用的 App Service
- ✅ 設定網路與安全性
- ✅ 部署應用程式程式碼
- ✅ 設定監控和日誌

2. <strong>監控部署進度</strong>，留意正在建立的資源。

### 步驟 2.3：驗證您的部署

1. **檢視已部署的資源：**
```bash
azd show
```

2. **開啟已部署的應用：**
```bash
azd show
```

打開 `azd show` 輸出中顯示的網頁端點。

3. **測試 AI 功能：**
   - 造訪網頁應用
   - 試用範例查詢
   - 確認 AI 回應正常

### **實驗練習 2.1：疑難排解練習**

**情境：** 部署成功但 AI 沒有回應。

**常見檢查項目：**
1. **OpenAI API 金鑰**：確認設定正確
2. <strong>模型可用性</strong>：檢查該區域是否支援模型
3. <strong>網路連線</strong>：確保服務間可正常通訊
4. **RBAC 權限**：確認應用可存取 OpenAI

**偵錯指令：**
```bash
# 檢查環境變數
azd env get-values

# 檢視部署日誌
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# 檢查 OpenAI 部署狀態
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## 模組 3：客製化您的 AI 應用

### 步驟 3.1：修改 AI 配置

1. **更新 OpenAI 模型：**
```bash
# 更改為不同的模型（如果您所在地區有提供）
azd env set AZURE_OPENAI_MODEL gpt-4.1

# 使用新的配置重新部署
azd deploy
```

2. **新增其他 AI 服務：**

編輯 `infra/main.bicep` 新增文件智慧服務：

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

### 步驟 3.2：針對環境的特定配置

**最佳實踐：** 開發環境與生產環境應有區別配置。

1. **建立生產環境：**
```bash
azd env new myai-production
```

2. **設定生產專用參數：**
```bash
# 產品通常使用較高的 SKU
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# 啟用額外的安全功能
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **實驗練習 3.1：成本優化**

**挑戰：** 配置範本以達成開發成本效益。

**任務：**
1. 識別可設定為免費/基礎方案的 SKU
2. 配置環境變數以降低成本
3. 部署並與生產配置成本比較

**解決提示：**
- 儘可能使用 Azure AI 服務的 F0（免費）方案
- 開發時使用搜尋服務的基礎方案
- 考慮使用消耗方案功能

## 模組 4：安全與生產最佳實踐

### 步驟 4.1：安全憑證管理

**當前挑戰：** 許多 AI 應用硬編碼 API 金鑰或使用不安全儲存方式。

**AZD 解決方案：** 管理身份與金鑰保管庫整合。

1. **檢視範本中的安全配置：**
```bash
# 尋找金鑰庫及管理身分識別配置
grep -r "keyVault\|managedIdentity" infra/
```

2. **確認管理身份運作正常：**
```bash
# 檢查網頁應用程式是否有正確的身分識別設定
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### 步驟 4.2：網路安全

1. <strong>啟用私有端點</strong>（若尚未配置）：

在您的 bicep 範本中新增：
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
# Application Insights 應該自動配置
# 檢查配置：
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **建立 AI 特定監控：**

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

### **實驗練習 4.1：安全審核**

**任務：** 檢查您的部署是否符合安全最佳實踐。

**檢查清單：**
- [ ] 代碼或配置中無硬編碼祕密
- [ ] 服務間認證使用管理身份
- [ ] 使用金鑰保管庫儲存敏感設定
- [ ] 適當限制網路訪問
- [ ] 啟用監控與日誌

## 模組 5：轉換您自己的 AI 應用

### 步驟 5.1：評估工作表

**在轉換您的應用之前，回答以下問題：**

1. **應用架構：**
   - 您的應用使用哪些 AI 服務？
   - 需要哪些計算資源？
   - 是否需要資料庫？
   - 服務間有哪些依賴？

2. **安全需求：**
   - 您的應用處理哪些敏感資料？
   - 有哪些合規需求？
   - 是否需要私有網路？

3. **擴展需求：**
   - 預期負載是多少？
   - 是否需要自動擴縮？
   - 有區域性需求嗎？

### 步驟 5.2：建立您的 AZD 範本

**依此模式轉換您的應用：**

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

3. **建立基礎建設範本：**

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

**挑戰：** 為文件處理 AI 應用建立 AZD 範本。

**需求：**
- Microsoft Foundry Models 用於內容分析
- 文件智慧服務用於 OCR
- 儲存帳戶用於文件上傳
- Function App 用於處理邏輯
- 用戶介面的網頁應用

**額外加分項：**
- 加入適當的錯誤處理
- 包含成本估算
- 設置監控儀表板

## 模組 6：常見問題排解

### 常見部署問題

#### 問題 1：OpenAI 服務配額超過
**症狀：** 部署失敗並顯示配額錯誤
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
# 按地區檢查模型可用性
az cognitiveservices model list --location eastus

# 更新至可用模型
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### 問題 3：權限問題
**症狀：** 呼叫 AI 服務時出現 403 Forbidden 錯誤
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
1. 檢查 Application Insights 中的效能指標
2. 查看 Azure 入口網站上的 OpenAI 服務指標
3. 確認網路連通性與延遲

**解決方案：**
- 為常見查詢實作快取
- 使用適合的 OpenAI 模型
- 在高流量場景考慮讀取副本

### **實驗練習 6.1：偵錯挑戰**

**情境：** 部署成功，但應用返回 500 錯誤。

**偵錯任務：**
1. 檢查應用日誌
2. 確認服務連通性
3. 測試認證機制
4. 檢視配置

**可使用工具：**
- `azd show` 查看部署概況
- Azure 入口網站檢視服務日誌
- Application Insights 查看應用遙測

## 模組 7：監控與優化

### 步驟 7.1：建立全面監控

1. **建立自訂儀表板：**

前往 Azure 入口網站創建包含以下內容的儀表板：
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

### 步驟 7.2：成本優化

1. **分析當前成本：**
```bash
# 使用 Azure CLI 獲取成本數據
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **實作成本控制：**
- 設定預算警示
- 使用自動擴縮策略
- 實作請求快取
- 監控 OpenAI 代幣使用

### **實驗練習 7.1：效能優化**

**任務：** 優化您的 AI 應用的效能與成本。

**改進指標：**
- 平均回應時間降低 20%
- 月度成本降低 15%
- 維持 99.9% 運行時間

**嘗試策略：**
- 實作回應快取
- 優化提示減少代幣消耗
- 使用適合的計算 SKU
- 設定適當的自動擴縮

## 最終挑戰：端到端實作

### 挑戰情境

您的任務是建立一個生產就緒的 AI 客戶服務聊天機器人，需求如下：

**功能需求：**
- 提供客戶互動的網頁介面
- 與 Microsoft Foundry Models 回應整合
- 使用 Azure AI 搜尋進行文件搜尋
- 整合現有客戶資料庫
- 支援多語言

**非功能需求：**
- 支持 1000 名同時使用者
- 99.9% 運行時間 SLA
- SOC 2 合規性
- 成本低於 500 美元/月
- 部署於多種環境（開發、測試、生產）

### 實施步驟

1. <strong>設計架構</strong>
2. **建立 AZD 範本**
3. <strong>實作安全措施</strong>
4. <strong>設定監控與警示</strong>
5. <strong>建立部署管線</strong>
6. <strong>紀錄方案</strong>

### 評估標準

- ✅ <strong>功能性</strong>：是否符合所有需求？
- ✅ <strong>安全性</strong>：是否實作最佳做法？
- ✅ <strong>擴展性</strong>：能否應付負載？
- ✅ <strong>可維護性</strong>：程式碼與基礎建設是否組織良好？
- ✅ <strong>成本</strong>：是否在預算範圍內？

## 其他資源

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

恭喜你！你已完成 AI 工作坊實驗室。你現在應該可以：

- ✅ 將現有 AI 應用程式轉換為 AZD 範本
- ✅ 部署生產就緒的 AI 應用程式
- ✅ 實施 AI 工作負載的安全最佳實務
- ✅ 監控與優化 AI 應用程式效能
- ✅ 疑難排解常見部署問題

### 下一步
1. 將這些模式應用於你自己的 AI 專案
2. 將範本回饋給社群
3. 加入 Microsoft Foundry Discord 以獲取持續支援
4. 探索多區域部署等進階主題

---

<strong>工作坊回饋</strong>：請在 [Microsoft Foundry Discord #Azure 頻道](https://discord.gg/microsoft-azure) 分享你的體驗，幫助我們改進此工作坊。

---

**章節導航：**
- **📚 課程首頁**: [AZD 初學者指南](../../README.md)
- **📖 目前章節**: 第二章 - AI 優先開發
- **⬅️ 前一章節**: [AI 模型部署](ai-model-deployment.md)
- **➡️ 下一章節**: [生產 AI 最佳實務](production-ai-practices.md)
- **🚀 下一章**: [第三章：設定](../chapter-03-configuration/configuration.md)

**需要協助？** 加入我們的社群，一起討論 AZD 和 AI 部署相關支援。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件由 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻譯而成。雖然我們致力於確保準確性，但請注意，機器自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議進行專業人工翻譯。我們不對因使用本翻譯而產生的任何誤解或誤釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->