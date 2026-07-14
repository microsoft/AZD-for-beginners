# AI 工作坊實驗室：讓您的 AI 解決方案能夠使用 AZD 部署

**章節導覽：**
- **📚 課程首頁**：[AZD 初學者指南](../../README.md)
- **📖 目前章節**：第二章 - AI-First 開發
- **⬅️ 前一章**：[AI 模型部署](ai-model-deployment.md)
- **➡️ 下一章**：[生產級 AI 最佳實踐](production-ai-practices.md)
- **🚀 下一章節**：[第三章：設定](../chapter-03-configuration/configuration.md)

## 工作坊概覽

本實作實驗室將指導開發者如何使用 Azure Developer CLI (AZD) 部署一個現有的 AI 範本。您將學習使用 Microsoft Foundry 服務進行生產級 AI 部署的關鍵模式。

> **驗證備註（2026-07-13）：** 本工作坊已針對 `azd` `1.27.1` 版本進行審核。若您本地安裝的版本較舊，請先更新 AZD 以確保認證、範本和部署流程與下述步驟相符。

**時間長度：** 2-3 小時  
**難度等級：** 中階  
**先備知識：** 基本 Azure 知識，熟悉 AI/ML 概念

## 🎓 學習目標

完成本工作坊後，您將能夠：
- ✅ 將現有的 AI 應用轉換為使用 AZD 範本
- ✅ 使用 AZD 配置 Microsoft Foundry 服務
- ✅ 實作 AI 服務的安全憑證管理
- ✅ 部署具有監控功能的生產級 AI 應用
- ✅ 疑難排解常見 AI 部署問題

## 先決條件

### 必備工具
- 安裝 [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- 安裝 [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli)
- 安裝 [Git](https://git-scm.com/)
- 程式碼編輯器（建議使用 VS Code）

### Azure 資源
- 具備貢獻者存取權限的 Azure 訂閱
- 具有 Microsoft Foundry Models 服務的存取權 (或能申請存取權)
- 能建立資源群組的權限

### 知識先備條件
- 基本 Azure 服務認識
- 熟悉命令列介面使用
- 基本 AI/ML 概念（API、模型、提示）

## 實驗室設定

### 步驟 1：環境準備

1. **確認工具安裝：**
```bash
# 檢查 AZD 安裝
azd version

# 檢查 Azure CLI
az --version

# 登入 Azure 以使用 AZD 工作流程
azd auth login

# 只有在您計劃在診斷期間執行 az 命令時才登入 Azure CLI
az login
```

如果您跨多個租戶操作或訂閱未自動偵測，請嘗試使用 `azd auth login --tenant-id <tenant-id>` 重新登入。

2. **克隆工作坊程式碼庫：**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## 模組 1：了解 AI 應用的 AZD 結構

### AI AZD 範本構造解析

探索 AI 已準備好的 AZD 範本中的主要檔案：

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

### **實驗練習 1.1：探索設定檔**

1. **檢視 azure.yaml 檔案：**
```bash
cat azure.yaml
```

**注意事項：**
- AI 組件的服務定義
- 環境變數映射
- 主機設定

2. **檢閱 main.bicep 基礎結構：**
```bash
cat infra/main.bicep
```

**需識別的關鍵 AI 模式：**
- Microsoft Foundry Models 服務佈署
- Azure AI Search 整合
- 安全密鑰管理
- 網路安全設定

### **討論重點：為何這些模式對 AI 很重要**

- <strong>服務依賴性</strong>：AI 應用常需多個服務協同工作
- <strong>安全性</strong>：API 金鑰與端點需安全管理
- <strong>可擴展性</strong>：AI 工作負載有獨特的擴展需求
- <strong>成本管理</strong>：若設定不當，AI 服務費用可能昂貴

## 模組 2：部署您的第一個 AI 應用

### 步驟 2.1：初始化環境

1. **建立新 AZD 環境：**
```bash
azd env new myai-workshop
```

2. **設定必要參數：**
```bash
# 設定您偏好的 Azure 區域
azd env set AZURE_LOCATION eastus

# 選擇性：設定特定的 OpenAI 模型
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### 步驟 2.2：部署基礎結構與應用程式

1. **使用 AZD 部署：**
```bash
azd up
```

**`azd up` 過程中會發生的事：**
- ✅ 佈署 Microsoft Foundry Models 服務
- ✅ 建立 Azure AI Search 服務
- ✅ 設置 Web 應用的 App Service
- ✅ 配置網路與安全性
- ✅ 部署應用程式碼
- ✅ 設定監控與記錄功能

2. <strong>監控部署進度</strong>，並留意正在建立的資源。

### 步驟 2.3：驗證部署結果

1. **檢查已部署的資源：**
```bash
azd show
```

2. **開啟已部署應用程式：**
```bash
azd show
```

打開 `azd show` 輸出所示的網頁端點。

3. **測試 AI 功能：**
   - 打開 Web 應用程式
   - 嘗試範例查詢
   - 驗證 AI 回應是否正常

### **實驗練習 2.1：疑難排解練習**

<strong>情境</strong>：您的部署成功，但 AI 無回應。

**常見檢查項目：**
1. **OpenAI API 金鑰**：確認設置正確
2. <strong>模型可用性</strong>：檢查區域是否支援該模型
3. <strong>網路連通性</strong>：確保服務可互相溝通
4. **RBAC 權限**：確認應用程式可存取 OpenAI

**除錯指令：**
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
# 更換為其他模型（如果您所在地區有提供）
azd env set AZURE_OPENAI_MODEL gpt-4.1

# 使用新配置重新部署
azd deploy
```

2. **加入額外 AI 服務：**

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

### 步驟 3.2：環境特定設定

<strong>最佳實踐</strong>：為開發與生產環境使用不同設定。

1. **建立生產環境：**
```bash
azd env new myai-production
```

2. **設定生產專用參數：**
```bash
# 生產通常使用更高的SKU
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# 啟用額外的安全功能
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **實驗練習 3.1：成本優化**

<strong>挑戰</strong>：配置範本以利成本效益的開發。

**任務：**
1. 識別可設定為免費/基本層級的 SKU
2. 設定環境變數以降低成本
3. 部署並與生產配置成本做比較

**解決提示：**
- 盡可能使用 Azure AI 服務的 F0 (免費) 層
- 開發環境中使用搜尋服務的基本層
- 考慮使用 Functions 的消耗方案

## 模組 4：安全性與生產環境最佳實踐

### 步驟 4.1：安全憑證管理

<strong>當前挑戰</strong>：許多 AI 應用硬編碼 API 金鑰或使用不安全的存儲方式。

**AZD 解決方案**：使用管理識別搭配 Key Vault 集成。

1. **檢視範本中的安全設定：**
```bash
# 尋找 Key Vault 和 Managed Identity 配置
grep -r "keyVault\|managedIdentity" infra/
```

2. **驗證管理識別是否正常運行：**
```bash
# 檢查 Web 應用程式是否具有正確的身份識別配置
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
# 應用程式洞察應自動配置
# 檢查配置：
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **設置 AI 特定監控：**

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

<strong>任務</strong>：檢視您的部署是否符合安全最佳實踐。

**檢查清單：**
- [ ] 程式碼或配置中無硬編碼機密
- [ ] 使用管理識別進行服務間認證
- [ ] 使用 Key Vault 儲存敏感設定
- [ ] 網路存取已適當限制
- [ ] 已啟用監控與記錄

## 模組 5：轉換您自己的 AI 應用

### 步驟 5.1：評估工作表

<strong>在轉換應用前</strong>，請回答以下問題：

1. **應用架構：**
   - 您的應用使用哪些 AI 服務？
   - 它需要哪些計算資源？
   - 是否需要資料庫？
   - 各服務間的依賴關係為何？

2. **安全需求：**
   - 您的應用處理哪些敏感資料？
   - 有哪些合規需求？
   - 是否需要私有網路？

3. **擴展需求：**
   - 預期負載為何？
   - 是否需要自動擴展？
   - 是否有區域性要求？

### 步驟 5.2：建立您的 AZD 範本

**依照此範例轉換您的應用：**

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

3. **建立基礎結構範本：**

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
- Document Intelligence 用於 OCR
- 用於文件上傳的儲存帳號
- 用於處理邏輯的 Function App
- 用戶介面的 Web 應用程式

**加分項目：**
- 加入妥善的錯誤處理
- 含成本估算
- 設定監控儀表板

## 模組 6：疑難排解常見問題

### 常見部署問題

#### 問題 1：OpenAI 服務配額超過
**症狀：** 部署失敗並顯示配額錯誤
**解決方案：**
```bash
# 檢查目前配額
az cognitiveservices usage list --location eastus

# 請求配額增加或嘗試不同區域
azd env set AZURE_LOCATION westus2
azd up
```

#### 問題 2：模型在該區域不可用
**症狀：** AI 回應失敗或模型部署錯誤
**解決方案：**
```bash
# 按區域檢查模型可用性
az cognitiveservices model list --location eastus

# 更新為可用的模型
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### 問題 3：權限問題
**症狀：** 呼叫 AI 服務時遭遇 403 禁止存取錯誤
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

### 性能問題

#### 問題 4：AI 回應緩慢
**調查步驟：**
1. 檢視 Application Insights 的性能指標
2. 在 Azure 入口網站檢閱 OpenAI 服務指標
3. 驗證網路連通性與延遲

**解決方案：**
- 為常用查詢實作快取
- 使用適合您需求的 OpenAI 模型
- 為高負載方案考慮讀取副本

### **實驗練習 6.1：除錯挑戰**

<strong>情境</strong>：部署成功，但應用程式回傳 500 錯誤。

**除錯任務：**
1. 檢查應用程式日誌
2. 驗證服務連通性
3. 測試認證
4. 檢閱配置

**使用工具：**
- `azd show` 以查看部署概況
- Azure 入口網站查閱詳細服務日誌
- Application Insights 取得應用程式遙測

## 模組 7：監控與優化

### 步驟 7.1：建立全面監控

1. **建立自訂儀表板：**

前往 Azure 入口網站，建立包含下列項目的儀表板：
- OpenAI 請求數量與延遲
- 應用程式錯誤率
- 資源使用率
- 費用追蹤

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
# 使用 Azure CLI 來取得成本數據
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **實施成本控管：**
- 設定預算警示
- 使用自動擴展策略
- 實施請求快取
- 監控 OpenAI 的 Token 使用量

### **實驗練習 7.1：性能優化**

<strong>任務</strong>：提升您的 AI 應用的性能與成本效益。

**欲改善的指標：**
- 平均回應時間降低 20%
- 月度成本降低 15%
- 維持 99.9% 上線時間

**可嘗試的策略：**
- 實施回應快取
- 優化提示以提升 Token 使用效率
- 使用適當的計算資源 SKU
- 設定適當的自動擴展政策

## 最終挑戰：端到端實作

### 挑戰情境

您被指派建立一個生產準備的 AI 驅動客戶服務聊天機器人，需求如下：

**功能需求：**
- 提供網頁介面供客戶互動
- 整合 Microsoft Foundry Models 生成回應
- 使用 Azure AI Search 的文件搜尋功能
- 與現有客戶資料庫整合
- 支援多語言

**非功能需求：**
- 支援 1000 位同時用戶
- 99.9% 的服務可用性 SLA
- 符合 SOC 2 合規
- 月成本低於 500 美元
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
- ✅ <strong>安全性</strong>：是否實施最佳安全做法？
- ✅ <strong>可擴展性</strong>：是否能承載預期負載？
- ✅ <strong>可維護性</strong>：程式碼及基礎架構是否有良好組織？
- ✅ <strong>成本</strong>：是否控制在預算內？

## 額外資源

### 微軟文件
- [Azure Developer CLI 文件](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models 服務文件](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry 文件](https://learn.microsoft.com/azure/ai-studio/)

### 範本範例
- [Microsoft Foundry Models 聊天應用](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI 聊天應用快速入門](https://github.com/Azure-Samples/openai-chat-app-quickstart)

- [Contoso 聊天](https://github.com/Azure-Samples/contoso-chat)

### 社群資源
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD 範本](https://azure.github.io/awesome-azd/)

## 🎓 完成證書

恭喜！你已完成 AI 實作坊實驗室。你現在應該能夠：

- ✅ 將現有的 AI 應用程式轉換為 AZD 範本
- ✅ 部署生產等級的 AI 應用程式
- ✅ 為 AI 工作負載實作安全最佳做法
- ✅ 監控並優化 AI 應用程式效能
- ✅ 疑難排解常見的部署問題

### 下一步
1. 將這些模式應用到你自己的 AI 專案
2. 將範本回饋社群
3. 加入 Microsoft Foundry Discord 獲得持續支援
4. 探索進階主題，例如多區域部署

---

<strong>實作坊回饋</strong>：透過分享你的體驗至 [Microsoft Foundry Discord #Azure 頻道](https://discord.gg/microsoft-azure)，幫助我們改進此實作坊。

---

**章節導覽：**
- **📚 課程首頁**: [AZD 初學者](../../README.md)
- **📖 目前章節**: 第二章 - AI-First 開發
- **⬅️ 上一章**: [AI 模型部署](ai-model-deployment.md)
- **➡️ 下一章**: [生產 AI 最佳實務](production-ai-practices.md)
- **🚀 下一章節**: [第三章: 設定](../chapter-03-configuration/configuration.md)

**需要幫助？** 加入我們的社群，獲得有關 AZD 和 AI 部署的支援與討論。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
此文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們努力追求準確性，但請注意自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應視為權威來源。對於關鍵資訊，建議採用專業人工翻譯。我們不對因使用此翻譯所產生的任何誤解或誤譯承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->