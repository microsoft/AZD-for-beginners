<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "94de06ce1e81ee964b067f118211612f",
  "translation_date": "2025-11-20T08:58:34+00:00",
  "source_file": "docs/troubleshooting/common-issues.md",
  "language_code": "mo"
}
-->
# 常見問題及解決方案

**章節導航：**
- **📚 課程首頁**：[AZD 初學者指南](../../README.md)
- **📖 當前章節**：第七章 - 疑難排解與除錯
- **⬅️ 上一章**：[第六章：部署前檢查](../pre-deployment/preflight-checks.md)
- **➡️ 下一步**：[除錯指南](debugging.md)
- **🚀 下一章**：[第八章：生產及企業模式](../microsoft-foundry/production-ai-practices.md)

## 簡介

這份全面的疑難排解指南涵蓋使用 Azure Developer CLI 時最常遇到的問題。學習如何診斷、排除及解決身份驗證、部署、基礎設施配置及應用程式設定的常見問題。每個問題都包含詳細的症狀、根本原因及逐步解決程序。

## 學習目標

完成本指南後，您將能夠：
- 掌握 Azure Developer CLI 問題的診斷技巧
- 理解常見身份驗證及權限問題及其解決方法
- 解決部署失敗、基礎設施配置錯誤及設定問題
- 實施主動監控及除錯策略
- 應用系統化的疑難排解方法來處理複雜問題
- 配置正確的日誌記錄及監控以防止未來問題

## 學習成果

完成後，您將能夠：
- 使用內建診斷工具診斷 Azure Developer CLI 問題
- 獨立解決身份驗證、訂閱及權限相關問題
- 有效排除部署失敗及基礎設施配置錯誤
- 除錯應用程式設定問題及環境特定問題
- 實施監控及警報以主動識別潛在問題
- 應用最佳實踐於日誌記錄、除錯及問題解決工作流程

## 快速診斷

在深入探討具體問題之前，執行以下命令以收集診斷資訊：

```bash
# 檢查 azd 版本和健康狀況
azd version
azd config list

# 驗證 Azure 身份驗證
az account show
az account list

# 檢查當前環境
azd env show
azd env get-values

# 啟用調試日誌記錄
export AZD_DEBUG=true
azd <command> --debug
```

## 身份驗證問題

### 問題："無法獲取訪問令牌"
**症狀：**
- `azd up` 因身份驗證錯誤失敗
- 命令返回 "未授權" 或 "訪問被拒"

**解決方法：**
```bash
# 1. 使用 Azure CLI 重新驗證
az login
az account show

# 2. 清除緩存的憑證
az account clear
az login

# 3. 使用設備代碼流程（適用於無頭系統）
az login --use-device-code

# 4. 設定明確的訂閱
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### 問題：部署時 "權限不足"
**症狀：**
- 部署因權限錯誤失敗
- 無法創建某些 Azure 資源

**解決方法：**
```bash
# 1. 檢查您的 Azure 角色分配
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. 確保您擁有所需的角色
# - 貢獻者（用於資源創建）
# - 使用者訪問管理員（用於角色分配）

# 3. 聯絡您的 Azure 管理員以獲取適當的權限
```

### 問題：多租戶身份驗證問題
**解決方法：**
```bash
# 1. 使用特定租戶登入
az login --tenant "your-tenant-id"

# 2. 在配置中設置租戶
azd config set auth.tenantId "your-tenant-id"

# 3. 如果切換租戶則清除租戶緩存
az account clear
```

## 🏗️ 基礎設施配置錯誤

### 問題：資源名稱衝突
**症狀：**
- "資源名稱已存在" 錯誤
- 部署在創建資源時失敗

**解決方法：**
```bash
# 1. 使用帶有標記的唯一資源名稱
# 在您的 Bicep 模板中：
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. 更改環境名稱
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. 清理現有資源
azd down --force --purge
```

### 問題：位置/地區不可用
**症狀：**
- "位置 'xyz' 不可用於資源類型"
- 選定地區的某些 SKU 不可用

**解決方法：**
```bash
# 1. 檢查資源類型的可用位置
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. 使用常見的可用區域
azd config set defaults.location eastus2
# 或
azd env set AZURE_LOCATION eastus2

# 3. 按區域檢查服務的可用性
# 訪問：https://azure.microsoft.com/global-infrastructure/services/
```

### 問題：配額超出錯誤
**症狀：**
- "資源類型配額超出"
- "達到資源最大數量"

**解決方法：**
```bash
# 1. 檢查目前配額使用情況
az vm list-usage --location eastus2 -o table

# 2. 通過 Azure 入口請求增加配額
# 前往：訂閱 > 使用量 + 配額

# 3. 在開發中使用較小的 SKU
# 在 main.parameters.json 中：
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. 清理未使用的資源
az resource list --query "[?contains(name, 'unused')]" -o table
```

### 問題：Bicep 模板錯誤
**症狀：**
- 模板驗證失敗
- Bicep 文件中的語法錯誤

**解決方法：**
```bash
# 1. 驗證 Bicep 語法
az bicep build --file infra/main.bicep

# 2. 使用 Bicep linter
az bicep lint --file infra/main.bicep

# 3. 檢查參數文件語法
cat infra/main.parameters.json | jq '.'

# 4. 預覽部署更改
azd provision --preview
```

## 🚀 部署失敗

### 問題：構建失敗
**症狀：**
- 應用程式在部署期間無法構建
- 套件安裝錯誤

**解決方法：**
```bash
# 1. 檢查建置日誌
azd logs --service web
azd deploy --service web --debug

# 2. 本地測試建置
cd src/web
npm install
npm run build

# 3. 檢查 Node.js/Python 版本相容性
node --version  # 應符合 azure.yaml 設定
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
- 容器應用程式無法啟動
- 映像拉取錯誤

**解決方法：**
```bash
# 1. 在本地測試 Docker 構建
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. 檢查容器日誌
azd logs --service api --follow

# 3. 驗證容器註冊表訪問
az acr login --name myregistry

# 4. 檢查容器應用程式配置
az containerapp show --name my-app --resource-group my-rg
```

### 問題：資料庫連接失敗
**症狀：**
- 應用程式無法連接到資料庫
- 連接超時錯誤

**解決方法：**
```bash
# 1. 檢查資料庫防火牆規則
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. 測試應用程式的連接性
# 暫時添加到您的應用程式：
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. 驗證連接字串格式
azd env get-values | grep DATABASE

# 4. 檢查資料庫伺服器狀態
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 設定問題

### 問題：環境變數無法正常運作
**症狀：**
- 應用程式無法讀取設定值
- 環境變數顯示為空

**解決方法：**
```bash
# 1. 驗證環境變數是否已設置
azd env get-values
azd env get DATABASE_URL

# 2. 檢查 azure.yaml 中的變數名稱
cat azure.yaml | grep -A 5 env:

# 3. 重新啟動應用程式
azd deploy --service web

# 4. 檢查應用程式服務配置
az webapp config appsettings list --name myapp --resource-group myrg
```

### 問題：SSL/TLS 證書問題
**症狀：**
- HTTPS 無法正常運作
- 證書驗證錯誤

**解決方法：**
```bash
# 1. 檢查 SSL 證書狀態
az webapp config ssl list --resource-group myrg

# 2. 僅啟用 HTTPS
az webapp update --name myapp --resource-group myrg --https-only true

# 3. 添加自定義域名（如有需要）
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### 問題：CORS 設定問題
**症狀：**
- 前端無法調用 API
- 跨來源請求被阻止

**解決方法：**
```bash
# 1. 為應用服務配置CORS
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. 更新API以處理CORS
# 在Express.js中：
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. 檢查是否在正確的URL上運行
azd show
```

## 🌍 環境管理問題

### 問題：環境切換問題
**症狀：**
- 使用了錯誤的環境
- 設定未正確切換

**解決方法：**
```bash
# 1. 列出所有環境
azd env list

# 2. 明確選擇環境
azd env select production

# 3. 驗證當前環境
azd env show

# 4. 如果損壞則創建新環境
azd env new production-new
azd env select production-new
```

### 問題：環境損壞
**症狀：**
- 環境顯示為無效狀態
- 資源與設定不匹配

**解決方法：**
```bash
# 1. 刷新環境狀態
azd env refresh

# 2. 重置環境配置
azd env new production-reset
# 複製所需的環境變數
azd env set DATABASE_URL "your-value"

# 3. 導入現有資源（如果可能）
# 手動更新 .azure/production/config.json，加入資源 ID
```

## 🔍 性能問題

### 問題：部署時間過長
**症狀：**
- 部署耗時過久
- 部署期間超時

**解決方法：**
```bash
# 1. 啟用平行部署
azd config set deploy.parallelism 5

# 2. 使用增量部署
azd deploy --incremental

# 3. 優化構建過程
# 在 package.json 中：
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. 檢查資源位置（使用相同地區）
azd config set defaults.location eastus2
```

### 問題：應用程式性能問題
**症狀：**
- 響應時間過慢
- 資源使用率高

**解決方法：**
```bash
# 1. 擴展資源
# 更新 SKU 在 main.parameters.json:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. 啟用應用程式洞察監控
azd monitor

# 3. 檢查應用程式日誌以找出瓶頸
azd logs --service api --follow

# 4. 實施快取
# 添加 Redis 快取到您的基礎設施
```

## 🛠️ 疑難排解工具及命令

### 除錯命令
```bash
# 全面調試
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# 檢查系統資訊
azd info

# 驗證配置
azd config validate

# 測試連接
curl -v https://myapp.azurewebsites.net/health
```

### 日誌分析
```bash
# 應用程式日誌
azd logs --service web --follow
azd logs --service api --since 1h

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

# 網絡診斷
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 獲取額外幫助

### 何時升級問題
- 嘗試所有解決方法後身份驗證問題仍然存在
- 與 Azure 服務相關的基礎設施問題
- 與計費或訂閱相關的問題
- 安全問題或事件

### 支援渠道
```bash
# 1. 檢查 Azure 服務健康狀況
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. 建立 Azure 支援票
# 前往: https://portal.azure.com -> 幫助 + 支援

# 3. 社群資源
# - Stack Overflow: azure-developer-cli 標籤
# - GitHub 問題: https://github.com/Azure/azure-dev/issues
# - Microsoft Q&A: https://learn.microsoft.com/en-us/answers/
```

### 收集資訊
在聯絡支援之前，請收集以下資訊：
- `azd version` 輸出
- `azd info` 輸出
- 錯誤訊息（完整文本）
- 問題重現的步驟
- 環境詳情（`azd env show`）
- 問題開始的時間線

### 日誌收集腳本
```bash
#!/bin/bash
# 收集調試信息.sh

echo "Collecting azd debug information..."
mkdir -p debug-logs

echo "System Information:" > debug-logs/system-info.txt
azd version >> debug-logs/system-info.txt
azd info >> debug-logs/system-info.txt
az --version >> debug-logs/system-info.txt

echo "Configuration:" > debug-logs/config.txt
azd config list >> debug-logs/config.txt
azd env show >> debug-logs/config.txt
azd env get-values >> debug-logs/config.txt

echo "Recent logs:" > debug-logs/recent-logs.txt
azd logs --since 1h >> debug-logs/recent-logs.txt

echo "Debug information collected in debug-logs/"
```

## 📊 問題預防

### 部署前檢查清單
```bash
# 1. 驗證身份驗證
az account show

# 2. 檢查配額和限制
az vm list-usage --location eastus2

# 3. 驗證模板
az bicep build --file infra/main.bicep

# 4. 先在本地測試
npm run build
npm run test

# 5. 使用試運行部署
azd provision --preview
```

### 監控設置
```bash
# 啟用應用程式洞察
# 添加到 main.bicep：
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}

# 設置警報
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

# 每季度安全審查
az security assessment list --resource-group myrg
```

## 相關資源

- [除錯指南](debugging.md) - 高級除錯技術
- [資源配置](../deployment/provisioning.md) - 基礎設施疑難排解
- [容量規劃](../pre-deployment/capacity-planning.md) - 資源規劃指導
- [SKU 選擇](../pre-deployment/sku-selection.md) - 服務層建議

---

**提示**：將本指南加入書籤，遇到問題時隨時參考。大多數問題都曾被遇到過並有既定解決方案！

---

**導航**
- **上一課**：[資源配置](../deployment/provisioning.md)
- **下一課**：[除錯指南](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：  
此文件已使用人工智能翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。儘管我們努力確保準確性，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要信息，建議使用專業人工翻譯。我們對因使用此翻譯而引起的任何誤解或誤釋不承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->