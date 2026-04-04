# 常見問題與解決方案

**章節導航:**
- **📚 課程首頁**: [初學者的 AZD](../../README.md)
- **📖 目前章節**: 第7章 - 疑難排解與除錯
- **⬅️ 上一章**: [第6章：預備檢查](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ 下一章**: [除錯指南](debugging.md)
- **🚀 下一章節**: [第8章：生產與企業範例](../chapter-08-production/production-ai-practices.md)

## 簡介

本綜合疑難排解指南涵蓋使用 Azure Developer CLI 時最常遇到的問題。學習如何診斷、排解及解決認證、部署、基礎建設配置及應用程式設定的常見問題。每個問題均包含詳細的症狀說明、根本原因及逐步解決程序。

## 學習目標

完成本指南後，您將能：
- 精通 Azure Developer CLI 問題的診斷技術
- 理解常見的認證及權限問題及其解決方案
- 解決部署失敗、基礎設施配置錯誤及設定問題
- 實施主動監控及除錯策略
- 採用系統化的疑難排解方法處理複雜問題
- 設定適當的日誌與監控以預防未來問題

## 學習成果

完成後，您將能：
- 使用內建診斷工具診斷 Azure Developer CLI 問題
- 獨立解決認證、訂閱及權限相關問題
- 有效排除部署失敗及基礎設施配置錯誤
- 除錯應用程式設定問題及環境特定問題
- 實施監控與警報以主動識別潛在問題
- 採用日誌、除錯及問題解決的最佳實踐流程

## 快速診斷

在深入特定問題之前，請先執行以下命令以收集診斷資訊：

```bash
# 檢查 azd 版本與狀態
azd version
azd config show

# 驗證 Azure 認證
az account show
az account list

# 檢查當前環境
azd env list
azd env get-values

# 啟用除錯紀錄
export AZD_DEBUG=true
azd <command> --debug
```

## 認證問題

### 問題："取得存取權杖失敗"
**症狀:**
- `azd up` 執行失敗並出現認證錯誤
- 指令回傳 "未授權" 或 "存取拒絕"

**解決方案:**
```bash
# 1. 使用 Azure CLI 重新認證
az login
az account show

# 2. 清除快取憑證
az account clear
az login

# 3. 使用裝置代碼流程（用於無頭系統）
az login --use-device-code

# 4. 設定明確的訂閱
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### 問題：部署時 "權限不足"
**症狀:**
- 部署失敗並出現權限錯誤
- 無法建立某些 Azure 資源

**解決方案:**
```bash
# 1. 檢查您的 Azure 角色指派
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. 確保您擁有所需的角色
# - 貢獻者（用於資源建立）
# - 使用者存取管理員（用於角色指派）

# 3. 聯絡您的 Azure 管理員以取得適當權限
```

### 問題：多租戶認證問題
**解決方案:**
```bash
# 1. 用指定租戶登入
az login --tenant "your-tenant-id"

# 2. 在設定中設定租戶
azd config set auth.tenantId "your-tenant-id"

# 3. 若切換租戶，清除租戶快取
az account clear
```

## 🏗️ 基礎設施配置錯誤

### 問題：資源名稱衝突
**症狀:**
- 顯示「資源名稱已存在」錯誤
- 部署在資源建立時失敗

**解決方案:**
```bash
# 1. 使用包含標記的獨特資源名稱
# 在你的 Bicep 模板中：
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. 更改環境名稱
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. 清理現有資源
azd down --force --purge
```

### 問題：地點/區域不可用
**症狀:**
- 顯示「地點 'xyz' 不適用於此資源類型」
- 選定區域中某些 SKU 不可用

**解決方案:**
```bash
# 1. 檢查資源類型的可用地點
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. 使用常見可用區域
azd config set defaults.location eastus2
# 或者
azd env set AZURE_LOCATION eastus2

# 3. 按區域檢查服務可用性
# 訪問：https://azure.microsoft.com/global-infrastructure/services/
```

### 問題：配額超出錯誤
**症狀:**
- 顯示「資源類型配額超出」
- 顯示「已達資源最大數量」

**解決方案:**
```bash
# 1. 檢查當前配額使用情況
az vm list-usage --location eastus2 -o table

# 2. 通過 Azure 入口網站申請增加配額
# 前往：訂閱 > 使用量 + 配額

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
**症狀:**
- 範本驗證失敗
- Bicep 檔案語法錯誤

**解決方案:**
```bash
# 1. 驗證 Bicep 語法
az bicep build --file infra/main.bicep

# 2. 使用 Bicep 靜態代碼分析工具
az bicep lint --file infra/main.bicep

# 3. 檢查參數文件語法
cat infra/main.parameters.json | jq '.'

# 4. 預覽部署更改
azd provision --preview
```

## 🚀 部署失敗

### 問題：建置失敗
**症狀:**
- 部署期間應用程式建置失敗
- 套件安裝出錯

**解決方案:**
```bash
# 1. 使用除錯標誌檢查建置輸出
azd deploy --service web --debug

# 2. 檢視已部署服務狀態
azd show

# 3. 在本地測試建置
cd src/web
npm install
npm run build

# 3. 檢查 Node.js/Python 版本相容性
node --version  # 應符合 azure.yaml 設定
python --version

# 4. 清除建置快取
rm -rf node_modules package-lock.json
npm install

# 5. 如使用容器，檢查 Dockerfile
docker build -t test-image .
docker run --rm test-image
```

### 問題：容器部署失敗
**症狀:**
- 容器應用程式無法啟動
- 映像檔拉取失敗

**解決方案:**
```bash
# 1. 本地測試 Docker 建置
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. 使用 Azure CLI 檢查容器日誌
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. 透過 azd 監控應用程式
azd monitor --logs

# 3. 驗證容器註冊表訪問權限
az acr login --name myregistry

# 4. 檢查容器應用配置
az containerapp show --name my-app --resource-group my-rg
```

### 問題：資料庫連線失敗
**症狀:**
- 應用程式無法連接資料庫
- 連線逾時錯誤

**解決方案:**
```bash
# 1. 檢查數據庫防火牆規則
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. 從應用程序測試連接
# 暫時加入至你的應用程序：
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. 驗證連接字串格式
azd env get-values | grep DATABASE

# 4. 檢查數據庫伺服器狀態
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 設定問題

### 問題：環境變數無效
**症狀:**
- 應用程式無法讀取設定值
- 環境變數顯示為空

**解決方案:**
```bash
# 1. 驗證環境變量是否已設定
azd env get-values
azd env get DATABASE_URL

# 2. 檢查 azure.yaml 中的變量名稱
cat azure.yaml | grep -A 5 env:

# 3. 重新啟動應用程式
azd deploy --service web

# 4. 檢查應用服務配置
az webapp config appsettings list --name myapp --resource-group myrg
```

### 問題：SSL/TLS 憑證問題
**症狀:**
- HTTPS 無法正常運作
- 憑證驗證錯誤

**解決方案:**
```bash
# 1. 檢查 SSL 證書狀態
az webapp config ssl list --resource-group myrg

# 2. 僅啟用 HTTPS
az webapp update --name myapp --resource-group myrg --https-only true

# 3. 新增自訂網域（如有需要）
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### 問題：CORS 設定問題
**症狀:**
- 前端無法調用 API
- 跨來源請求被攔阻

**解決方案:**
```bash
# 1. 配置 App Service 的 CORS
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. 更新 API 以處理 CORS
# 在 Express.js 中：
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. 檢查是否在正確的 URL 上運行
azd show
```

## 🌍 環境管理問題

### 問題：環境切換問題
**症狀:**
- 使用錯誤環境
- 設定切換不正確

**解決方案:**
```bash
# 1. 列出所有環境
azd env list

# 2. 明確選擇環境
azd env select production

# 3. 驗證當前環境
azd env list

# 4. 如損壞則建立新環境
azd env new production-new
azd env select production-new
```

### 問題：環境損壞
**症狀:**
- 環境狀態顯示無效
- 資源與設定不符

**解決方案:**
```bash
# 1. 重新整理環境狀態
azd env refresh

# 2. 重置環境配置
azd env new production-reset
# 複製所需的環境變量
azd env set DATABASE_URL "your-value"

# 3. 匯入現有資源（如果可能的話）
# 手動更新 .azure/production/config.json 內的資源 ID
```

## 🔍 性能問題

### 問題：部署時間過慢
**症狀:**
- 部署花費過久
- 部署期間逾時

**解決方案:**
```bash
# 1. 部署特定服務以加快迭代速度
azd deploy --service web
azd deploy --service api

# 2. 在基礎設施未變更時使用純代碼部署
azd deploy  # 比 azd up 更快

# 3. 優化構建流程
# 在 package.json 中：
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. 檢查資源位置（使用相同區域）
azd config set defaults.location eastus2
```

### 問題：應用程式性能問題
**症狀:**
- 響應時間緩慢
- 資源使用率過高

**解決方案:**
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
# 或者對於容器應用程式：
az containerapp logs show --name myapp --resource-group myrg --follow

# 4. 實施快取
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

# 檢視當前配置
azd config show

# 測試連線
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

# 容器日誌（用於容器應用程式）
az containerapp logs show --name myapp --resource-group myrg --follow
```

### 資源調查
```bash
# 列出所有資源
az resource list --resource-group myrg -o table

# 檢查資源狀態
az webapp show --name myapp --resource-group myrg --query state

# 網絡診斷
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 尋求額外協助

### 何時升級
- 嘗試所有解決方案後認證問題仍持續
- Azure 服務基礎架構問題
- 帳單或訂閱相關疑問
- 安全性顧慮或事件

### 支援管道
```bash
# 1. 檢查 Azure 服務狀態
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. 創建 Azure 支援單
# 前往：https://portal.azure.com -> 幫助 + 支援

# 3. 社群資源
# - Stack Overflow：azure-developer-cli 標籤
# - GitHub 問題追蹤：https://github.com/Azure/azure-dev/issues
# - Microsoft 問答：https://learn.microsoft.com/en-us/answers/
```

### 收集資訊
聯絡支援前，請收集：
- `azd version` 輸出結果
- `azd config show` 輸出結果
- `azd show` 輸出（目前部署狀態）
- 錯誤訊息（完整文字）
- 重現問題的步驟
- 環境詳情（`azd env get-values`）
- 問題開始的時間軸

### 日誌收集腳本
```bash
#!/bin/bash
# collect-debug-info.sh

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

# 4. 先進行本地測試
npm run build
npm run test

# 5. 使用模擬執行部署
azd provision --preview
```

### 監控設置
```bash
# 啟用應用程式洞察
# 新增至 main.bicep：
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

# 每月成本檢討
az consumption usage list --billing-period-name 202401

# 季度安全檢查
az security assessment list --resource-group myrg
```

## 相關資源

- [除錯指南](debugging.md) - 進階除錯技巧
- [資源配置](../chapter-04-infrastructure/provisioning.md) - 基礎架構疑難排解
- [容量規劃](../chapter-06-pre-deployment/capacity-planning.md) - 資源規劃指南
- [SKU 選擇](../chapter-06-pre-deployment/sku-selection.md) - 服務等級建議

---

<strong>提示</strong>: 將本指南加入書籤，遇到問題時隨時參考。大多數問題皆已有既定解決方案！

---

<strong>導航</strong>
- <strong>上一課</strong>: [資源配置](../chapter-04-infrastructure/provisioning.md)
- <strong>下一課</strong>: [除錯指南](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：  
本文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。儘管我們致力於確保準確性，但請注意自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議採用專業人工翻譯。本公司不對因使用本翻譯而引起的任何誤解或誤釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->