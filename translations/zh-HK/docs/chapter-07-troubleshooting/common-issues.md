# 常見問題與解決方法

**Chapter Navigation:**
- **📚 Course Home**: [AZD 入門指南](../../README.md)
- **📖 Current Chapter**: 第7章 - 疑難排解與除錯
- **⬅️ Previous Chapter**: [第6章：部署前檢查](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ Next**: [除錯指南](debugging.md)
- **🚀 Next Chapter**: [第8章：生產與企業模式](../chapter-08-production/production-ai-practices.md)

## 介紹

本綜合疑難排解指南涵蓋在使用 Azure Developer CLI 時最常遇到的問題。學習如何診斷、排解並解決與認證、部署、基礎架構佈建及應用程式設定相關的常見問題。每個問題都包含詳細的症狀、根本原因與逐步解決程序。

## 學習目標

完成本指南後，您將能：
- 精通 Azure Developer CLI 問題的診斷技術
- 了解常見的認證與權限問題及其解決方法
- 解決部署失敗、基礎架構佈建錯誤與設定問題
- 實施主動監控與除錯策略
- 對複雜問題應用系統化的故障排除方法
- 設定適當的日誌與監控以預防未來問題

## 學習成果

完成後，您將能夠：
- 使用內建診斷工具診斷 Azure Developer CLI 問題
- 獨立解決認證、訂閱與權限相關問題
- 有效排解部署失敗與基礎架構佈建錯誤
- 除錯應用設定問題與環境特定問題
- 實作監控與警示以主動識別潛在問題
- 應用日誌、除錯與問題解決工作流程的最佳實務

## 快速診斷

在深入特定問題之前，請執行這些指令以收集診斷資訊：

```bash
# 檢查 azd 版本及運作狀況
azd version
azd config list

# 驗證 Azure 認證
az account show
az account list

# 檢查當前環境
azd env show
azd env get-values

# 啟用偵錯記錄
export AZD_DEBUG=true
azd <command> --debug
```

## 認證問題

### 問題：「無法取得存取權杖」
**症狀：**
- `azd up` 因認證錯誤而失敗
- 命令回傳「未授權」或「存取被拒」

**解決方法：**
```bash
# 1. 使用 Azure CLI 重新驗證
az login
az account show

# 2. 清除快取的憑證
az account clear
az login

# 3. 使用裝置代碼流程 (用於無頭系統)
az login --use-device-code

# 4. 指定訂閱
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### 問題：部署期間顯示「權限不足」
**症狀：**
- 部署因權限錯誤而失敗
- 無法建立某些 Azure 資源

**解決方法：**
```bash
# 1. 檢查你在 Azure 的角色指派
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. 確保你擁有所需角色
# - Contributor（用於建立資源）
# - User Access Administrator（用於角色指派）

# 3. 聯絡你的 Azure 管理員以取得適當權限
```

### 問題：多租戶認證問題
**解決方法：**
```bash
# 1. 以特定租戶登入
az login --tenant "your-tenant-id"

# 2. 在設定中設置租戶
azd config set auth.tenantId "your-tenant-id"

# 3. 如果切換租戶，清除租戶快取
az account clear
```

## 🏗️ 基礎架構佈建錯誤

### 問題：資源名稱衝突
**症狀：**
- 顯示「資源名稱已存在」錯誤
- 部署在建立資源時失敗

**解決方法：**
```bash
# 1. 使用包含令牌 (tokens) 的唯一資源名稱
# 在你的 Bicep 範本中：
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. 更改環境名稱
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. 清理現有資源
azd down --force --purge
```

### 問題：位置 / 區域不可用
**症狀：**
- 顯示「位置 'xyz' 對於此資源類型不可用」
- 某些 SKU 在所選區域不可用

**解決方法：**
```bash
# 1. 檢查資源類型的可用位置
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. 使用普遍可用的地區
azd config set defaults.location eastus2
# 或
azd env set AZURE_LOCATION eastus2

# 3. 按地區檢查服務可用性
# 請造訪：https://azure.microsoft.com/global-infrastructure/services/
```

### 問題：配額超過錯誤
**症狀：**
- 顯示「資源類型配額已超過」
- 顯示「已達到資源數量上限」

**解決方法：**
```bash
# 1. 檢查目前配額使用情況
az vm list-usage --location eastus2 -o table

# 2. 透過 Azure 入口網站申請提高配額
# 前往：訂閱 > 使用量 + 配額

# 3. 在開發環境使用較小的 SKU
# 在 main.parameters.json 檔案中：
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
- Bicep 檔案有語法錯誤

**解決方法：**
```bash
# 1. 驗證 Bicep 語法
az bicep build --file infra/main.bicep

# 2. 使用 Bicep linter
az bicep lint --file infra/main.bicep

# 3. 檢查參數檔案的語法
cat infra/main.parameters.json | jq '.'

# 4. 預覽部署變更
azd provision --preview
```

## 🚀 部署失敗

### 問題：建置失敗
**症狀：**
- 應用程式在部署期間建置失敗
- 套件安裝錯誤

**解決方法：**
```bash
# 1. 使用除錯旗標檢查建置輸出
azd deploy --service web --debug

# 2. 檢視已部署服務的狀態
azd show

# 3. 在本地測試建置
cd src/web
npm install
npm run build

# 3. 檢查 Node.js/Python 版本相容性
node --version  # 應與 azure.yaml 的設定相符
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
- Container apps 無法啟動
- 影像拉取錯誤

**解決方法：**
```bash
# 1. 在本機測試 Docker 建置
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. 使用 Azure CLI 檢查容器日誌
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. 透過 azd 監控應用程式
azd monitor --logs

# 3. 驗證容器註冊表的存取權限
az acr login --name myregistry

# 4. 檢查容器應用程式的設定
az containerapp show --name my-app --resource-group my-rg
```

### 問題：資料庫連線失敗
**症狀：**
- 應用程式無法連接到資料庫
- 連線逾時錯誤

**解決方法：**
```bash
# 1. 檢查資料庫防火牆規則
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. 從應用程式測試連線
# 暫時加入到你嘅應用程式：
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. 驗證連線字串格式
azd env get-values | grep DATABASE

# 4. 檢查資料庫伺服器狀態
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 設定問題

### 問題：環境變數無效
**症狀：**
- 應用程式無法讀取設定值
- 環境變數顯示為空

**解決方法：**
```bash
# 1. 確認環境變數已設定
azd env get-values
azd env get DATABASE_URL

# 2. 檢查 azure.yaml 中的變數名稱
cat azure.yaml | grep -A 5 env:

# 3. 重啟應用程式
azd deploy --service web

# 4. 檢查應用服務的設定
az webapp config appsettings list --name myapp --resource-group myrg
```

### 問題：SSL/TLS 憑證問題
**症狀：**
- HTTPS 無法運作
- 憑證驗證錯誤

**解決方法：**
```bash
# 1. 檢查 SSL 憑證狀態
az webapp config ssl list --resource-group myrg

# 2. 只啟用 HTTPS
az webapp update --name myapp --resource-group myrg --https-only true

# 3. 新增自訂網域（如有需要）
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### 問題：CORS 設定問題
**症狀：**
- 前端無法呼叫 API
- 跨來源請求被阻擋

**解決方法：**
```bash
# 1. 為 App Service 設定 CORS
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
**症狀：**
- 使用到錯誤的環境
- 設定無法正確切換

**解決方法：**
```bash
# 1. 列出所有環境
azd env list

# 2. 明確選擇環境
azd env select production

# 3. 驗證目前環境
azd env show

# 4. 如果環境損壞就建立新環境
azd env new production-new
azd env select production-new
```

### 問題：環境損毀
**症狀：**
- 環境顯示為無效狀態
- 資源與設定不相符

**解決方法：**
```bash
# 1. 重新整理環境狀態
azd env refresh

# 2. 重設環境設定
azd env new production-reset
# 複製所需的環境變數
azd env set DATABASE_URL "your-value"

# 3. 匯入現有資源（如可行）
# 手動在 .azure/production/config.json 中使用資源 ID 更新
```

## 🔍 效能問題

### 問題：部署時間過長
**症狀：**
- 部署耗時過長
- 部署期間發生逾時

**解決方法：**
```bash
# 1. 部署特定服務以加快迭代
azd deploy --service web
azd deploy --service api

# 2. 在基礎設施不變時，僅部署程式碼
azd deploy  # 比 azd up 更快

# 3. 優化建置流程
# 在 package.json 中：
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. 檢查資源位置（使用相同地區）
azd config set defaults.location eastus2
```

### 問題：應用程式效能問題
**症狀：**
- 回應時間慢
- 高資源使用率

**解決方法：**
```bash
# 1. 擴充資源
# 在 main.parameters.json 中更新 SKU：
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. 啟用 Application Insights 監控
azd monitor --overview

# 3. 在 Azure 檢查應用程式日誌
az webapp log tail --name myapp --resource-group myrg
# 或針對 Container Apps：
az containerapp logs show --name myapp --resource-group myrg --follow

# 4. 實作快取
# 將 Redis 快取加入你的基礎架構
```

## 🛠️ 疑難排解工具與指令

### 除錯指令
```bash
# 全面除錯
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# 檢查 azd 版本
azd version

# 檢視目前設定
azd config list

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

# 容器日誌（適用於 Container Apps）
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

## 🆘 取得額外協助

### 何時升級處理
- 嘗試所有解法後仍有認證問題
- Azure 服務的基礎架構問題
- 計費或訂閱相關問題
- 安全性疑慮或事件

### 支援管道
```bash
# 1. 檢查 Azure 服務健康狀況
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. 建立 Azure 支援單
# 前往： https://portal.azure.com -> 說明與支援

# 3. 社群資源
# - Stack Overflow：azure-developer-cli 標籤
# - GitHub 議題： https://github.com/Azure/azure-dev/issues
# - Microsoft 問答： https://learn.microsoft.com/en-us/answers/
```

### 要收集的資訊
在聯絡支援前，請收集：
- `azd version` 輸出
- `azd config list` 輸出
- `azd show` 輸出（目前部署狀態）
- 錯誤訊息（完整文字）
- 可重現問題的步驟
- 環境詳細資訊（`azd env show`）
- 問題開始發生的時間軸

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
azd config list >> debug-logs/config.txt
azd env show >> debug-logs/config.txt
azd env get-values >> debug-logs/config.txt

echo "Current deployment status:" > debug-logs/status.txt
azd show >> debug-logs/status.txt

echo "Debug information collected in debug-logs/"
```

## 📊 問題預防

### 部署前檢查清單
```bash
# 1. 驗證身份
az account show

# 2. 檢查配額與限制
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
# 啟用 Application Insights
# 新增至 main.bicep:
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

# 每季安全檢討
az security assessment list --resource-group myrg
```

## 相關資源

- [除錯指南](debugging.md) - 進階除錯技巧
- [資源佈建](../chapter-04-infrastructure/provisioning.md) - 基礎架構疑難排解
- [容量規劃](../chapter-06-pre-deployment/capacity-planning.md) - 資源規劃建議
- [SKU 選擇](../chapter-06-pre-deployment/sku-selection.md) - 服務等級建議

---

**Tip**: 將本指南加入書籤，遇到問題時隨時參考。大多數問題之前都已發生過，且已有既定解法！

---

**Navigation**
- **Previous Lesson**: [資源佈建](../chapter-04-infrastructure/provisioning.md)
- **Next Lesson**: [除錯指南](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免責聲明：
本文件已使用人工智能翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們力求準確，但請注意自動翻譯可能包含錯誤或不準確之處。原文（以原始語言撰寫的版本）應被視為具權威性的來源。如涉及重要資料，建議尋求專業人工翻譯。我們不會就因使用此翻譯而引致的任何誤解或誤釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->