# AI Workshop Lab: 讓你的 AI 解決方案可由 AZD 部署

**章節導覽：**
- **📚 課程首頁**: [AZD For Beginners](../../README.md)
- **📖 目前章節**: 第 2 章 - 以 AI 為先的開發
- **⬅️ 上一章**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ 下一章**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 下一章節**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

## 實作工作坊概覽

這個實作實驗室引導開發者透過使用 Azure Developer CLI (AZD) 將現有的 AI 範本部署。你將學習使用 Microsoft Foundry 服務進行生產等級 AI 部署的關鍵模式。

**時長：** 2-3 小時  
**程度：** 中階  
**先備條件：** 基本的 Azure 知識，熟悉 AI/ML 概念

## 🎓 學習目標

完成本工作坊後，你將能夠：
- ✅ 將現有的 AI 應用轉換為使用 AZD 範本
- ✅ 使用 AZD 設定 Microsoft Foundry 服務
- ✅ 為 AI 服務實作安全的憑證管理
- ✅ 部署具備監控的生產可用 AI 應用
- ✅ 疑難排解常見的 AI 部署問題

## 先備需求

### 必備工具
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) 已安裝
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) 已安裝
- [Git](https://git-scm.com/) 已安裝
- 程式碼編輯器（建議使用 VS Code）

### Azure 資源
- 具有貢獻者存取權的 Azure 訂閱
- 可存取 Microsoft Foundry Models 服務（或能提出存取申請）
- 可以建立資源群組的權限

### 知識先備
- 對 Azure 服務有基本了解
- 熟悉命令列介面
- 基本 AI/ML 概念（API、模型、提示語）

## 實驗室設定

### 第 1 步：環境準備

1. **驗證工具安裝：**
```bash
# 檢查是否已安裝 AZD
azd version

# 檢查是否已安裝 Azure CLI
az --version

# 登入 Azure
az login
azd auth login
```

2. **複製工作坊版本庫：**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## 模組 1：了解 AI 應用的 AZD 結構

### AI AZD 範本的構成

探索 AI 就緒的 AZD 範本中的關鍵檔案：

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

### **實驗練習 1.1：探索設定**

1. **檢查 azure.yaml 檔案：**
```bash
cat azure.yaml
```

**注意觀察的項目：**
- AI 元件的服務定義
- 環境變數對應
- 主機設定

2. **檢視 main.bicep 基礎架構：**
```bash
cat infra/main.bicep
```

**要識別的關鍵 AI 模式：**
- Microsoft Foundry Models 服務的佈建
- Cognitive Search 整合
- 安全金鑰管理
- 網路安全設定

### **討論重點：** 這些模式為何對 AI 很重要

- <strong>服務相依性</strong>：AI 應用通常需要多個協同工作的服務
- <strong>安全性</strong>：API 金鑰與端點需要安全管理
- <strong>可擴充性</strong>：AI 工作負載有其獨特的伸縮需求
- <strong>成本管理</strong>：若未適當配置，AI 服務可能非常昂貴

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

# 選填：設定特定的 OpenAI 模型
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### 第 2.2 步：部署基礎架構與應用程式

1. **使用 AZD 部署：**
```bash
azd up
```

**在 `azd up` 過程中會發生的事：**
- ✅ 佈建 Microsoft Foundry Models 服務
- ✅ 建立 Cognitive Search 服務
- ✅ 為網頁應用建立 App Service
- ✅ 設定網路與安全性
- ✅ 部署應用程式程式碼
- ✅ 設定監控與記錄

2. <strong>監控部署進度</strong>，並注意正在建立的資源。

### 第 2.3 步：驗證部署

1. **檢查已部署的資源：**
```bash
azd show
```

2. **開啟已部署的應用程式：**
```bash
azd show --output json | grep "webAppUrl"
```

3. **測試 AI 功能：**
   - 瀏覽到網頁應用
   - 嘗試範例查詢
   - 驗證 AI 回應是否正常

### **實驗練習 2.1：故障排解練習**

<strong>情境</strong>：部署成功但 AI 未回應。

**常見要檢查的問題：**
1. **OpenAI API 金鑰**：確認是否正確設定
2. <strong>模型可用性</strong>：檢查你的區域是否支援該模型
3. <strong>網路連線</strong>：確保服務能互相通訊
4. **RBAC 權限**：確認應用能存取 OpenAI

**除錯指令：**
```bash
# 檢查環境變數
azd env get-values

# 查看部署日誌
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# 檢查 OpenAI 部署狀態
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## 模組 3：為你的需求客製化 AI 應用

### 第 3.1 步：修改 AI 設定

1. **更新 OpenAI 模型：**
```bash
# 切換到其他模型（若在您所在地區可用）
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

### 第 3.2 步：環境特定的設定

<strong>最佳實務</strong>：開發與生產應使用不同設定。

1. **建立一個生產環境：**
```bash
azd env new myai-production
```

2. **設定生產專用參數：**
```bash
# 生產環境通常使用較高階的 SKU
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# 啟用額外的安全功能
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **實驗練習 3.1：成本優化**

<strong>挑戰</strong>：配置範本以達到具成本效益的開發環境。

**任務：**
1. 識別哪些 SKU 可設定為免費/基礎等級
2. 設定最小成本的環境變數
3. 部署並與生產設定比較成本

**解題提示：**
- 在可能的情況下，對 Cognitive Services 使用 F0（免費）等級
- 在開發時對 Search Service 使用 Basic 等級
- 考慮對 Functions 使用 Consumption 計畫

## 模組 4：安全與生產最佳實務

### 第 4.1 步：安全憑證管理

<strong>目前的挑戰</strong>：許多 AI 應用將 API 金鑰硬寫或使用不安全的儲存。

**AZD 解法**：Managed Identity + Key Vault 整合。

1. **檢視範本中的安全性設定：**
```bash
# 尋找金鑰保管庫與受管身分識別的設定
grep -r "keyVault\|managedIdentity" infra/
```

2. **驗證 Managed Identity 是否運作：**
```bash
# 檢查 Web 應用程式是否具有正確的身分識別設定
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### 第 4.2 步：網路安全

1. <strong>啟用私用端點</strong>（如果尚未配置）：

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

### 第 4.3 步：監控與可觀察性

1. **設定 Application Insights：**
```bash
# Application Insights 應該會自動設定
# 檢查設定:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **建立 AI 專屬監控：**

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
- [ ] 程式碼或設定中沒有硬寫的密碼
- [ ] 服務間驗證使用 Managed Identity
- [ ] Key Vault 存放敏感設定
- [ ] 網路存取已適當限制
- [ ] 已啟用監控與記錄

## 模組 5：轉換你自己的 AI 應用

### 第 5.1 步：評估工作表

<strong>在轉換你的應用之前</strong>，請回答以下問題：

1. **應用架構：**
   - 你的應用使用哪些 AI 服務？
   - 它需要哪些計算資源？
   - 是否需要資料庫？
   - 服務之間有何相依關係？

2. **安全需求：**
   - 你的應用處理哪些敏感資料？
   - 有哪些合規性要求？
   - 是否需要私有網路？

3. **伸縮需求：**
   - 預期流量為何？
   - 是否需要自動伸縮？
   - 是否有區域性需求？

### 第 5.2 步：建立你的 AZD 範本

**依下列模式將你的應用轉換：**

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

### **實驗練習 5.1：範本建立挑戰**

<strong>挑戰</strong>：為文件處理 AI 應用建立一個 AZD 範本。

**需求：**
- 使用 Microsoft Foundry Models 作內容分析
- 使用 Document Intelligence 做 OCR
- 使用 Storage Account 存放文件上傳
- 使用 Function App 處理邏輯
- 使用 Web 應用做為使用者介面

**加分項：**
- 新增適當的錯誤處理
- 包含成本估算
- 設定監控儀表板

## 模組 6：疑難排解常見問題

### 常見部署問題

#### 問題 1：OpenAI 服務配額超出
**現象：** 部署失敗並顯示配額錯誤
**解決方案：**
```bash
# 檢查目前配額
az cognitiveservices usage list --location eastus

# 請求提高配額或嘗試不同地區
azd env set AZURE_LOCATION westus2
azd up
```

#### 問題 2：模型在該區域不可用
**現象：** AI 回應失敗或模型部署錯誤
**解決方案：**
```bash
# 檢查模型在各地區的可用性
az cognitiveservices model list --location eastus

# 更新為可用的模型
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### 問題 3：權限問題
**現象：** 呼叫 AI 服務時出現 403 Forbidden 錯誤
**解決方案：**
```bash
# 檢查角色分配
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# 新增遺漏的角色
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### 效能問題

#### 問題 4：AI 回應緩慢
**調查步驟：**
1. 檢查 Application Insights 的效能指標
2. 在 Azure 入口網站檢視 OpenAI 服務的指標
3. 驗證網路連線性與延遲

**解決方案：**
- 對常見查詢實作快取
- 為你的使用案例選用適當的 OpenAI 模型
- 考慮在高負載情境下使用讀取複本

### **實驗練習 6.1：除錯挑戰**

<strong>情境</strong>：部署成功，但應用程式回傳 500 錯誤。

**除錯任務：**
1. 檢查應用程式日誌
2. 驗證服務連通性
3. 測試驗證
4. 檢視設定

**可使用的工具：**
- `azd show` 取得部署總覽
- 使用 Azure 入口網站查看詳細的服務日誌
- 使用 Application Insights 查看應用遙測

## 模組 7：監控與優化

### 第 7.1 步：建立完整的監控

1. **建立自訂儀表板：**

在 Azure 入口網站建立儀表板，包含：
- OpenAI 請求數量與延遲
- 應用程式錯誤率
- 資源使用情況
- 成本追蹤

2. **設定警示：**
```bash
# 高錯誤率警示
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

2. **實作成本管控：**
- 設定預算警示
- 使用自動縮放策略
- 實作請求快取
- 監控 OpenAI 的 token 使用量

### **實驗練習 7.1：效能優化**

<strong>任務</strong>：針對效能與成本最佳化你的 AI 應用。

**要改善的指標：**
- 將平均回應時間降低 20%
- 將每月成本降低 15%
- 維持 99.9% 的正常運作時間

**可嘗試的策略：**
- 實作回應快取
- 為提示語進行 token 效率優化
- 選用合適的計算 SKU
- 設定適當的自動縮放

## 最終挑戰：端對端實作

### 挑戰情境

你被指派建立一個生產等級的 AI 客服聊天機器人，需求如下：

**功能性需求：**
- 提供用戶互動的網頁介面
- 與 Microsoft Foundry Models 整合以產生回應
- 使用 Cognitive Search 提供文件搜尋功能
- 與現有客戶資料庫整合
- 支援多語言

**非功能性需求：**
- 能處理 1000 個同時使用者
- 99.9% 正常運作時間的 SLA
- 達到 SOC 2 合規
- 成本低於每月 $500
- 部署至多個環境（dev、staging、prod）

### 實作步驟

1. <strong>設計架構</strong>
2. **建立 AZD 範本**
3. <strong>實作安全措施</strong>
4. <strong>設定監控與警示</strong>
5. <strong>建立部署管線</strong>
6. <strong>撰寫解決方案文件</strong>

### 評估準則

- ✅ <strong>功能性</strong>：是否符合所有需求？
- ✅ <strong>安全性</strong>：是否實作最佳實務？
- ✅ <strong>可擴充性</strong>：能否應付負載？
- ✅ <strong>可維護性</strong>：程式碼與基礎架構是否結構良好？
- ✅ <strong>成本</strong>：是否在預算內？

## 其他資源

### Microsoft 文件
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### 範例範本
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### 社群資源
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 完成證書

恭喜！你已完成 AI Workshop Lab。你現在應該能夠：
- ✅ 將現有的 AI 應用程式轉換為 AZD 範本
- ✅ 部署可投入生產的 AI 應用程式
- ✅ 為 AI 工作負載實施安全最佳做法
- ✅ 監控並優化 AI 應用程式的效能
- ✅ 排解常見的部署問題

### 下一步
1. 將這些模式套用到你自己的 AI 專案
2. 將範本貢獻回社群
3. 加入 Microsoft Foundry 的 Discord 以獲得持續支援
4. 探索進階主題，例如多區域部署

---

<strong>工作坊回饋</strong>: 請在 [Microsoft Foundry Discord #Azure 頻道](https://discord.gg/microsoft-azure) 分享您的經驗，協助我們改進此工作坊。

---

**章節導覽:**
- **📚 Course Home**: [AZD 初學者](../../README.md)
- **📖 Current Chapter**: 第 2 章 - 以 AI 為先的開發
- **⬅️ Previous**: [AI 模型部署](ai-model-deployment.md)
- **➡️ Next**: [生產 AI 最佳實務](production-ai-practices.md)
- **🚀 Next Chapter**: [第 3 章: 設定](../chapter-03-configuration/configuration.md)

**需要幫忙嗎？** 加入我們的社群以獲得有關 AZD 和 AI 部署的支援與討論。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**:
本文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們致力於準確性，但請注意自動翻譯可能包含錯誤或不準確之處。原始語言的文件應被視為具有權威性的來源。對於關鍵資訊，建議採用專業人工翻譯。我們對因使用本翻譯而產生的任何誤解或誤釋不負任何責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->