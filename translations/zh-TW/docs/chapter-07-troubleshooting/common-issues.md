# 常見問題與解決方案

**章節導航：**
- **📚 課程首頁**：[AZD 入門](../../README.md)
- **📖 本章節**：第 7 章 - 疑難排解與除錯
- **⬅️ 上一章節**：[第 6 章：部署前檢查](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ 下一節**：[除錯指南](debugging.md)
- **🚀 下一章節**：[第 8 章：生產與企業範例](../chapter-08-production/production-ai-practices.md)

## 介紹

本綜合疑難排解指南涵蓋使用 Azure Developer CLI 時最常遇到的問題。學習如何診斷、排解和解決與身份驗證、部署、基礎建設佈建及應用設定相關的常見問題。每個問題均包含詳細的症狀、根本原因以及逐步解決方法。

## 學習目標

完成本指南後，您將能夠：
- 精通 Azure Developer CLI 問題的診斷技巧
- 了解常見身份驗證與權限問題及其解決方案
- 解決部署失敗、基礎建設佈建錯誤及配置問題
- 執行主動監控與除錯策略
- 應用系統化的疑難排解方法處理複雜問題
- 設定適當的日誌記錄與監控以防範未來問題

## 學習成果

完成後，您將能夠：
- 使用內建診斷工具診斷 Azure Developer CLI 問題
- 獨立解決身份驗證、訂閱與權限相關問題
- 有效排解部署失敗與基礎建設佈建錯誤
- 除錯應用配置問題及與環境相關的問題
- 實施監控與警示以主動識別潛在問題
- 應用日誌記錄、除錯及問題解決工作流程的最佳實務

## 快速診斷

在深入特定問題前，請運行這些命令來收集診斷資訊：

```bash
# 檢查 azd 版本和狀態
azd version
azd config show

# 驗證 Azure 身份驗證
az account show
az account list

# 檢查當前環境
azd env list
azd env get-values

# 啟用除錯日誌記錄
export AZD_DEBUG=true
azd <command> --debug
```

## 身份驗證問題

### 問題：「無法取得存取權杖」
**症狀：**
- `azd up` 因身份驗證錯誤失敗
- 指令回傳「未授權」或「拒絕存取」

**解決方案：**
```bash
# 1. 使用 Azure CLI 重新認證
az login
az account show

# 2. 清除快取的憑證
az account clear
az login

# 3. 使用裝置代碼流程（適用於無頭系統）
az login --use-device-code

# 4. 設定明確的訂閱
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### 問題：部署期間「權限不足」
**症狀：**
- 部署因權限錯誤而失敗
- 無法建立特定 Azure 資源

**解決方案：**
```bash
# 1. 檢查您的 Azure 角色指派
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. 確保您擁有所需的角色
# - 貢獻者（用於資源建立）
# - 使用者存取管理員（用於角色指派）

# 3. 聯絡您的 Azure 管理員以取得適當權限
```

### 問題：多租戶身份驗證問題
**解決方案：**
```bash
# 1. 使用特定租戶登入
az login --tenant "your-tenant-id"

# 2. 在設定中設定租戶
azd config set auth.tenantId "your-tenant-id"

# 3. 如果切換租戶，清除租戶快取
az account clear
```

## 🏗️ 基礎建設佈建錯誤

### 問題：資源名稱衝突
**症狀：**
- 「資源名稱已存在」錯誤
- 部署在建立資源時失敗

**解決方案：**
```bash
# 1. 使用帶有代碼的唯一資源名稱
# 在您的 Bicep 模板中：
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. 更改環境名稱
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. 清理現有資源
azd down --force --purge
```

### 問題：地點／區域不可用
**症狀：**
- 「資源類型的地點 'xyz' 不可用」
- 選擇的區域中某些 SKU 不可用

**解決方案：**
```bash
# 1. 檢查資源類型的可用位置
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. 使用一般可用的區域
azd config set defaults.location eastus2
# 或者
azd env set AZURE_LOCATION eastus2

# 3. 按區域檢查服務可用性
# 請訪問：https://azure.microsoft.com/global-infrastructure/services/
```

### 問題：配額超過錯誤
**症狀：**
- 「資源類型配額超過」
- 「已達到最大資源數量」

**解決方案：**
```bash
# 1. 檢查當前配額使用情況
az vm list-usage --location eastus2 -o table

# 2. 透過 Azure 入口網站申請配額增加
# 前往：訂閱 > 使用量與配額

# 3. 開發時使用較小的 SKU
# 在 main.parameters.json 中：
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. 清理未使用的資源
az resource list --query "[?contains(name, 'unused')]" -o table
```

### 問題：Bicep 範本錯誤
**症狀：**
- 範本驗證失敗
- Bicep 檔案語法錯誤

**解決方案：**
```bash
# 1. 驗證 Bicep 語法
az bicep build --file infra/main.bicep

# 2. 使用 Bicep 語法檢查工具
az bicep lint --file infra/main.bicep

# 3. 檢查參數檔案語法
cat infra/main.parameters.json | jq '.'

# 4. 預覽部署變更
azd provision --preview
```

## 🚀 部署失敗

### 問題：建置失敗
**症狀：**
- 應用部署時建置失敗
- 套件安裝錯誤

**解決方案：**
```bash
# 1. 使用除錯標誌檢查建置輸出
azd deploy --service web --debug

# 2. 查看部署的服務狀態
azd show

# 3. 在本地測試建置
cd src/web
npm install
npm run build

# 3. 檢查 Node.js/Python 版本相容性
node --version  # 應該符合 azure.yaml 設定
python --version

# 4. 清除建置快取
rm -rf node_modules package-lock.json
npm install

# 5. 如果使用容器，檢查 Dockerfile
docker build -t test-image .
docker run --rm test-image
```

### 問題：容器部署失敗
**症狀：**
- 容器應用啟動失敗
- 影像拉取錯誤

**解決方案：**
```bash
# 1. 本機測試 Docker 建置
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. 使用 Azure CLI 檢查容器日誌
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. 透過 azd 監控應用程式
azd monitor --logs

# 3. 驗證容器登錄存取權限
az acr login --name myregistry

# 4. 檢查容器應用程式設定
az containerapp show --name my-app --resource-group my-rg
```

### 問題：資料庫連線失敗
**症狀：**
- 應用無法連接資料庫
- 連線逾時錯誤

**解決方案：**
```bash
# 1. 檢查資料庫防火牆規則
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. 從應用程式測試連線
# 暫時加入到您的應用程式：
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. 驗證連接字串格式
azd env get-values | grep DATABASE

# 4. 檢查資料庫伺服器狀態
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 配置問題

### 問題：環境變數無效
**症狀：**
- 應用無法讀取配置值
- 環境變數顯示為空

**解決方案：**
```bash
# 1. 驗證環境變數是否已設定
azd env get-values
azd env get DATABASE_URL

# 2. 檢查 azure.yaml 中的變數名稱
cat azure.yaml | grep -A 5 env:

# 3. 重新啟動應用程式
azd deploy --service web

# 4. 檢查應用服務配置
az webapp config appsettings list --name myapp --resource-group myrg
```

### 問題：SSL/TLS 憑證問題
**症狀：**
- HTTPS 無法運作
- 憑證驗證錯誤

**解決方案：**
```bash
# 1. 檢查 SSL 憑證狀態
az webapp config ssl list --resource-group myrg

# 2. 僅啟用 HTTPS
az webapp update --name myapp --resource-group myrg --https-only true

# 3. 新增自訂網域（如有需要）
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### 問題：CORS 配置問題
**症狀：**
- 前端無法呼叫 API
- 跨來源請求被阻擋

**解決方案：**
```bash
# 1. 為應用服務設定 CORS
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. 更新 API 以處理 CORS
# 在 Express.js 中：
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. 檢查是否在正確的網址上運行
azd show
```

## 🌍 環境管理問題

### 問題：環境切換問題
**症狀：**
- 使用錯誤環境
- 配置切換不正確

**解決方案：**
```bash
# 1. 列出所有環境
azd env list

# 2. 明確選擇環境
azd env select production

# 3. 驗證當前環境
azd env list

# 4. 如果損壞則建立新環境
azd env new production-new
azd env select production-new
```

### 問題：環境損壞
**症狀：**
- 環境顯示無效狀態
- 資源與配置不符

**解決方案：**
```bash
# 1. 重新整理環境狀態
azd env refresh

# 2. 重設環境設定
azd env new production-reset
# 複製所需的環境變數
azd env set DATABASE_URL "your-value"

# 3. 匯入現有資源（如可能）
# 手動更新 .azure/production/config.json，加入資源 ID
```

## 🔍 效能問題

### 問題：部署時間過長
**症狀：**
- 部署耗時過久
- 部署期間逾時

**解決方案：**
```bash
# 1. 部署特定服務以加快迭代速度
azd deploy --service web
azd deploy --service api

# 2. 當基礎設施未更改時，使用僅代碼部署
azd deploy  # 比 azd up 更快

# 3. 優化建置流程
# 在 package.json 中：
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. 檢查資源位置（使用相同區域）
azd config set defaults.location eastus2
```

### 問題：應用效能低落
**症狀：**
- 響應時間緩慢
- 高資源使用率

**解決方案：**
```bash
# 1. 擴大資源規模
# 更新 main.parameters.json 中的 SKU：
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. 啟用 Application Insights 監控
azd monitor --overview

# 3. 在 Azure 中檢查應用程式日誌
az webapp log tail --name myapp --resource-group myrg
# 或對於容器應用程式：
az containerapp logs show --name myapp --resource-group myrg --follow

# 4. 實作快取
# 將 Redis 快取新增到您的基礎架構中
```

## 🛠️ 疑難排解工具與指令

### 除錯指令
```bash
# 全面除錯
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# 檢查 azd 版本
azd version

# 查看目前配置
azd config show

# 測試連線狀態
curl -v https://myapp.azurewebsites.net/health
```

### 日誌分析
```bash
# 透過 Azure CLI 的應用程式日誌
az webapp log tail --name myapp --resource-group myrg

# 使用 azd 監控應用程式
azd monitor --logs
azd monitor --live

# Azure 資源日誌
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# 容器日誌（適用於容器應用程式）
az containerapp logs show --name myapp --resource-group myrg --follow
```

### 資源調查
```bash
# 列出所有資源
az resource list --resource-group myrg -o table

# 檢查資源狀態
az webapp show --name myapp --resource-group myrg --query state

# 網路診斷
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 取得額外協助

### 何時升級
- 嘗試所有解決方案後身份驗證問題仍持續
- Azure 服務的基礎建設問題
- 計費或訂閱相關問題
- 安全疑慮或事件

### 支援管道
```bash
# 1. 檢查 Azure 服務健康狀態
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. 建立 Azure 支援工單
# 前往：https://portal.azure.com -> 幫助 + 支援

# 3. 社群資源
# - Stack Overflow: azure-developer-cli 標籤
# - GitHub 問題追蹤：https://github.com/Azure/azure-dev/issues
# - Microsoft Q&A: https://learn.microsoft.com/en-us/answers/
```

### 需收集的資訊
聯絡支援前，請收集：
- `azd version` 輸出
- `azd config show` 輸出
- `azd show` 輸出（目前部署狀態）
- 錯誤訊息（完整文字）
- 重現問題的步驟
- 環境詳細資訊 (`azd env get-values`)
- 問題開始時間軸

### 日誌收集腳本
```bash
#!/bin/bash
# 收集除錯資訊.sh

echo "Collecting azd debug information..."
mkdir -p debug-logs

echo "System Information:" > debug-logs/system-info.txt
azd version >> debug-logs/system-info.txt
az --version >> debug-logs/system-info.txt

echo "Configuration:" > debug-logs/config.txt
azd config show >> debug-logs/config.txt
azd env list >> debug-logs/config.txt
azd env get-values >> debug-logs/config.txt

echo "Current deployment status:" > debug-logs/status.txt
azd show >> debug-logs/status.txt

echo "Debug information collected in debug-logs/"
```

## 📊 問題預防

### 部署前檢查清單
```bash
# 1. 驗證身份認證
az account show

# 2. 檢查配額和限制
az vm list-usage --location eastus2

# 3. 驗證範本
az bicep build --file infra/main.bicep

# 4. 先在本地測試
npm run build
npm run test

# 5. 使用模擬部署
azd provision --preview
```

### 監控設定
```bash
# 啟用應用程式洞察
# 新增到 main.bicep：
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}

# 設定警示
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/sites/myapp \
  --condition "avg Percentage CPU > 80"
```

### 定期維護
```bash
# 每週健康檢查
./scripts/health-check.sh

# 每月成本審查
az consumption usage list --billing-period-name 202401

# 每季安全審查
az security assessment list --resource-group myrg
```

## 相關資源

- [除錯指南](debugging.md) - 進階除錯技巧
- [佈建資源](../chapter-04-infrastructure/provisioning.md) - 基礎建設疑難排解
- [容量規劃](../chapter-06-pre-deployment/capacity-planning.md) - 資源規劃指南
- [SKU 選擇](../chapter-06-pre-deployment/sku-selection.md) - 服務等級推薦

---

<strong>提示</strong>：請將本指南加入書籤，遇到問題時隨時參考。大多數問題以前已有案例且具備解決方案！

---

<strong>導覽</strong>
- <strong>上一課程</strong>：[佈建資源](../chapter-04-infrastructure/provisioning.md)
- <strong>下一課程</strong>：[除錯指南](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件係使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們力求準確，但請注意自動翻譯可能包含錯誤或不準確之處。原始文件之母語版本應視為權威來源。對於重要資訊，建議尋求專業人工翻譯。我們不對因使用本翻譯所引起的任何誤解或誤譯負責。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->