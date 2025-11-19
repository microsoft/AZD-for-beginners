<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "94de06ce1e81ee964b067f118211612f",
  "translation_date": "2025-11-19T10:42:16+00:00",
  "source_file": "docs/troubleshooting/common-issues.md",
  "language_code": "hk"
}
-->
# 常見問題及解決方法

**章節導航：**
- **📚 課程首頁**：[AZD 初學者指南](../../README.md)
- **📖 當前章節**：第七章 - 故障排除及除錯
- **⬅️ 上一章**：[第六章：部署前檢查](../pre-deployment/preflight-checks.md)
- **➡️ 下一步**：[除錯指南](debugging.md)
- **🚀 下一章**：[第八章：生產及企業模式](../microsoft-foundry/production-ai-practices.md)

## 簡介

這份全面的故障排除指南涵蓋使用 Azure Developer CLI 時最常遇到的問題。學習如何診斷、排除及解決身份驗證、部署、基礎設施配置及應用程式設定的常見問題。每個問題都包括詳細的症狀、根本原因及逐步解決方法。

## 學習目標

完成本指南後，您將能夠：
- 掌握 Azure Developer CLI 問題的診斷技巧
- 理解常見身份驗證及權限問題及其解決方法
- 解決部署失敗、基礎設施配置錯誤及設定問題
- 實施主動監控及除錯策略
- 應用系統化的故障排除方法解決複雜問題
- 配置適當的日誌及監控以防止未來問題

## 學習成果

完成後，您將能夠：
- 使用內建診斷工具診斷 Azure Developer CLI 問題
- 獨立解決身份驗證、訂閱及權限相關問題
- 有效排除部署失敗及基礎設施配置錯誤
- 除錯應用程式設定問題及環境特定問題
- 實施監控及警報以主動識別潛在問題
- 應用最佳實踐於日誌、除錯及問題解決工作流程

## 快速診斷

在深入探討具體問題之前，執行以下命令以收集診斷資訊：

```bash
# Check azd version and health
azd version
azd config list

# Verify Azure authentication
az account show
az account list

# Check current environment
azd env show
azd env get-values

# Enable debug logging
export AZD_DEBUG=true
azd <command> --debug
```

## 身份驗證問題

### 問題："無法獲取存取權杖"
**症狀：**
- `azd up` 因身份驗證錯誤失敗
- 命令返回 "未授權" 或 "存取被拒"

**解決方法：**
```bash
# 1. Re-authenticate with Azure CLI
az login
az account show

# 2. Clear cached credentials
az account clear
az login

# 3. Use device code flow (for headless systems)
az login --use-device-code

# 4. Set explicit subscription
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### 問題：部署時 "權限不足"
**症狀：**
- 部署因權限錯誤失敗
- 無法建立某些 Azure 資源

**解決方法：**
```bash
# 1. Check your Azure role assignments
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Ensure you have required roles
# - Contributor (for resource creation)
# - User Access Administrator (for role assignments)

# 3. Contact your Azure administrator for proper permissions
```

### 問題：多租戶身份驗證問題
**解決方法：**
```bash
# 1. Login with specific tenant
az login --tenant "your-tenant-id"

# 2. Set tenant in configuration
azd config set auth.tenantId "your-tenant-id"

# 3. Clear tenant cache if switching tenants
az account clear
```

## 🏗️ 基礎設施配置錯誤

### 問題：資源名稱衝突
**症狀：**
- "資源名稱已存在" 錯誤
- 部署在建立資源時失敗

**解決方法：**
```bash
# 1. Use unique resource names with tokens
# In your Bicep template:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. Change environment name
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Clean up existing resources
azd down --force --purge
```

### 問題：位置/地區不可用
**症狀：**
- "位置 'xyz' 不適用於資源類型"
- 選定地區的某些 SKU 不可用

**解決方法：**
```bash
# 1. Check available locations for resource types
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. Use commonly available regions
azd config set defaults.location eastus2
# or
azd env set AZURE_LOCATION eastus2

# 3. Check service availability by region
# Visit: https://azure.microsoft.com/global-infrastructure/services/
```

### 問題：配額超出錯誤
**症狀：**
- "資源類型配額超出"
- "已達到資源最大數量"

**解決方法：**
```bash
# 1. Check current quota usage
az vm list-usage --location eastus2 -o table

# 2. Request quota increase through Azure portal
# Go to: Subscriptions > Usage + quotas

# 3. Use smaller SKUs for development
# In main.parameters.json:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. Clean up unused resources
az resource list --query "[?contains(name, 'unused')]" -o table
```

### 問題：Bicep 模板錯誤
**症狀：**
- 模板驗證失敗
- Bicep 文件中的語法錯誤

**解決方法：**
```bash
# 1. Validate Bicep syntax
az bicep build --file infra/main.bicep

# 2. Use Bicep linter
az bicep lint --file infra/main.bicep

# 3. Check parameter file syntax
cat infra/main.parameters.json | jq '.'

# 4. Preview deployment changes
azd provision --preview
```

## 🚀 部署失敗

### 問題：建置失敗
**症狀：**
- 應用程式在部署時無法建置
- 套件安裝錯誤

**解決方法：**
```bash
# 1. Check build logs
azd logs --service web
azd deploy --service web --debug

# 2. Test build locally
cd src/web
npm install
npm run build

# 3. Check Node.js/Python version compatibility
node --version  # Should match azure.yaml settings
python --version

# 4. Clear build cache
rm -rf node_modules package-lock.json
npm install

# 5. Check Dockerfile if using containers
docker build -t test-image .
docker run --rm test-image
```

### 問題：容器部署失敗
**症狀：**
- 容器應用程式無法啟動
- 映像拉取錯誤

**解決方法：**
```bash
# 1. Test Docker build locally
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Check container logs
azd logs --service api --follow

# 3. Verify container registry access
az acr login --name myregistry

# 4. Check container app configuration
az containerapp show --name my-app --resource-group my-rg
```

### 問題：資料庫連接失敗
**症狀：**
- 應用程式無法連接到資料庫
- 連接超時錯誤

**解決方法：**
```bash
# 1. Check database firewall rules
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. Test connectivity from application
# Add to your app temporarily:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. Verify connection string format
azd env get-values | grep DATABASE

# 4. Check database server status
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 設定問題

### 問題：環境變數無法運作
**症狀：**
- 應用程式無法讀取設定值
- 環境變數顯示為空

**解決方法：**
```bash
# 1. Verify environment variables are set
azd env get-values
azd env get DATABASE_URL

# 2. Check variable names in azure.yaml
cat azure.yaml | grep -A 5 env:

# 3. Restart the application
azd deploy --service web

# 4. Check app service configuration
az webapp config appsettings list --name myapp --resource-group myrg
```

### 問題：SSL/TLS 憑證問題
**症狀：**
- HTTPS 無法運作
- 憑證驗證錯誤

**解決方法：**
```bash
# 1. Check SSL certificate status
az webapp config ssl list --resource-group myrg

# 2. Enable HTTPS only
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Add custom domain (if needed)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### 問題：CORS 設定問題
**症狀：**
- 前端無法呼叫 API
- 跨來源請求被阻止

**解決方法：**
```bash
# 1. Configure CORS for App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. Update API to handle CORS
# In Express.js:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. Check if running on correct URLs
azd show
```

## 🌍 環境管理問題

### 問題：環境切換問題
**症狀：**
- 使用了錯誤的環境
- 設定未正確切換

**解決方法：**
```bash
# 1. List all environments
azd env list

# 2. Explicitly select environment
azd env select production

# 3. Verify current environment
azd env show

# 4. Create new environment if corrupted
azd env new production-new
azd env select production-new
```

### 問題：環境損壞
**症狀：**
- 環境顯示為無效狀態
- 資源與設定不匹配

**解決方法：**
```bash
# 1. Refresh environment state
azd env refresh

# 2. Reset environment configuration
azd env new production-reset
# Copy over required environment variables
azd env set DATABASE_URL "your-value"

# 3. Import existing resources (if possible)
# Manually update .azure/production/config.json with resource IDs
```

## 🔍 性能問題

### 問題：部署時間過長
**症狀：**
- 部署耗時過久
- 部署期間超時

**解決方法：**
```bash
# 1. Enable parallel deployment
azd config set deploy.parallelism 5

# 2. Use incremental deployments
azd deploy --incremental

# 3. Optimize build process
# In package.json:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. Check resource locations (use same region)
azd config set defaults.location eastus2
```

### 問題：應用程式性能問題
**症狀：**
- 回應時間過慢
- 資源使用率高

**解決方法：**
```bash
# 1. Scale up resources
# Update SKU in main.parameters.json:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Enable Application Insights monitoring
azd monitor

# 3. Check application logs for bottlenecks
azd logs --service api --follow

# 4. Implement caching
# Add Redis cache to your infrastructure
```

## 🛠️ 故障排除工具及命令

### 除錯命令
```bash
# Comprehensive debugging
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# Check system info
azd info

# Validate configuration
azd config validate

# Test connectivity
curl -v https://myapp.azurewebsites.net/health
```

### 日誌分析
```bash
# Application logs
azd logs --service web --follow
azd logs --service api --since 1h

# Azure resource logs
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Container logs (for Container Apps)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### 資源調查
```bash
# List all resources
az resource list --resource-group myrg -o table

# Check resource status
az webapp show --name myapp --resource-group myrg --query state

# Network diagnostics
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 獲取額外幫助

### 何時升級問題
- 嘗試所有解決方法後身份驗證問題仍然存在
- Azure 服務的基礎設施問題
- 與帳單或訂閱相關的問題
- 安全問題或事件

### 支援渠道
```bash
# 1. Check Azure Service Health
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Create Azure support ticket
# Go to: https://portal.azure.com -> Help + support

# 3. Community resources
# - Stack Overflow: azure-developer-cli tag
# - GitHub Issues: https://github.com/Azure/azure-dev/issues
# - Microsoft Q&A: https://learn.microsoft.com/en-us/answers/
```

### 收集資訊
在聯絡支援之前，請收集以下資訊：
- `azd version` 輸出
- `azd info` 輸出
- 錯誤訊息（完整文字）
- 重現問題的步驟
- 環境詳情（`azd env show`）
- 問題開始的時間線

### 日誌收集腳本
```bash
#!/bin/bash
# collect-debug-info.sh

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
# 1. Validate authentication
az account show

# 2. Check quotas and limits
az vm list-usage --location eastus2

# 3. Validate templates
az bicep build --file infra/main.bicep

# 4. Test locally first
npm run build
npm run test

# 5. Use dry-run deployments
azd provision --preview
```

### 監控設置
```bash
# Enable Application Insights
# Add to main.bicep:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}

# Set up alerts
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/sites/myapp \
  --condition "avg Percentage CPU > 80"
```

### 定期維護
```bash
# Weekly health checks
./scripts/health-check.sh

# Monthly cost review
az consumption usage list --billing-period-name 202401

# Quarterly security review
az security assessment list --resource-group myrg
```

## 相關資源

- [除錯指南](debugging.md) - 高級除錯技巧
- [資源配置](../deployment/provisioning.md) - 基礎設施故障排除
- [容量規劃](../pre-deployment/capacity-planning.md) - 資源規劃指導
- [SKU 選擇](../pre-deployment/sku-selection.md) - 服務層級建議

---

**提示**：將此指南加入書籤，遇到問題時隨時參考。大多數問題已經有既定的解決方法！

---

**導航**
- **上一課**：[資源配置](../deployment/provisioning.md)
- **下一課**：[除錯指南](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：  
此文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們致力於提供準確的翻譯，但請注意，自動翻譯可能包含錯誤或不準確之處。原始語言的文件應被視為權威來源。對於重要資訊，建議使用專業人工翻譯。我們不對因使用此翻譯而引起的任何誤解或誤釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->