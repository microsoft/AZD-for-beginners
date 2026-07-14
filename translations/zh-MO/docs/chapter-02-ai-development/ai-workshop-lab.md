# AI 實驗室工作坊：讓您的 AI 解決方案可用 AZD 部署

**章節導覽：**
- **📚 課程首頁**: [AZD 初學者指南](../../README.md)
- **📖 目前章節**: 第 2 章 - AI 優先開發
- **⬅️ 前一章節**: [AI 模型部署](ai-model-deployment.md)
- **➡️ 下一章節**: [生產 AI 最佳實踐](production-ai-practices.md)
- **🚀 下一章**: [第 3 章：配置](../chapter-03-configuration/configuration.md)

## 工作坊概述

這個實作工作坊引導開發者將現有的 AI 範本利用 Azure Developer CLI (AZD) 進行部署。您將學習使用 Microsoft Foundry 服務的生產 AI 部署關鍵模式。

> **驗證備註 (2026-07-13)：** 此工作坊已於 `azd` `1.27.1` 版本上檢測過。如果您本地安裝的版本較舊，請先更新 AZD，以確保認證、範本和部署工作流程符合下列步驟。

**時間長度：** 2-3 小時  
**程度：** 中階  
**先決條件：** 具備基礎 Azure 知識，熟悉 AI/ML 概念

## 🎓 學習目標

完成本工作坊後，您將能夠：
- ✅ 將現有 AI 應用轉換為使用 AZD 範本
- ✅ 使用 AZD 配置 Microsoft Foundry 服務
- ✅ 執行 AI 服務的安全憑證管理
- ✅ 部署具備監控的生產級 AI 應用
- ✅ 排解常見的 AI 部署問題

## 先決條件

### 必備工具
- 已安裝 [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- 已安裝 [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli)
- 已安裝 [Git](https://git-scm.com/)
- 程式碼編輯器 (建議使用 VS Code)

### Azure 資源
- 具備具貢獻者權限的 Azure 訂閱
- 可存取 Microsoft Foundry Models 服務（或有申請存取權的能力）
- 有建立資源群組的權限

### 知識先決條件
- 對 Azure 服務有基本了解
- 熟悉命令列介面操作
- 基本 AI/ML 概念（API、模型、提示詞）

## 實驗室環境建立

### 第 1 步：環境準備

1. **驗證工具安裝：**
```bash
# 檢查 AZD 安裝
azd version

# 檢查 Azure CLI
az --version

# 登入 Azure 以進行 AZD 工作流程
azd auth login

# 只有在你計劃在診斷期間執行 az 命令時才登入 Azure CLI
az login
```

如果您在多個租戶間操作或訂閱無法自動偵測，請使用 `azd auth login --tenant-id <tenant-id>` 重試登入。

2. **克隆工作坊倉庫：**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## 模組 1：了解 AI 應用的 AZD 結構

### AI AZD 範本的結構解析

探索 AI 就緒 AZD 範本中的主要檔案：

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

### **實驗練習 1.1：瀏覽配置**

1. **檢視 azure.yaml 檔案：**
```bash
cat azure.yaml
```

**重點觀察：**
- AI 組件的服務定義
- 環境變數映射
- 主機設定

2. **檢閱 main.bicep 基礎架構：**
```bash
cat infra/main.bicep
```

**須識別的關鍵 AI 範式：**
- Microsoft Foundry Models 服務佈建
- Azure AI 搜尋整合
- 安全的金鑰管理
- 網路安全配置

### **討論點：這些模式為何重要**

- <strong>服務依賴</strong>：AI 應用常需多個協調服務
- <strong>安全性</strong>：API 金鑰與端點需安全管理
- <strong>擴展性</strong>：AI 工作負載有獨特的擴展需求
- <strong>成本管理</strong>：AI 服務若未適當配置可能成本高昂

## 模組 2：部署您的第一個 AI 應用

### 第 2.1 步：初始化環境

1. **建立新的 AZD 環境：**
```bash
azd env new myai-workshop
```

2. **設定必要參數：**
```bash
# 設定你喜愛的 Azure 區域
azd env set AZURE_LOCATION eastus

# 選擇性：設定特定的 OpenAI 模型
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### 第 2.2 步：部署基礎架構及應用程式

1. **使用 AZD 部署：**
```bash
azd up
```

**`azd up` 過程中發生：**
- ✅ 佈建 Microsoft Foundry Models 服務
- ✅ 建立 Azure AI 搜尋服務
- ✅ 設置 Web 應用的 App Service
- ✅ 配置網路與安全性
- ✅ 部署應用程式代碼
- ✅ 設置監控與日誌記錄

2. <strong>監控部署進度</strong>並留意建立中的資源。

### 第 2.3 步：驗證部署結果

1. **檢查已部署資源：**
```bash
azd show
```

2. **開啟已部署應用程式：**
```bash
azd show
```

開啟 `azd show` 輸出中顯示的網頁端點。

3. **測試 AI 功能：**
   - 瀏覽至網頁應用
   - 嘗試範例查詢
   - 確認 AI 回應是否正常

### **實驗練習 2.1：故障排除**

<strong>場景</strong>：部署成功，但 AI 沒有回應。

**常見檢查問題：**
1. **OpenAI API 金鑰**：確認設定正確
2. <strong>模型可用性</strong>：檢查所屬地區是否支援模型
3. <strong>網路連通性</strong>：確保服務間能夠互通
4. **RBAC 權限**：確認應用有存取 OpenAI 的權限

**除錯指令：**
```bash
# 檢查環境變量
azd env get-values

# 查看部署日誌
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# 檢查 OpenAI 部署狀態
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## 模組 3：依需求定制 AI 應用

### 第 3.1 步：修改 AI 配置

1. **更新 OpenAI 模型：**
```bash
# 更改為不同的模型（如果您所在地區有提供）
azd env set AZURE_OPENAI_MODEL gpt-4.1

# 使用新配置重新部署
azd deploy
```

2. **新增額外 AI 服務：**

編輯 `infra/main.bicep` 新增文件智能服務：

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

### 第 3.2 步：環境特定配置

<strong>最佳實踐</strong>：開發與生產採用不同配置。

1. **建立生產環境：**
```bash
azd env new myai-production
```

2. **設定生產專用參數：**
```bash
# 生產階段通常使用較高的庫存單位
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# 啟用額外的安全功能
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **實驗練習 3.1：成本優化**

<strong>挑戰</strong>：為開發環境配置成本效益最高的範本。

**任務：**
1. 確認哪些 SKU 可調整為免費/基礎等級
2. 配置環境變數以達到最低成本
3. 部署並與生產配置比較成本差異

**解決提示：**
- 儘可能使用 Azure AI Services 的 F0 (免費) 等級
- 開發時，以搜尋服務使用基礎等級
- 可考慮使用消耗式方案的函數服務

## 模組 4：安全與生產最佳實踐

### 第 4.1 步：安全憑證管理

<strong>當前挑戰</strong>：許多 AI 應用固定寫入 API 金鑰或使用不安全儲存方式。

**AZD 解決方案**：結合管理識別與 Key Vault。

1. **檢視範本中的安全配置：**
```bash
# 尋找金鑰庫及管理身份配置
grep -r "keyVault\|managedIdentity" infra/
```

2. **驗證管理識別功能：**
```bash
# 檢查網絡應用程式是否具有正確的身份配置
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### 第 4.2 步：網路安全

1. <strong>啟用私人端點</strong>（若尚未配置）：

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

### 第 4.3 步：監控與可觀測性

1. **配置 Application Insights：**
```bash
# 應用程式洞察應自動配置
# 檢查配置：
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **設置 AI 專用監控：**

新增 AI 運作的自訂指標：
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

<strong>任務</strong>：檢視您部署的安全最佳實踐落實情況。

**檢查清單：**
- [ ] 代碼或配置無硬編碼機密資訊
- [ ] 使用管理識別進行服務間驗證
- [ ] Key Vault 儲存敏感設定
- [ ] 網路存取受到適當限制
- [ ] 啟用監控與日誌記錄

## 模組 5：轉換您自己的 AI 應用程式

### 第 5.1 步：評估工作表

**在轉換應用前，回答以下問題：**

1. **應用架構：**
   - 您的應用使用了哪些 AI 服務？
   - 需要哪些運算資源？
   - 是否需要資料庫？
   - 服務間有哪些相互依賴？

2. **安全需求：**
   - 您的應用處理哪些敏感資料？
   - 有哪些合規需求？
   - 是否需要私人網路？

3. **擴展需求：**
   - 預期的負載是多少？
   - 需要自動擴展嗎？
   - 有區域限制需求嗎？

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

<strong>挑戰</strong>：為文件處理 AI 應用建立 AZD 範本。

**需求：**
- Microsoft Foundry Models 用於內容分析
- 文件智能服務做 OCR
- 用於上傳文件的儲存帳戶
- 用於處理邏輯的函數應用
- 用戶介面的 Web 應用

**加分項目：**
- 加入適當的錯誤處理
- 包含成本估算
- 設置監控儀表板

## 模組 6：常見問題排解

### 常見部署問題

#### 問題 1：OpenAI 服務配額超過
**症狀：** 部署因配額錯誤失敗
**解決方案：**
```bash
# 檢查當前配額
az cognitiveservices usage list --location eastus

# 請求配額增加或嘗試其他地區
azd env set AZURE_LOCATION westus2
azd up
```

#### 問題 2：模型在地區不可用
**症狀：** AI 回應失敗或模型部署錯誤
**解決方案：**
```bash
# 按區域檢查模型可用性
az cognitiveservices model list --location eastus

# 更新為可用的模型
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### 問題 3：權限不足
**症狀：** 呼叫 AI 服務時出現 403 禁止錯誤
**解決方案：**
```bash
# 檢查角色分配
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# 新增缺失的角色
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### 效能問題

#### 問題 4：AI 回應遲緩
**調查步驟：**
1. 檢查 Application Insights 的效能指標
2. 查看 Azure 入口網站的 OpenAI 服務指標
3. 驗證網路連線和延遲

**解決方案：**
- 為常見查詢實作快取
- 使用適合的 OpenAI 模型
- 為高流量場景考慮讀取副本

### **實驗練習 6.1：除錯挑戰**

<strong>場景</strong>：部署成功，但應用返回 500 錯誤。

**除錯任務：**
1. 檢查應用程式日誌
2. 驗證服務連線
3. 測試認證
4. 檢閱配置

**可用工具：**
- 使用 `azd show` 查看部署概要
- Azure 入口網站檢視詳細服務日誌
- Application Insights 監控應用性能

## 模組 7：監控與優化

### 第 7.1 步：設置全面監控

1. **建立自訂儀表板：**

於 Azure 入口網站建立含有以下內容的儀表板：
- OpenAI 請求數量與延遲
- 應用錯誤率
- 資源使用率
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

### 第 7.2 步：成本優化

1. **分析當前成本：**
```bash
# 使用 Azure CLI 獲取成本數據
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **執行成本控管：**
- 設置預算警示
- 使用自動擴縮策略
- 實作請求快取
- 監控 OpenAI 令牌使用狀況

### **實驗練習 7.1：效能優化**

<strong>任務</strong>：優化 AI 應用的效能與成本。

**需改善的指標：**
- 將平均回應時間降低 20%
- 將月度成本降低 15%
- 維持 99.9% 正常運作時間

**可嘗試策略：**
- 實施回應快取
- 優化提示詞以提升令牌效率
- 使用適當的運算 SKU
- 設定合適的自動擴縮

## 終極挑戰：端到端實作

### 挑戰場景

您的任務是建立一個生產級的 AI 客戶服務聊天機器人，需符合以下需求：

**功能性需求：**
- 提供客戶互動的網頁介面
- 整合 Microsoft Foundry Models 以提供回應
- 使用 Azure AI Search 提供文件搜尋能力
- 整合現有客戶資料庫
- 支援多語言

**非功能性需求：**
- 支持 1000 名同時使用者
- 保證 99.9% 正常運作服務水準協議（SLA）
- 符合 SOC 2 合規要求
- 成本低於每月 500 美元
- 部署至多個環境（開發、測試、生產）

### 實作步驟

1. <strong>設計架構</strong>
2. **建立 AZD 範本**
3. <strong>實施安全措施</strong>
4. <strong>設置監控與警示</strong>
5. <strong>建立部署管線</strong>
6. <strong>撰寫解決方案文件</strong>

### 評估標準

- ✅ <strong>功能性</strong>：是否滿足所有需求？
- ✅ <strong>安全性</strong>：是否落實最佳安全實踐？
- ✅ <strong>擴展性</strong>：是否能負擔預期負載？
- ✅ <strong>可維護性</strong>：代碼與基礎架構是否組織良好？
- ✅ <strong>成本</strong>：是否控制在預算內？

## 額外資源

### 微軟官方文件
- [Azure Developer CLI 文件](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models 服務文件](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry 文件](https://learn.microsoft.com/azure/ai-studio/)

### 範本範例
- [Microsoft Foundry Models 聊天應用](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI 聊天應用快速入門](https://github.com/Azure-Samples/openai-chat-app-quickstart)

- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### 社群資源
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 完成證書

恭喜！你已完成 AI 工作坊實驗。你現在應該能夠：

- ✅ 將現有 AI 應用轉換成 AZD 模板
- ✅ 部署生產就緒的 AI 應用程式
- ✅ 實施 AI 工作負載的安全最佳實踐
- ✅ 監控並優化 AI 應用效能
- ✅ 疑難排解常見部署問題

### 下一步
1. 將這些模式應用於你的 AI 專案
2. 將模板回饋給社群
3. 加入 Microsoft Foundry Discord 獲取持續支持
4. 探索進階主題，如多區域部署

---

<strong>工作坊回饋</strong>：請在 [Microsoft Foundry Discord #Azure 頻道](https://discord.gg/microsoft-azure) 分享你的體驗，幫助我們改進此工作坊。

---

**章節導航：**
- **📚 課程首頁**： [AZD For Beginners](../../README.md)
- **📖 目前章節**： 第二章 - AI 優先開發
- **⬅️ 上一章**： [AI 模型部署](ai-model-deployment.md)
- **➡️ 下一章**： [生產 AI 最佳實務](production-ai-practices.md)
- **🚀 下一章節**： [第三章：設定](../chapter-03-configuration/configuration.md)

**需要幫助？** 加入我們的社群，獲取關於 AZD 與 AI 部署的支援與討論。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們力求準確，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議尋求專業人工翻譯。我們不對因使用本翻譯而引起的任何誤解或曲解承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->