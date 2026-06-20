# AI 工作坊實驗室：打造可用於 AZD 部署的 AI 解決方案

**章節導航：**  
- **📚 課程首頁**: [AZD 入門](../../README.md)  
- **📖 目前章節**: 章節 2 - AI 優先開發  
- **⬅️ 上一章**: [AI 模型部署](ai-model-deployment.md)  
- **➡️ 下一章**: [生產級 AI 最佳實踐](production-ai-practices.md)  
- **🚀 下一章節**: [章節 3：設定](../chapter-03-configuration/configuration.md)  

## 工作坊概覽

此實作實驗室指導開發人員如何利用 Azure Developer CLI (AZD) 部署現有的 AI 範本。您將學習運用 Microsoft Foundry 服務進行生產級 AI 部署的關鍵模式。

> **驗證說明 (2026-03-25)：** 此工作坊已依據 `azd` `1.23.12` 版本測試。若您本地安裝版本過舊，請在開始前先更新 AZD，以確保驗證、範本及部署流程與以下步驟相符。

**時長：** 2-3 小時  
**程度：** 中階  
**前置條件：** 基本 Azure 知識、熟悉 AI/ML 概念  

## 🎓 學習目標

完成此工作坊後，您將能夠：  
- ✅ 將現有 AI 應用轉換為使用 AZD 範本  
- ✅ 配置 Microsoft Foundry 服務並使用 AZD 管理  
- ✅ 實作 AI 服務的安全認證管理  
- ✅ 部署具備監控功能的生產級 AI 應用  
- ✅ 排解常見 AI 部署問題  

## 前置條件

### 必備工具  
- 已安裝 [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)  
- 已安裝 [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli)  
- 已安裝 [Git](https://git-scm.com/)  
- 程式碼編輯器（建議使用 VS Code）  

### Azure 資源  
- 具擁有貢獻者權限的 Azure 訂閱  
- 可使用 Microsoft Foundry Models 服務（或能申請存取權）  
- 可建立資源群組權限  

### 知識前置條件  
- 基本 Azure 服務理解  
- 熟悉命令列介面操作  
- 基本 AI/ML 概念（API、模型、提示詞等）  

## 實驗室環境設定

### 第 1 步：環境準備

1. **確認工具安裝狀況：**  
```bash
# 檢查 AZD 安裝
azd version

# 檢查 Azure CLI
az --version

# 登入 Azure 以進行 AZD 工作流程
azd auth login

# 只有在診斷期間打算運行 az 命令時才登入 Azure CLI
az login
```
  
若需跨租戶操作或訂閱未被自動識別，請使用 `azd auth login --tenant-id <tenant-id>` 重新登入。

2. **克隆工作坊範例碼庫：**  
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```
  

## 模組 1：了解 AI AZD 範本結構

### AI AZD 範本構成要素

探索 AI-ready AZD 範本中的主要檔案：  

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
  

### **實驗 1.1：探索設定檔**

1. **檢視 azure.yaml 檔案：**  
```bash
cat azure.yaml
```
  
**注意重點：**  
- AI 元件的服務定義  
- 環境變數映射  
- 主機設定  

2. **檢查 main.bicep 基礎架構模板：**  
```bash
cat infra/main.bicep
```
  
**識別關鍵 AI 模式：**  
- Microsoft Foundry Models 服務配置  
- Azure AI Search 整合  
- 安全金鑰管理  
- 網路安全設定  

### **討論重點：為何這些模式對 AI 很重要**

- <strong>服務相依性</strong>：AI 應用通常需要多個協同服務  
- <strong>安全性</strong>：API 金鑰和端點需妥善管理安全性  
- <strong>彈性擴充</strong>：AI 工作負載有獨特的擴充需求  
- <strong>成本管理</strong>：AI 服務若未妥善配置可能成本驟增  

## 模組 2：部署您的第一個 AI 應用

### 第 2.1 步：初始化環境

1. **建立新的 AZD 環境：**  
```bash
azd env new myai-workshop
```
  
2. **設定所需參數：**  
```bash
# 設定您偏好的 Azure 地區
azd env set AZURE_LOCATION eastus

# 可選：設定特定的 OpenAI 模型
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```
  

### 第 2.2 步：部署基礎架構與應用程式

1. **以 AZD 部署：**  
```bash
azd up
```
  
**azd up 過程中發生：**  
- ✅ 建置 Microsoft Foundry Models 服務  
- ✅ 創建 Azure AI Search 服務  
- ✅ 配置 Web 應用服務 (App Service)  
- ✅ 設定網路及安全性  
- ✅ 部署應用程式碼  
- ✅ 建構監控與日誌功能  

2. <strong>監控部署進度</strong>，並注意建立中的資源。  

### 第 2.3 步：驗證部署結果

1. **檢查已部署資源：**  
```bash
azd show
```
  
2. **打開已部署的應用程式：**  
```bash
azd show
```
  
開啟 `azd show` 輸出顯示的網頁端點。  

3. **測試 AI 功能：**  
   - 瀏覽網頁應用程式  
   - 嘗試範例查詢  
   - 驗證 AI 回應是否正常運作  

### **實驗 2.1：除錯練習**

**情境：** 部署成功但 AI 無法回應。  

**常見問題檢查點：**  
1. **OpenAI API 金鑰**：確認設定正確  
2. <strong>模型可用性</strong>：確認所在區域支援該模型  
3. <strong>網路連線</strong>：確保服務間可通訊  
4. **RBAC 權限**：確認應用有存取 OpenAI 權限  

**除錯指令：**  
```bash
# 檢查環境變量
azd env get-values

# 查看部署日誌
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# 檢查 OpenAI 部署狀態
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```
  

## 模組 3：客製化 AI 應用

### 第 3.1 步：修改 AI 設定

1. **更新 OpenAI 模型：**  
```bash
# 更改為不同的模型（如果您所在的地區有提供）
azd env set AZURE_OPENAI_MODEL gpt-4.1

# 使用新配置重新部署
azd deploy
```
  
2. **新增其他 AI 服務：**  

編輯 `infra/main.bicep` 新增文件智能（Document Intelligence）：  

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
  

### 第 3.2 步：針對環境特定設定

**最佳實務：** 開發與生產環境配置不同設定。  

1. **建立生產環境：**  
```bash
azd env new myai-production
```
  
2. **設定生產環境特定參數：**  
```bash
# 生產通常使用較高的庫存單位
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# 啟用額外的安全功能
azd env set ENABLE_PRIVATE_ENDPOINTS true
```
  

### **實驗 3.1：成本優化**

**挑戰：** 為開發環境配置低成本方案。  

**任務：**  
1. 識別可設定為免費或基本層級的 SKU  
2. 設定環境變數以達到最低成本  
3. 部署並與生產設定成本做比較  

**解法提示：**  
- 儘可能使用 Azure AI Services 的 F0（免費）層  
- 開發中 Search 服務使用 Basic 層  
- 考慮對 Functions 採用 Consumption 方案  

## 模組 4：安全與生產最佳實務

### 第 4.1 步：安全認證管理

**目前挑戰：** 許多 AI 應用硬編碼 API 金鑰或使用不安全儲存。  

**AZD 解決方案：** 管理辨識 (Managed Identity) + Key Vault 整合。  

1. **檢視範本內的安全設定：**  
```bash
# 尋找金鑰庫和管理身份配置
grep -r "keyVault\|managedIdentity" infra/
```
  
2. **驗證管理辨識功能：**  
```bash
# 檢查網頁應用程式是否具有正確的身份配置
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```
  

### 第 4.2 步：網路安全

1. <strong>啟用私有端點</strong>（若尚未配置）：  

將下列加入 bicep 範本：  
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
# 應用程式洞察應該自動配置
# 檢查配置：
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```
  
2. **設定 AI 專用監控：**  

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
  

### **實驗 4.1：安全稽核**

**任務：** 檢視部署以符合安全最佳實務。  

**檢查清單：**  
- [ ] 程式碼與設定中無硬編碼祕密  
- [ ] 使用管理辨識進行服務間驗證  
- [ ] 利用 Key Vault 儲存機密資料  
- [ ] 網路存取權限適當限制  
- [ ] 監控與日誌功能正常開啟  

## 模組 5：轉換您自己的 AI 應用

### 第 5.1 步：評估表

**轉換應用前，請回答以下問題：**  

1. **應用架構：**  
   - 您的應用使用哪些 AI 服務？  
   - 需要哪些計算資源？  
   - 是否需要資料庫？  
   - 服務間有什麼依賴關係？  

2. **安全需求：**  
   - 您的應用處理哪些敏感資料？  
   - 有哪些合規要求？  
   - 是否需要私有網路？  

3. **擴充需求：**  
   - 預期負載是多少？  
   - 需要自動擴充能力嗎？  
   - 是否有區域使用限制？  

### 第 5.2 步：建立您的 AZD 範本

**依照此模式轉換您的應用：**  

1. **建立基礎結構：**  
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# 初始化 AZD 模板
azd init --template minimal
```
  
2. **新增 azure.yaml：**  
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

**挑戰：** 建立針對文件處理 AI 應用的 AZD 範本。  

**需求：**  
- Microsoft Foundry Models 用於內容分析  
- Document Intelligence 用於光學文字辨識 (OCR)  
- 儲存帳戶用於文件上傳  
- Function App 用於處理邏輯  
- Web 應用提供使用介面  

**額外加分：**  
- 適當錯誤處理  
- 計算成本估算  
- 監控儀表板設定  

## 模組 6：常見問題排解

### 常見部署問題

#### 問題 1：OpenAI 服務額度超過  
**症狀：** 部署失敗，顯示額度錯誤  
**解決方案：**  
```bash
# 檢查當前配額
az cognitiveservices usage list --location eastus

# 請求配額增加或嘗試其他地區
azd env set AZURE_LOCATION westus2
azd up
```
  

#### 問題 2：區域中模型不可用  
**症狀：** AI 回應失敗或模型部署錯誤  
**解決方案：**  
```bash
# 按地區檢查模型可用性
az cognitiveservices model list --location eastus

# 更新為可用模型
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```
  

#### 問題 3：權限問題  
**症狀：** 調用 AI 服務時出現 403 禁止錯誤  
**解決方案：**  
```bash
# 檢查角色分配
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# 新增遺失的角色
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```
  

### 效能問題

#### 問題 4：AI 回應緩慢  
**調查步驟：**  
1. 查閱 Application Insights 的效能指標  
2. 在 Azure 入口網站檢視 OpenAI 服務指標  
3. 確認網路連線及延遲狀況  

**解決方案：**  
- 對常用查詢實施快取  
- 使用符合使用場景的 OpenAI 模型  
- 考慮讀取副本以應付高負載  

### **實驗 6.1：除錯挑戰**

**情境：** 部署成功，但應用程式回傳 500 錯誤。  

**除錯任務：**  
1. 檢查應用日誌  
2. 確認服務連線狀況  
3. 測試身份認證  
4. 檢視設定參數  

**使用工具：**  
- `azd show` 查看部署概況  
- Azure 入口網站查看詳細服務日誌  
- Application Insights 查閱應用遙測資料  

## 模組 7：監控與優化

### 第 7.1 步：建立全方位監控

1. **建立自訂儀表板：**  

於 Azure 入口網站建立一個包含以下內容的儀表板：  
- OpenAI 請求數及延遲  
- 應用錯誤率  
- 資源使用狀況  
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
  
2. **實施成本控管措施：**  
- 設定預算警示  
- 使用自動擴充策略  
- 實作請求快取  
- 監控 OpenAI 代幣使用量  

### **實驗 7.1：效能優化**

**任務：** 優化您的 AI 應用，兼顧效能與成本。  

**改善指標：**  
- 平均回應時間降低 20%  
- 每月成本降低 15%  
- 達成 99.9% 運作時間  

**建議策略：**  
- 實施回應快取  
- 優化提示詞以提高代幣使用效率  
- 選擇合適的計算 SKU  
- 設定適當的自動擴充  

## 最終挑戰：端對端實作

### 挑戰情境

您被委派開發一個生產級 AI 客戶服務聊天機器人，需求如下：  

**功能需求：**  
- 提供客戶互動的網頁介面  
- 整合 Microsoft Foundry Models 生成回應  
- 利用 Azure AI Search 實現文件搜尋功能  
- 整合既有客戶資料庫  
- 支援多語言  

**非功能需求：**  
- 能處理 1000 名同時線上用戶  
- 99.9% 可用性 SLA  
- 符合 SOC 2 合規  
- 成本低於每月 500 美元  
- 部署於多個環境（開發、測試、生產）  

### 實作步驟

1. 規劃架構  
2. 建立 AZD 範本  
3. 實作安全措施  
4. 設定監控與警示  
5. 建立部署管線  
6. 撰寫解決方案文件  

### 評估標準

- ✅ <strong>功能性</strong>：符合所有需求？  
- ✅ <strong>安全性</strong>：實作最佳安全措施？  
- ✅ <strong>可擴充性</strong>：能承載預期流量？  
- ✅ <strong>可維護性</strong>：程式碼及架構易於管理？  
- ✅ <strong>成本</strong>：符合預算規範？  

## 附加資源

### Microsoft 文件  
- [Azure Developer CLI 文件](https://learn.microsoft.com/azure/developer/azure-developer-cli/)  
- [Microsoft Foundry Models 服務文件](https://learn.microsoft.com/azure/cognitive-services/openai/)  
- [Microsoft Foundry 文件](https://learn.microsoft.com/azure/ai-studio/)  

### 範例範本  
- [Microsoft Foundry Models 聊天應用](https://github.com/Azure-Samples/azure-search-openai-demo)  
- [OpenAI 聊天應用快速入門](https://github.com/Azure-Samples/openai-chat-app-quickstart)  
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### 社群資源
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 完成證書

恭喜！您已完成 AI 工作坊實驗室。您現在應該能夠：

- ✅ 將現有 AI 應用程式轉換為 AZD 範本
- ✅ 部署生產就緒的 AI 應用程式
- ✅ 實施 AI 工作負載的安全最佳實踐
- ✅ 監控並優化 AI 應用程式效能
- ✅ 排解常見部署問題

### 下一步
1. 將這些模式應用到您自己的 AI 專案
2. 將範本回饋給社群
3. 加入 Microsoft Foundry Discord 獲得持續支持
4. 探索進階主題，如多區域部署

---

<strong>工作坊反饋</strong>：請透過 [Microsoft Foundry Discord #Azure 頻道](https://discord.gg/microsoft-azure) 分享您的經驗，幫助我們改進此工作坊。

---

**章節導覽：**
- **📚 課程首頁**: [AZD For Beginners](../../README.md)
- **📖 目前章節**: 第 2 章 - AI 優先開發
- **⬅️ 上一章**: [AI 模型部署](ai-model-deployment.md)
- **➡️ 下一章**: [生產級 AI 最佳實踐](production-ai-practices.md)
- **🚀 下一章節**: [第 3 章：設定](../chapter-03-configuration/configuration.md)

**需要幫助？** 加入我們的社群，獲得 AZD 及 AI 部署相關的支援與討論。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件由 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻譯而成。雖然我們致力於確保準確性，但請注意，機器自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議進行專業人工翻譯。我們不對因使用本翻譯而產生的任何誤解或誤釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->