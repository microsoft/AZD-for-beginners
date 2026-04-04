# AI 工作坊實驗室：讓你的 AI 解決方案可使用 AZD 部署

**章節導航：**  
- **📚 課程首頁**: [AZD 初學者入門](../../README.md)  
- **📖 目前章節**: 第 2 章 - AI 優先開發  
- **⬅️ 上一章**: [AI 模型部署](ai-model-deployment.md)  
- **➡️ 下一章**: [生產環境 AI 最佳實踐](production-ai-practices.md)  
- **🚀 下一章節**: [第 3 章：配置](../chapter-03-configuration/configuration.md)  

## 工作坊概述

本動手實驗室引導開發者透過現有的 AI 範本，使用 Azure Developer CLI (AZD) 進行部署。你將學習使用 Microsoft Foundry 服務進行生產環境 AI 部署的核心模式。

> **驗證備註 (2026-03-25)：** 本工作坊針對 `azd` `1.23.12` 版進行過測試。如果你的本地安裝版本較舊，請先更新 AZD，以確保認證、範本及部署流程與下述步驟一致。

**時長：** 2-3 小時  
**難度：** 中階  
**先備知識：** 基本 Azure 知識、熟悉 AI/ML 概念  

## 🎓 學習目標

完成此工作坊後，你將能夠：  
- ✅ 將現有 AI 應用轉換為使用 AZD 範本  
- ✅ 使用 AZD 配置 Microsoft Foundry 服務  
- ✅ 實現 AI 服務的安全憑證管理  
- ✅ 部署可監控的生產級 AI 應用  
- ✅ 排解常見的 AI 部署問題  

## 先決條件

### 所需工具  
- 已安裝 [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)  
- 已安裝 [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli)  
- 已安裝 [Git](https://git-scm.com/)  
- 代碼編輯器（推薦 VS Code）  

### Azure 資源  
- 具有貢獻者權限的 Azure 訂閱  
- 可存取 Microsoft Foundry Models 服務（或能申請存取）  
- 有建立資源群組的權限  

### 知識先決  
- 基本 Azure 服務理解  
- 熟悉命令列介面  
- 基本 AI/ML 概念（API、模型、提示）  

## 實驗室環境設定

### 第 1 步：環境準備

1. **檢查工具安裝：**  
```bash
# 檢查 AZD 安裝
azd version

# 檢查 Azure CLI
az --version

# 登入 Azure 以使用 AZD 工作流程
azd auth login

# 僅當你計劃在診斷期間執行 az 命令時，才登入 Azure CLI
az login
```
  
如果你在多個租戶間工作，或系統未自動偵測到訂閱，請使用 `azd auth login --tenant-id <tenant-id>` 重試登入。

2. **複製工作坊代碼庫：**  
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```
  

## 模組 1：理解 AI AZD 範本結構

### AI AZD 範本結構詳解

探索 AI 預備 AZD 範本中的重要檔案：

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
  
### **實驗 1.1：探索配置檔**

1. **檢視 azure.yaml 檔案：**  
```bash
cat azure.yaml
```
  
**關注重點：**  
- AI 元件的服務定義  
- 環境變數對應  
- 主機配置  

2. **審查 main.bicep 基礎架構：**  
```bash
cat infra/main.bicep
```
  
**需識別的核心 AI 模式：**  
- Microsoft Foundry Models 服務佈建  
- 認知搜尋整合  
- 安全金鑰管理  
- 網路安全配置  

### **討論點：這些模式為何對 AI 至關重要**

- <strong>服務依賴性</strong>：AI 應用通常需要多個協調的服務  
- <strong>安全性</strong>：API 金鑰與端點需要安全管理  
- <strong>可擴展性</strong>：AI 工作負載有獨特的擴展需求  
- <strong>成本控管</strong>：若配置不當，AI 服務費用可能高昂  

## 模組 2：部署你的第一個 AI 應用

### 第 2.1 步：初始化環境

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
  

### 第 2.2 步：部署基礎架構與應用

1. **使用 AZD 部署：**  
```bash
azd up
```
  
**`azd up` 過程中會發生：**  
- ✅ 佈建 Microsoft Foundry Models 服務  
- ✅ 建立認知搜尋服務  
- ✅ 設定網頁應用的 App Service  
- ✅ 配置網路與安全性  
- ✅ 部署應用程式碼  
- ✅ 設定監控與日誌  

2. <strong>監控部署進度</strong> 並記錄所建立的資源。

### 第 2.3 步：驗證部署

1. **檢查已部署資源：**  
```bash
azd show
```
  
2. **開啟已部署應用：**  
```bash
azd show
```
  
開啟 `azd show` 輸出中顯示的網頁端點。

3. **測試 AI 功能：**  
   - 造訪網頁應用  
   - 嘗試範例查詢  
   - 驗證 AI 回應是否正常  

### **實驗 2.1：故障排除練習**

<strong>情境</strong>：部署成功，但 AI 不回應。

**常見檢查項目：**  
1. **OpenAI API 金鑰**：確認設定正確  
2. <strong>模型可用性</strong>：確認區域是否支援該模型  
3. <strong>網路連線性</strong>：確保服務間能通訊  
4. **RBAC 權限**：確認應用有訪問 OpenAI 的權限  

**除錯指令：**  
```bash
# 檢查環境變數
azd env get-values

# 查看部署日誌
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# 檢查 OpenAI 部署狀態
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```
  

## 模組 3：為你的需求自訂 AI 應用

### 第 3.1 步：修改 AI 配置

1. **更新 OpenAI 模型：**  
```bash
# 更換為不同的模型（如果您地區有提供）
azd env set AZURE_OPENAI_MODEL gpt-4.1

# 使用新配置重新部署
azd deploy
```
  
2. **新增額外 AI 服務：**  

編輯 `infra/main.bicep` 加入文檔智能功能：

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

<strong>最佳實踐</strong>：開發與生產環境使用不同配置。

1. **創建生產環境：**  
```bash
azd env new myai-production
```
  
2. **設定生產專用參數：**  
```bash
# 生產通常使用較高的SKU
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# 啟用額外的安全功能
azd env set ENABLE_PRIVATE_ENDPOINTS true
```
  

### **實驗 3.1：成本優化**

<strong>挑戰</strong>：為開發環境配置成本效益範本。

**任務：**  
1. 識別哪些 SKU 可設為免費/基礎層  
2. 設定環境變數以達最低成本  
3. 部署並與生產配置比較成本  

**解決提示：**  
- 盡量在認知服務使用 F0（免費）層  
- 開發中搜尋服務設為基礎層  
- 功能服務可考慮使用消耗計劃  

## 模組 4：安全性與生產最佳實踐

### 第 4.1 步：安全憑證管理

<strong>現狀挑戰</strong>：許多 AI 應用硬編碼 API 金鑰或使用不安全儲存。

**AZD 解決方案**：使用受控身分識別及 Key Vault 整合。

1. **審查範本中的安全配置：**  
```bash
# 尋找 Key Vault 和管理身份配置
grep -r "keyVault\|managedIdentity" infra/
```
  
2. **驗證受控身分識別正常運作：**  
```bash
# 檢查網頁應用程式是否有正確的身份配置
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```
  

### 第 4.2 步：網路安全

1. <strong>啟用私有端點</strong>（若尚未配置）：  

在 bicep 範本中新增：  
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
  
2. **設置 AI 專屬監控：**  

新增 AI 營運自訂指標：  
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
  

### **實驗 4.1：安全審核**

<strong>任務</strong>：審核你的部署是否符合安全最佳實踐。

**檢查清單：**  
- [ ] 代碼或配置中無硬編碼密鑰  
- [ ] 服務間認證使用受控身分識別  
- [ ] 金鑰保管庫存放敏感配置  
- [ ] 網路存取限制妥當  
- [ ] 啟用監控與日誌  

## 模組 5：轉換你自己的 AI 應用

### 第 5.1 步：評估工作表

<strong>轉換應用前</strong>，請回答以下問題：

1. **應用架構：**  
   - 你的應用使用哪些 AI 服務？  
   - 需要哪些計算資源？  
   - 是否需要資料庫？  
   - 服務間的依賴關係如何？  

2. **安全需求：**  
   - 應用處理哪些敏感資料？  
   - 有哪些合規需求？  
   - 是否需要私有網路？  

3. **擴展需求：**  
   - 預期負載是多少？  
   - 是否需要自動擴縮？  
   - 有地域性需求嗎？  

### 第 5.2 步：建立你的 AZD 範本

**依照此模式轉換你的應用：**

1. **建立基礎結構：**  
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

**infra/main.bicep** - 主模板：  
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
  

### **實驗 5.1：範本製作挑戰**

<strong>挑戰</strong>：製作一個文件處理 AI 應用的 AZD 範本。

**需求：**  
- Microsoft Foundry Models 用於內容分析  
- 文件智能 OCR 功能  
- 用於上傳文件的儲存帳戶  
- 處理邏輯的 Function App  
- 用戶介面的網頁應用  

**加分項目：**  
- 良好的錯誤處理  
- 費用估算  
- 監控儀表板設定  

## 模組 6：常見問題故障排除

### 部署常見問題

#### 問題 1：OpenAI 服務配額超限  
**症狀：** 部署失敗，報配額錯誤  
**解決方案：**  
```bash
# 檢查當前配額
az cognitiveservices usage list --location eastus

# 請求配額增加或嘗試不同區域
azd env set AZURE_LOCATION westus2
azd up
```
  

#### 問題 2：模型在區域不可用  
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
**症狀：** 呼叫 AI 服務時出現 403 禁止存取  
**解決方案：**  
```bash
# 檢查角色分配
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# 添加缺少的角色
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```
  

### 性能問題

#### 問題 4：AI 回應慢  
**調查步驟：**  
1. 查閱 Application Insights 性能指標  
2. 檢視 Azure 入口網站中的 OpenAI 服務指標  
3. 確認網路連通性與延遲  

**解決方案：**  
- 為常見查詢實施快取  
- 使用適合用例的 OpenAI 模型  
- 考慮高負載情境使用讀取副本  

### **實驗 6.1：除錯挑戰**

<strong>情境</strong>：部署成功，但應用回傳 500 錯誤。

**除錯任務：**  
1. 檢查應用日誌  
2. 驗證服務連線性  
3. 測試身份驗證  
4. 審查配置  

**可用工具：**  
- `azd show` 查看部署概況  
- Azure 入口網站查看服務日誌  
- Application Insights 查看應用遙測  

## 模組 7：監控與優化

### 第 7.1 步：建立全面監控

1. **創建自訂儀表板：**  

導航至 Azure 入口網站並建立包含：  
- OpenAI 請求數量及延遲  
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

1. **分析目前成本：**  
```bash
# 使用 Azure CLI 獲取成本數據
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```
  
2. **實施成本控制：**  
- 設置預算警示  
- 使用自動擴縮政策  
- 實作請求快取  
- 監控 OpenAI 的 token 使用量  

### **實驗 7.1：效能優化**

<strong>任務</strong>：優化你的 AI 應用在效能與成本兩方面的表現。

**需改進指標：**  
- 平均回應時間降低 20%  
- 月成本降低 15%  
- 維持 99.9% 運作時間  

**可嘗試策略：**  
- 實施回應快取  
- 優化提示詞以提升 token 使用效率  
- 使用合適的計算 SKU  
- 設置適當的自動擴縮  

## 最終挑戰：端到端實作

### 挑戰情境

你負責打造一個生產級 AI 客戶服務聊天機器人，需求如下：

**功能需求：**  
- 網頁介面供客戶互動  
- 整合 Microsoft Foundry Models 提供回應  
- 使用認知搜尋進行文件搜尋  
- 整合現有客戶資料庫  
- 支援多語言  

**非功能需求：**  
- 可同時支援 1000 名用戶  
- 99.9% SLA 可用性  
- 遵循 SOC 2 合規  
- 成本低於每月 500 美元  
- 部署多個環境（開發、預演、生產）  

### 實作步驟

1. <strong>設計架構</strong>  
2. **建立 AZD 範本**  
3. <strong>實施安全措施</strong>  
4. <strong>設定監控與警示</strong>  
5. <strong>建置部署管線</strong>  
6. <strong>撰寫解決方案文件</strong>  

### 評估標準

- ✅ <strong>功能性</strong>：是否符合所有需求？  
- ✅ <strong>安全性</strong>：是否執行最佳實踐？  
- ✅ <strong>擴展性</strong>：是否能承受負載？  
- ✅ <strong>可維護性</strong>：程式碼與基礎架構是否有良好組織？  
- ✅ <strong>成本</strong>：是否符合預算？  

## 附加資源

### 微軟文件  
- [Azure Developer CLI 文件](https://learn.microsoft.com/azure/developer/azure-developer-cli/)  
- [Microsoft Foundry Models 服務文件](https://learn.microsoft.com/azure/cognitive-services/openai/)  
- [Microsoft Foundry 文件](https://learn.microsoft.com/azure/ai-studio/)  

### 範本示例  
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### 社區資源
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 完成證書

恭喜！您已完成 AI 工作坊實驗。您現在應該能夠：

- ✅ 將現有 AI 應用程式轉換成 AZD 範本
- ✅ 部署生產就緒的 AI 應用程式
- ✅ 實施 AI 工作負載的安全最佳實踐
- ✅ 監控並優化 AI 應用程式效能
- ✅ 疑難排解常見的部署問題

### 下一步
1. 將這些模式應用於您自己的 AI 專案
2. 向社區回饋範本
3. 加入 Microsoft Foundry Discord 獲取持續支援
4. 探索進階主題如多區域部署

---

<strong>工作坊回饋</strong>：請在 [Microsoft Foundry Discord #Azure 頻道](https://discord.gg/microsoft-azure) 分享您的經驗，幫助我們改進此工作坊。

---

**章節導航：**
- **📚 課程首頁**：[AZD For Beginners](../../README.md)
- **📖 目前章節**：第二章 - 以 AI 為先的開發
- **⬅️ 上一章**：[AI 模型部署](ai-model-deployment.md)
- **➡️ 下一章**：[生產 AI 最佳實務](production-ai-practices.md)
- **🚀 下一章節**：[第三章：設定](../chapter-03-configuration/configuration.md)

**需要幫助嗎？** 加入我們的社群，一起討論 AZD 與 AI 部署相關支援。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件係使用人工智能翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 所翻譯。雖然我們致力於準確性，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文件之母語版本應視為權威來源。對於關鍵資訊，建議採用專業人工翻譯。對於因使用本翻譯而導致的任何誤解或誤讀，我們概不負責。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->