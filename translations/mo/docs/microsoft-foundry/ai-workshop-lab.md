<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "8b26783231714a00efafee3aca8b233c",
  "translation_date": "2025-11-20T10:57:26+00:00",
  "source_file": "docs/microsoft-foundry/ai-workshop-lab.md",
  "language_code": "mo"
}
-->
# AI 工作坊實驗室：讓您的 AI 解決方案可用於 AZD 部署

**章節導航：**
- **📚 課程首頁**：[AZD 初學者指南](../../README.md)
- **📖 當前章節**：第 2 章 - AI 優先開發
- **⬅️ 上一章**：[AI 模型部署](ai-model-deployment.md)
- **➡️ 下一章**：[生產環境 AI 最佳實踐](production-ai-practices.md)
- **🚀 下一章節**：[第 3 章：配置](../getting-started/configuration.md)

## 工作坊概覽

這個實作實驗室將指導開發者如何使用 Azure Developer CLI (AZD) 部署現有的 AI 模板。您將學習使用 Microsoft Foundry 服務進行生產環境 AI 部署的基本模式。

**時長：** 2-3 小時  
**難度：** 中級  
**先決條件：** 基本 Azure 知識，熟悉 AI/ML 概念

## 🎓 學習目標

完成本工作坊後，您將能夠：
- ✅ 將現有的 AI 應用轉換為使用 AZD 模板
- ✅ 使用 AZD 配置 Microsoft Foundry 服務
- ✅ 實現 AI 服務的安全憑證管理
- ✅ 部署具備監控功能的生產環境 AI 應用
- ✅ 排除常見的 AI 部署問題

## 先決條件

### 必需工具
- 已安裝 [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- 已安裝 [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli)
- 已安裝 [Git](https://git-scm.com/)
- 程式碼編輯器（建議使用 VS Code）

### Azure 資源
- 擁有具備貢獻者權限的 Azure 訂閱
- 可使用 Azure OpenAI 服務（或能申請使用權限）
- 建立資源群組的權限

### 知識要求
- 基本了解 Azure 服務
- 熟悉命令列介面
- 基本 AI/ML 概念（API、模型、提示）

## 實驗室設置

### 步驟 1：環境準備

1. **確認工具是否已安裝：**
```bash
# 檢查 AZD 安裝
azd version

# 檢查 Azure CLI
az --version

# 登錄到 Azure
az login
azd auth login
```

2. **克隆工作坊的存儲庫：**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## 模組 1：了解 AI 應用的 AZD 結構

### AI AZD 模板的結構

探索 AI 就緒的 AZD 模板中的關鍵文件：

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Azure OpenAI configuration
│       ├── search.bicep    # Cognitive Search setup
│       └── webapp.bicep    # Web app configuration
├── app/                    # Application code
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

### **實驗 1.1：探索配置**

1. **檢查 azure.yaml 文件：**
```bash
cat azure.yaml
```

**需要注意的內容：**
- AI 組件的服務定義
- 環境變數映射
- 主機配置

2. **查看 main.bicep 基礎設施文件：**
```bash
cat infra/main.bicep
```

**需要識別的關鍵 AI 模式：**
- Azure OpenAI 服務的配置
- 認知搜索的整合
- 安全密鑰管理
- 網絡安全配置

### **討論點：為什麼這些模式對 AI 很重要**

- **服務依賴性**：AI 應用通常需要多個協調的服務
- **安全性**：API 密鑰和端點需要安全管理
- **可擴展性**：AI 工作負載有獨特的擴展需求
- **成本管理**：如果未正確配置，AI 服務可能會非常昂貴

## 模組 2：部署您的第一個 AI 應用

### 步驟 2.1：初始化環境

1. **創建新的 AZD 環境：**
```bash
azd env new myai-workshop
```

2. **設置所需參數：**
```bash
# 設定您偏好的 Azure 地區
azd env set AZURE_LOCATION eastus

# 可選：設定特定的 OpenAI 模型
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### 步驟 2.2：部署基礎設施和應用

1. **使用 AZD 部署：**
```bash
azd up
```

**執行 `azd up` 時發生的事情：**
- ✅ 配置 Azure OpenAI 服務
- ✅ 創建認知搜索服務
- ✅ 設置 Web 應用的應用服務
- ✅ 配置網絡和安全性
- ✅ 部署應用程式代碼
- ✅ 設置監控和日誌記錄

2. **監控部署進度**，並記錄正在創建的資源。

### 步驟 2.3：驗證您的部署

1. **檢查已部署的資源：**
```bash
azd show
```

2. **打開已部署的應用：**
```bash
azd show --output json | grep "webAppUrl"
```

3. **測試 AI 功能：**
   - 瀏覽到 Web 應用
   - 嘗試示例查詢
   - 驗證 AI 回應是否正常運作

### **實驗 2.1：故障排除練習**

**場景**：您的部署成功，但 AI 沒有回應。

**需要檢查的常見問題：**
1. **OpenAI API 密鑰**：確認是否正確設置
2. **模型可用性**：檢查您的區域是否支持該模型
3. **網絡連接**：確保服務之間可以通信
4. **RBAC 權限**：確認應用可以訪問 OpenAI

**調試命令：**
```bash
# 檢查環境變數
azd env get-values

# 查看部署日誌
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# 檢查 OpenAI 部署狀態
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## 模組 3：定制您的 AI 應用

### 步驟 3.1：修改 AI 配置

1. **更新 OpenAI 模型：**
```bash
# 更改為不同的模型（如果在您的地區可用）
azd env set AZURE_OPENAI_MODEL gpt-4

# 使用新配置重新部署
azd deploy
```

2. **添加其他 AI 服務：**

編輯 `infra/main.bicep` 以添加文檔智能：

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

**最佳實踐**：為開發和生產環境設置不同的配置。

1. **創建生產環境：**
```bash
azd env new myai-production
```

2. **設置生產特定參數：**
```bash
# 生產通常使用較高的SKU
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# 啟用額外的安全功能
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **實驗 3.1：成本優化**

**挑戰**：配置模板以實現經濟高效的開發。

**任務：**
1. 確定哪些 SKU 可以設置為免費/基本層
2. 配置環境變數以實現最低成本
3. 部署並比較與生產配置的成本

**解決提示：**
- 儘可能使用 F0（免費）層的認知服務
- 在開發中使用基本層的搜索服務
- 考慮為函數使用消耗計劃

## 模組 4：安全性和生產環境最佳實踐

### 步驟 4.1：安全憑證管理

**當前挑戰**：許多 AI 應用將 API 密鑰硬編碼或使用不安全的存儲。

**AZD 解決方案**：托管身份 + Key Vault 集成。

1. **檢查模板中的安全配置：**
```bash
# 尋找金鑰保管庫和受管理身份的配置
grep -r "keyVault\|managedIdentity" infra/
```

2. **驗證托管身份是否正常運作：**
```bash
# 檢查網絡應用程式是否具有正確的身份配置
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### 步驟 4.2：網絡安全

1. **啟用私有端點**（如果尚未配置）：

添加到您的 bicep 模板：
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

### 步驟 4.3：監控和可觀察性

1. **配置 Application Insights：**
```bash
# 應用程式洞察應自動配置
# 檢查配置：
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **設置 AI 特定的監控：**

為 AI 操作添加自定義指標：
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

**任務**：審查您的部署是否符合安全最佳實踐。

**檢查清單：**
- [ ] 代碼或配置中沒有硬編碼的密鑰
- [ ] 使用托管身份進行服務間身份驗證
- [ ] Key Vault 存儲敏感配置
- [ ] 網絡訪問已正確限制
- [ ] 啟用了監控和日誌記錄

## 模組 5：轉換您自己的 AI 應用

### 步驟 5.1：評估工作表

**在轉換您的應用之前**，回答以下問題：

1. **應用架構：**
   - 您的應用使用哪些 AI 服務？
   - 它需要哪些計算資源？
   - 是否需要數據庫？
   - 服務之間的依賴關係是什麼？

2. **安全需求：**
   - 您的應用處理哪些敏感數據？
   - 您有哪些合規要求？
   - 是否需要私有網絡？

3. **擴展需求：**
   - 預期負載是多少？
   - 是否需要自動擴展？
   - 是否有區域性需求？

### 步驟 5.2：創建您的 AZD 模板

**按照以下模式轉換您的應用：**

1. **創建基本結構：**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# 初始化 AZD 模板
azd init --template minimal
```

2. **創建 azure.yaml：**
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

3. **創建基礎設施模板：**

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

### **實驗 5.1：模板創建挑戰**

**挑戰**：為文檔處理 AI 應用創建 AZD 模板。

**需求：**
- 使用 Azure OpenAI 進行內容分析
- 使用文檔智能進行 OCR
- 用於文檔上傳的存儲帳戶
- 用於處理邏輯的函數應用
- 用於用戶界面的 Web 應用

**加分項：**
- 添加適當的錯誤處理
- 包括成本估算
- 設置監控儀表板

## 模組 6：排除常見問題

### 常見部署問題

#### 問題 1：OpenAI 服務配額超出
**症狀：** 部署因配額錯誤而失敗  
**解決方案：**
```bash
# 檢查當前配額
az cognitiveservices usage list --location eastus

# 請求增加配額或嘗試不同地區
azd env set AZURE_LOCATION westus2
azd up
```

#### 問題 2：區域內無法使用模型
**症狀：** AI 回應失敗或模型部署錯誤  
**解決方案：**
```bash
# 檢查模型在各地區的可用性
az cognitiveservices model list --location eastus

# 更新至可用模型
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### 問題 3：權限問題
**症狀：** 調用 AI 服務時出現 403 Forbidden 錯誤  
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

#### 問題 4：AI 回應速度慢
**調查步驟：**
1. 檢查 Application Insights 的性能指標
2. 查看 Azure 入口的 OpenAI 服務指標
3. 驗證網絡連接和延遲

**解決方案：**
- 為常見查詢實現緩存
- 使用適合用例的 OpenAI 模型
- 考慮為高負載場景設置只讀副本

### **實驗 6.1：調試挑戰**

**場景**：您的部署成功，但應用返回 500 錯誤。

**調試任務：**
1. 檢查應用日誌
2. 驗證服務連接
3. 測試身份驗證
4. 審查配置

**可用工具：**
- 使用 `azd show` 查看部署概覽
- 使用 Azure 入口查看詳細服務日誌
- 使用 Application Insights 查看應用遙測

## 模組 7：監控和優化

### 步驟 7.1：設置全面的監控

1. **創建自定義儀表板：**

進入 Azure 入口，創建包含以下內容的儀表板：
- OpenAI 請求數量和延遲
- 應用錯誤率
- 資源使用情況
- 成本跟蹤

2. **設置警報：**
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

2. **實施成本控制：**
- 設置預算警報
- 使用自動擴展策略
- 實現請求緩存
- 監控 OpenAI 的令牌使用情況

### **實驗 7.1：性能優化**

**任務**：優化您的 AI 應用以提高性能並降低成本。

**需要改進的指標：**
- 將平均回應時間減少 20%
- 將每月成本降低 15%
- 保持 99.9% 的正常運行時間

**可嘗試的策略：**
- 實現回應緩存
- 優化提示以提高令牌效率
- 使用適當的計算 SKU
- 設置正確的自動擴展

## 最終挑戰：端到端實現

### 挑戰場景

您需要創建一個生產就緒的 AI 驅動客戶服務聊天機器人，滿足以下需求：

**功能需求：**
- 用於客戶互動的 Web 界面
- 與 Azure OpenAI 集成以生成回應
- 使用認知搜索進行文檔搜索
- 與現有客戶數據庫集成
- 支持多語言

**非功能需求：**
- 處理 1000 個並發用戶
- 99.9% 的正常運行時間 SLA
- 符合 SOC 2 標準
- 每月成本低於 500 美元
- 部署到多個環境（開發、測試、生成）

### 實現步驟

1. **設計架構**
2. **創建 AZD 模板**
3. **實施安全措施**
4. **設置監控和警報**
5. **創建部署管道**
6. **撰寫解決方案文檔**

### 評估標準

- ✅ **功能性**：是否滿足所有需求？
- ✅ **安全性**：是否實施了最佳實踐？
- ✅ **可擴展性**：是否能處理負載？
- ✅ **可維護性**：代碼和基礎設施是否組織良好？
- ✅ **成本**：是否在預算內？

## 附加資源

### 微軟文檔
- [Azure Developer CLI 文檔](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Azure OpenAI 服務文檔](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry 文檔](https://learn.microsoft.com/azure/ai-studio/)

### 示例模板
- [Azure OpenAI 聊天應用](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI 聊天應用快速入門](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso 聊天](https://github.com/Azure-Samples/contoso-chat)

### 社群資源
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 完成證書
恭喜！您已完成 AI 工作坊實驗室。現在您應該能夠：

- ✅ 將現有的 AI 應用程式轉換為 AZD 模板
- ✅ 部署可供生產使用的 AI 應用程式
- ✅ 為 AI 工作負載實施安全性最佳實踐
- ✅ 監控並優化 AI 應用程式的效能
- ✅ 排解常見的部署問題

### 下一步
1. 將這些模式應用到您自己的 AI 項目中
2. 向社群回饋模板
3. 加入 Microsoft Foundry Discord 獲取持續支援
4. 探索進階主題，例如多地區部署

---

**工作坊回饋**：幫助我們改進此工作坊，請在 [Microsoft Foundry Discord #Azure 頻道](https://discord.gg/microsoft-azure) 分享您的體驗。

---

**章節導航：**
- **📚 課程首頁**：[AZD 初學者指南](../../README.md)
- **📖 當前章節**：第 2 章 - AI 優先開發
- **⬅️ 上一章**：[AI 模型部署](ai-model-deployment.md)
- **➡️ 下一章**：[生產 AI 最佳實踐](production-ai-practices.md)
- **🚀 下一章節**：[第 3 章：配置](../getting-started/configuration.md)

**需要幫助？** 加入我們的社群，參與有關 AZD 和 AI 部署的支援與討論。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：  
此文件已使用人工智能翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。儘管我們致力於提供準確的翻譯，請注意自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於關鍵信息，建議使用專業人工翻譯。我們對因使用此翻譯而引起的任何誤解或誤釋不承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->