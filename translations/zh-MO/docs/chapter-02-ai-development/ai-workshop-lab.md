# AI 工作坊實驗室：讓你的 AI 解決方案可用 AZD 部署

**章節導覽：**
- **📚 課程首頁**: [AZD 初學者指南](../../README.md)
- **📖 目前章節**: 第 2 章 - AI 優先開發
- **⬅️ 上一章**: [AI 模型部署](ai-model-deployment.md)
- **➡️ 下一章**: [生產 AI 最佳做法](production-ai-practices.md)
- **🚀 下一章節**: [第 3 章：設定](../chapter-03-configuration/configuration.md)

## 工作坊概覽

這個實作實驗室引導開發人員透過使用 Azure Developer CLI (AZD) 將現有的 AI 範本部署起來。你將學習使用 Microsoft Foundry 服務進行生產級 AI 部署的基本模式。

> **驗證註記 (2026-03-25)：** 本工作坊已針對 `azd` `1.23.12` 進行審查。如果你本地的安裝版本較舊，請在開始前更新 AZD，以確保驗證、範本和部署工作流程與下述步驟相符。

**時長：** 2-3 小時  
**程度：** 中級  
**先決條件：** 具備基本 Azure 知識，熟悉 AI/ML 概念

## 🎓 學習目標

完成本工作坊後，你將能夠：
- ✅ 將現有的 AI 應用轉換為使用 AZD 範本
- ✅ 使用 AZD 設定 Microsoft Foundry 服務
- ✅ 為 AI 服務實作安全的憑證管理
- ✅ 部署具生產準備的 AI 應用並設置監控
- ✅ 疑難排解常見的 AI 部署問題

## 先決條件

### 必備工具
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) 已安裝
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) 已安裝
- [Git](https://git-scm.com/) 已安裝
- 程式碼編輯器（建議使用 VS Code）

### Azure 資源
- 具有貢獻者存取權的 Azure 訂閱
- 可存取 Microsoft Foundry Models 服務（或能夠請求存取）
- 建立資源群組的權限

### 知識先備條件
- 基本的 Azure 服務理解
- 熟悉指令列介面
- 基本的 AI/ML 概念（API、模型、提示）

## 實驗室設定

### 步驟 1：環境準備

1. **確認工具已安裝：**
```bash
# 檢查 AZD 是否已安裝
azd version

# 檢查 Azure CLI
az --version

# 登入 Azure 以執行 AZD 工作流程
azd auth login

# 只有在您計劃於診斷期間執行 az 指令時才登入 Azure CLI
az login
```

如果你在多個租戶之間作業或系統未自動偵測你的訂閱，請改用 `azd auth login --tenant-id <tenant-id>` 重試。

2. **複製工作坊倉庫：**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## 模組 1：了解 AI 應用的 AZD 結構

### AI AZD 範本的構成

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

### **實驗 1.1：探索設定**

1. **檢視 azure.yaml 檔案：**
```bash
cat azure.yaml
```

**應注意事項：**
- 服務定義（針對 AI 組件）
- 環境變數映射
- 主機設定

2. **檢閱 main.bicep 基礎架構：**
```bash
cat infra/main.bicep
```

**要辨識的主要 AI 範式：**
- Microsoft Foundry Models 服務佈建
- Azure AI Search 整合
- 安全金鑰管理
- 網路安全設定

### **討論點：** 為何這些範式對 AI 很重要

- <strong>服務相依性</strong>：AI 應用通常需要多個協調運作的服務
- <strong>安全性</strong>：API 金鑰與端點需安全管理
- <strong>可擴充性</strong>：AI 工作負載有獨特的擴充需求
- <strong>成本管理</strong>：若未妥善配置，AI 服務可能會很昂貴

## 模組 2：部署你的第一個 AI 應用

### 步驟 2.1：初始化環境

1. **建立新的 AZD 環境：**
```bash
azd env new myai-workshop
```

2. **設定所需參數：**
```bash
# 設定您偏好的 Azure 區域
azd env set AZURE_LOCATION eastus

# 可選：設定特定的 OpenAI 模型
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### 步驟 2.2：部署基礎架構與應用程式

1. **使用 AZD 部署：**
```bash
azd up
```

**在執行 `azd up` 時會發生的事情：**
- ✅ 佈建 Microsoft Foundry Models 服務
- ✅ 建立 Azure AI Search 服務
- ✅ 為 Web 應用程式設定 App Service
- ✅ 設定網路與安全性
- ✅ 部署應用程式程式碼
- ✅ 設定監控與日誌

2. <strong>監控部署進度</strong> 並記下正在建立的資源。

### 步驟 2.3：驗證你的部署

1. **檢查已部署的資源：**
```bash
azd show
```

2. **開啟已部署的應用程式：**
```bash
azd show
```

開啟 `azd show` 輸出中顯示的 Web 端點。

3. **測試 AI 功能：**
   - 前往 Web 應用程式
   - 嘗試範例查詢
   - 驗證 AI 回應是否正常

### **實驗 2.1：故障排除練習**

<strong>情境</strong>：你的部署成功但 AI 沒有回應。

**常見問題檢查：**
1. **OpenAI API 金鑰**：確認已正確設定
2. <strong>模型可用性</strong>：檢查你的區域是否支援該模型
3. <strong>網路連線</strong>：確保服務能互相通訊
4. **RBAC 權限**：確認應用程式可以存取 OpenAI

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

### 步驟 3.1：修改 AI 設定

1. **更新 OpenAI 模型：**
```bash
# 更改為其他模型（如果在您的地區可用）
azd env set AZURE_OPENAI_MODEL gpt-4.1

# 使用新的設定重新部署
azd deploy
```

2. **新增其他 AI 服務：**

編輯 `infra/main.bicep` 以新增 Document Intelligence：

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

### 步驟 3.2：針對環境的設定

<strong>最佳實務</strong>：開發與生產環境應使用不同設定。

1. **建立生產環境：**
```bash
azd env new myai-production
```

2. **設定生產專用參數：**
```bash
# 生產通常使用較高階的 SKU
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# 啟用額外的安全功能
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **實驗 3.1：成本優化**

<strong>挑戰</strong>：為開發環境將範本配置為成本效益最佳。

**任務：**
1. 識別哪些 SKU 可設定為免費/基本等級
2. 為最低成本設定環境變數
3. 部署並與生產配置比較成本

**解題提示：**
- 盡可能對 Azure AI Services 使用 F0（免費）方案
- 在開發時對 Search Service 使用 Basic 等級
- 考慮對 Functions 使用 Consumption 計畫

## 模組 4：安全與生產最佳實務

### 步驟 4.1：安全憑證管理

<strong>目前的挑戰</strong>：許多 AI 應用將 API 金鑰寫死或使用不安全的儲存方式。

**AZD 解決方案**：Managed Identity + Key Vault 整合。

1. **檢視範本中的安全性設定：**
```bash
# 尋找 Key Vault 與受管身分識別的設定
grep -r "keyVault\|managedIdentity" infra/
```

2. **驗證 Managed Identity 是否運作：**
```bash
# 檢查網頁應用程式是否具有正確的身分識別設定
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### 步驟 4.2：網路安全

1. <strong>啟用私人端點</strong>（若尚未設定）：

將下列加入你的 bicep 範本：
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

1. **設定 Application Insights：**
```bash
# Application Insights 應該會自動設定
# 檢查設定：
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **設定 AI 專屬監控：**

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

### **實驗 4.1：安全稽核**

<strong>任務</strong>：檢視你的部署以符合安全最佳實務。

**檢查清單：**
- [ ] 程式碼或設定中沒有硬編碼秘密
- [ ] 服務間驗證使用 Managed Identity
- [ ] Key Vault 儲存敏感設定
- [ ] 網路存取已適當限制
- [ ] 已啟用監控與日誌

## 模組 5：將你自己的 AI 應用轉換

### 步驟 5.1：評估工作表

**在轉換你的應用程式前，回答這些問題：**

1. **應用程式架構：**
   - 你的應用使用哪些 AI 服務？
   - 需要哪些運算資源？
   - 是否需要資料庫？
   - 各服務之間的相依關係為何？

2. **安全性需求：**
   - 你的應用處理哪些敏感資料？
   - 有哪些合規性需求？
   - 是否需要私人網路？

3. **擴充需求：**
   - 預期的負載為何？
   - 是否需要自動擴充？
   - 是否有區域性的需求？

### 步驟 5.2：建立你的 AZD 範本

**依據此範式轉換你的應用：**

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

### **實驗 5.1：範本建立挑戰**

<strong>挑戰</strong>：為文件處理型 AI 應用建立 AZD 範本。

**需求：**
- 用於內容分析的 Microsoft Foundry Models
- 用於 OCR 的 Document Intelligence
- 用於文件上傳的 Storage Account
- 處理邏輯的 Function App
- 使用者介面的 Web 應用

**加分項：**
- 新增適當的錯誤處理
- 包含成本估算
- 設定監控儀表板

## 模組 6：故障排除常見問題

### 常見部署問題

#### 問題 1：OpenAI 服務配額超過
**症狀：** 部署失敗並出現配額錯誤  
**解決方案：**
```bash
# 檢查目前配額
az cognitiveservices usage list --location eastus

# 申請提高配額或嘗試不同區域
azd env set AZURE_LOCATION westus2
azd up
```

#### 問題 2：模型在區域中不可用
**症狀：** AI 回應失敗或模型部署錯誤  
**解決方案：**
```bash
# 按地區檢查模型可用性
az cognitiveservices model list --location eastus

# 更新為可用的模型
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### 問題 3：權限問題
**症狀：** 在呼叫 AI 服務時出現 403 Forbidden 錯誤  
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
2. 在 Azure 入口網站檢閱 OpenAI 服務指標
3. 驗證網路連線與延遲

**解決方案：**
- 對常見查詢實作快取
- 為你的使用情境選擇適當的 OpenAI 模型
- 為高負載情境考慮讀取複本

### **實驗 6.1：除錯挑戰**

<strong>情境</strong>：你的部署成功，但應用程式回傳 500 錯誤。

**除錯任務：**
1. 檢查應用程式日誌
2. 驗證服務連線
3. 測試驗證機制
4. 檢閱設定

**可使用的工具：**
- `azd show` 取得部署概覽
- 使用 Azure 入口網站查閱詳細的服務日誌
- 使用 Application Insights 查看應用程式遙測

## 模組 7：監控與最佳化

### 步驟 7.1：建立完整監控

1. **建立自訂儀表板：**

前往 Azure 入口網站並建立儀表板，其中包含：
- OpenAI 請求數量與延遲
- 應用程式錯誤率
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

### 步驟 7.2：成本優化

1. **分析目前成本：**
```bash
# 使用 Azure CLI 取得成本資料
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **實施成本控制：**
- 設定預算警示
- 使用自動縮放策略
- 實作請求快取
- 監控 OpenAI 的 token 使用量

### **實驗 7.1：效能優化**

<strong>任務</strong>：同時為效能與成本優化你的 AI 應用。

**要改善的指標：**
- 將平均回應時間降低 20%
- 將每月成本降低 15%
- 維持 99.9% 的正常運作時間

**可嘗試的策略：**
- 實作回應快取
- 優化提示以提高 token 效率
- 使用適當的運算 SKU
- 設定適當的自動縮放

## 最終挑戰：端到端實作

### 挑戰情境

你的任務是建立一個具生產準備的 AI 客戶服務聊天機器人，需符合下列要求：

**功能性要求：**
- 用於客戶互動的 Web 介面
- 與 Microsoft Foundry Models 整合以產生回應
- 使用 Azure AI Search 提供文件搜尋功能
- 與現有客戶資料庫整合
- 支援多語言

**非功能性要求：**
- 處理 1000 名同時使用者
- 99.9% 可用性 SLA
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
- ✅ <strong>安全性</strong>：是否實作最佳做法？
- ✅ <strong>可擴充性</strong>：是否能應付負載？
- ✅ <strong>可維護性</strong>：程式碼與基礎架構是否井然有序？
- ✅ <strong>成本</strong>：是否在預算內？

## 其他資源

### Microsoft 文件
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### 範例範本
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso 聊天](https://github.com/Azure-Samples/contoso-chat)

### 社群資源
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD 範本](https://azure.github.io/awesome-azd/)

## 🎓 完成證書

恭喜！你已完成 AI 工作坊實驗室。你現在應該可以：

- ✅ 將現有的 AI 應用程式轉換為 AZD 範本
- ✅ 部署可投入生產的 AI 應用程式
- ✅ 為 AI 工作負載實施安全最佳做法
- ✅ 監控並優化 AI 應用程式效能
- ✅ 排解常見的部署問題

### 下一步
1. 將這些模式應用於你自己的 AI 專案
2. 將範本回饋給社群
3. 加入 Microsoft Foundry Discord 獲得持續支援
4. 探索進階主題，例如多區域部署

---

<strong>工作坊回饋</strong>：透過在 [Microsoft Foundry Discord #Azure 頻道](https://discord.gg/microsoft-azure) 分享你的體驗，幫助我們改進本工作坊。

---

**章節導覽：**
- **📚 課程首頁**: [AZD 入門](../../README.md)
- **📖 當前章節**: 第 2 章 - 以 AI 為先的開發
- **⬅️ 上一節**: [AI 模型部署](ai-model-deployment.md)
- **➡️ 下一節**: [生產 AI 最佳實務](production-ai-practices.md)
- **🚀 下一章**: [第 3 章：設定](../chapter-03-configuration/configuration.md)

**需要幫助嗎？** 加入我們的社群，尋求有關 AZD 與 AI 部署的支援與討論。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們力求準確，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議尋求專業人工翻譯。我們不對因使用本翻譯而引起的任何誤解或曲解承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->