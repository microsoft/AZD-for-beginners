# 部署指南 - 精通 AZD 部署

**章節導航：**
- **📚 課程首頁**：[AZD 初學者指南](../../README.md)
- **📖 當前章節**：第4章 - 基礎架構即程式碼與部署
- **⬅️ 上一章節**：[第3章：組態設定](../chapter-03-configuration/configuration.md)
- **➡️ 下一章節**：[資源佈建](provisioning.md)
- **🚀 下一章節**：[第5章：多代理 AI 解決方案](../../examples/retail-scenario.md)

## 介紹

本綜合指南涵蓋使用 Azure Developer CLI 部署應用程式所需了解的所有內容，從基礎的一鍵部署到具有自訂掛鉤、多個環境及 CI/CD 整合的進階生產環境案例。透過實務範例與最佳實踐，掌握完整部署生命週期。

## 學習目標

完成此指南後，您將能：
- 精通所有 Azure Developer CLI 部署命令和工作流程
- 理解從資源佈建到監控的完整部署生命週期
- 實作自訂部署掛鉤以自動化部署前後工作
- 配置具有環境特定參數的多個部署環境
- 設定藍綠部署及金絲雀部署等進階部署策略
- 將 azd 部署整合到 CI/CD 管線與 DevOps 工作流程

## 學習成效

完成後，您將能：
- 獨立執行並排除所有 azd 部署工作流程的問題
- 設計並實作含掛鉤的自訂部署自動化
- 配置具備適當安全性與監控的生產就緒部署
- 管理複雜的多環境部署情境
- 優化部署效能並實施回滾策略
- 將 azd 部署整合至企業級 DevOps 實務

## 部署總覽

Azure Developer CLI 提供多項部署命令：
- `azd up` - 完整工作流程（佈建 + 部署）
- `azd provision` - 僅建立/更新 Azure 資源
- `azd deploy` - 僅部署應用程式程式碼
- `azd package` - 建置與打包應用程式

## 基本部署工作流程

### 完整部署 (azd up)
新專案最常見的工作流程：
```bash
# 從頭開始部署所有內容
azd up

# 使用特定環境部署
azd up --environment production

# 使用自訂參數部署
azd up --parameter location=westus2 --parameter sku=P1v2
```

### 僅基礎架構部署
當您只需更新 Azure 資源時：
```bash
# 提供／更新基礎設施
azd provision

# 使用模擬執行以預覽更改
azd provision --preview

# 提供特定服務
azd provision --service database
```

### 僅程式碼部署
快速應用程式更新時：
```bash
# 部署所有服務
azd deploy

# 預期輸出：
# 部署服務中 (azd deploy)
# - web：部署中... 完成
# - api：部署中... 完成
# 成功：您的部署在 2 分 15 秒內完成

# 部署特定服務
azd deploy --service web
azd deploy --service api

# 使用自訂建置參數部署
azd deploy --service api --build-arg NODE_ENV=production

# 驗證部署
azd show --output json | jq '.services'
```

### ✅ 部署驗證

任何部署後，請驗證部署成功：

```bash
# 檢查所有服務是否正在運行
azd show

# 測試健康端點
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# 監控錯誤（預設在瀏覽器中打開）
azd monitor --logs
```

**成功標準：**
- ✅ 所有服務顯示「正在執行」狀態
- ✅ 健康端點回傳 HTTP 200
- ✅ 過去 5 分鐘無錯誤日誌
- ✅ 應用程式能回應測試請求

## 🏗️ 理解部署流程

### 階段 1：佈建前掛鉤
```yaml
# azure.yaml
hooks:
  preprovision:
    shell: sh
    run: |
      echo "Validating configuration..."
      ./scripts/validate-prereqs.sh
      
      echo "Setting up secrets..."
      ./scripts/setup-secrets.sh
```

### 階段 2：基礎架構佈建
- 讀取基礎架構模板（Bicep/Terraform）
- 建立或更新 Azure 資源
- 配置網路與安全性
- 設定監控與日誌

### 階段 3：佈建後掛鉤
```yaml
hooks:
  postprovision:
    shell: pwsh
    run: |
      Write-Host "Infrastructure ready, setting up databases..."
      ./scripts/setup-database.ps1
      
      Write-Host "Configuring application settings..."
      ./scripts/configure-app-settings.ps1
```

### 階段 4：應用程式打包
- 建置應用程式程式碼
- 建立部署工件
- 為目標平台（容器、ZIP 檔等）打包

### 階段 5：部署前掛鉤
```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      echo "Running pre-deployment tests..."
      npm run test:unit
      
      echo "Database migrations..."
      npm run db:migrate
```

### 階段 6：應用程式部署
- 將打包應用程式部署到 Azure 服務
- 更新組態設定
- 啟動/重新啟動服務

### 階段 7：部署後掛鉤
```yaml
hooks:
  postdeploy:
    shell: sh
    run: |
      echo "Running integration tests..."
      npm run test:integration
      
      echo "Warming up applications..."
      curl https://${WEB_URL}/health
```

## 🎛️ 部署組態

### 服務特定部署設定
```yaml
# azure.yaml
services:
  web:
    project: ./src/web
    host: staticwebapp
    buildCommand: npm run build
    outputPath: dist
    
  api:
    project: ./src/api
    host: containerapp
    docker:
      context: ./src/api
      dockerfile: Dockerfile
      target: production
    env:
      - name: NODE_ENV
        value: production
      - name: API_VERSION
        value: "1.0.0"
        
  worker:
    project: ./src/worker
    host: function
    runtime: node
    buildCommand: npm install --production
```

### 環境特定配置
```bash
# 開發環境
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# 測試環境
azd env new staging
azd env set NODE_ENV staging
azd env set DEBUG false
azd env set LOG_LEVEL info

# 生產環境
azd env new production
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL error
```

## 🔧 進階部署案例

### 多服務應用程式
```yaml
# Complex application with multiple services
services:
  # Frontend applications
  web-app:
    project: ./src/web
    host: staticwebapp
  
  admin-portal:
    project: ./src/admin
    host: appservice
    
  # Backend services
  user-api:
    project: ./src/services/users
    host: containerapp
    
  order-api:
    project: ./src/services/orders
    host: containerapp
    
  payment-api:
    project: ./src/services/payments
    host: function
    
  # Background processing
  notification-worker:
    project: ./src/workers/notifications
    host: containerapp
    
  report-worker:
    project: ./src/workers/reports
    host: function
```

### 藍綠部署
```bash
# 建立藍色環境
azd env new production-blue
azd up --environment production-blue

# 測試藍色環境
./scripts/test-environment.sh production-blue

# 將流量切換到藍色（手動更新 DNS/負載平衡器）
./scripts/switch-traffic.sh production-blue

# 清理綠色環境
azd env select production-green
azd down --force
```

### 金絲雀部署
```yaml
# azure.yaml - Configure traffic splitting
services:
  api:
    project: ./src/api
    host: containerapp
    trafficSplit:
      - revision: stable
        percentage: 90
      - revision: canary
        percentage: 10
```

### 分階段部署
```bash
#!/bin/bash
# 部署階段腳本.deploy-staged.sh

echo "Deploying to development..."
azd env select dev
azd up --confirm-with-no-prompt

echo "Running dev tests..."
./scripts/test-environment.sh dev

echo "Deploying to staging..."
azd env select staging
azd up --confirm-with-no-prompt

echo "Running staging tests..."
./scripts/test-environment.sh staging

echo "Manual approval required for production..."
read -p "Deploy to production? (y/N): " confirm
if [[ $confirm == [yY] ]]; then
    echo "Deploying to production..."
    azd env select production
    azd up --confirm-with-no-prompt
    
    echo "Running production smoke tests..."
    ./scripts/test-environment.sh production
fi
```

## 🐳 容器部署

### 容器應用程式部署
```yaml
services:
  api:
    project: ./src/api
    host: containerapp
    docker:
      context: ./src/api
      dockerfile: Dockerfile
      target: production
      buildArgs:
        BUILD_VERSION: ${BUILD_VERSION}
        NODE_ENV: production
    env:
      - name: DATABASE_URL
        value: ${DATABASE_URL}
    secrets:
      - name: jwt-secret
        value: ${JWT_SECRET}
    scale:
      minReplicas: 1
      maxReplicas: 10
```

### 多階段 Dockerfile 優化
```dockerfile
# Dockerfile
FROM node:18-alpine AS base
WORKDIR /app
COPY package*.json ./

FROM base AS development
RUN npm ci
COPY . .
CMD ["npm", "run", "dev"]

FROM base AS build
RUN npm ci --only=production
COPY . .
RUN npm run build

FROM node:18-alpine AS production
WORKDIR /app
COPY --from=build /app/dist ./dist
COPY --from=build /app/node_modules ./node_modules
COPY package*.json ./
EXPOSE 3000
CMD ["npm", "start"]
```

## ⚡ 效能優化

### 服務特定部署
```bash
# 部署特定服務以加快迭代速度
azd deploy --service web
azd deploy --service api

# 部署所有服務
azd deploy
```

### 建置快取
```yaml
# azure.yaml - Configure build commands
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    outputPath: dist
```

### 高效程式碼部署
```bash
# 使用 azd deploy（非 azd up）進行純程式碼變更
# 這會跳過基礎設施配置，速度快得多
azd deploy

# 部署特定服務以獲得最快的迭代速度
azd deploy --service api
```

## 🔍 部署監控

### 即時部署監控
```bash
# 實時監控應用程式
azd monitor --live

# 檢視應用程式日誌
azd monitor --logs

# 檢查部署狀態
azd show
```

### 健康檢查
```yaml
# azure.yaml - Configure health checks
services:
  api:
    project: ./src/api
    host: containerapp
    healthCheck:
      path: /health
      interval: 30s
      timeout: 10s
      retries: 3
```

### 部署後驗證
```bash
#!/bin/bash
# scripts/validate-deployment.sh

echo "Validating deployment..."

# 檢查應用程式運作狀態
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

echo "Testing web application..."
if curl -f "$WEB_URL/health"; then
    echo "✅ Web application is healthy"
else
    echo "❌ Web application health check failed"
    exit 1
fi

echo "Testing API..."
if curl -f "$API_URL/health"; then
    echo "✅ API is healthy"
else
    echo "❌ API health check failed"
    exit 1
fi

echo "Running integration tests..."
npm run test:integration

echo "✅ Deployment validation completed successfully"
```

## 🔐 安全性考量

### 秘密管理
```bash
# 安全地存儲機密
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# 在 azure.yaml 中參考機密
```

```yaml
services:
  api:
    secrets:
      - name: database-password
        value: ${DATABASE_PASSWORD}
      - name: jwt-secret
        value: ${JWT_SECRET}
```

### 網路安全
```yaml
# azure.yaml - Configure network security
infra:
  parameters:
    enablePrivateEndpoints: true
    allowedIPs:
      - "203.0.113.0/24"  # Office IP range
      - "198.51.100.0/24" # VPN IP range
```

### 身分識別與存取管理
```yaml
services:
  api:
    project: ./src/api
    host: containerapp
    identity:
      type: systemAssigned
    keyVault:
      - name: app-secrets
        secrets:
          - database-connection
          - external-api-key
```

## 🚨 回滾策略

### 快速回滾
```bash
# AZD 沒有內建回滾功能。建議的方法：

# 選項 1：從 Git 重新部署（推薦）
git revert HEAD  # 還原有問題的提交
git push
azd deploy

# 選項 2：重新部署特定的提交
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### 基礎架構回滾
```bash
# 在套用前預覽基礎設施變更
azd provision --preview

# 如需回滾基礎設施，請使用版本控制：
git revert HEAD  # 還原基礎設施變更
azd provision    # 套用先前的基礎設施狀態
```

### 資料庫遷移回滾
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 部署指標

### 追蹤部署效能
```bash
# 查看當前部署狀態
azd show

# 使用 Application Insights 監控應用程式
azd monitor --overview

# 查看即時指標
azd monitor --live
```

### 自訂指標收集
```yaml
# azure.yaml - Configure custom metrics
hooks:
  postdeploy:
    shell: sh
    run: |
      # Record deployment metrics
      DEPLOY_TIME=$(date +%s)
      SERVICE_COUNT=$(azd show --output json | jq '.services | length')
      
      # Send to monitoring system
      curl -X POST "https://metrics.company.com/deployments" \
        -H "Content-Type: application/json" \
        -d "{\"timestamp\": $DEPLOY_TIME, \"service_count\": $SERVICE_COUNT}"
```

## 🎯 最佳實踐

### 1. 環境一致性
```bash
# 使用一致的命名
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# 維持環境一致性
./scripts/sync-environments.sh
```

### 2. 基礎架構驗證
```bash
# 部署前預覽基礎架構變更
azd provision --preview

# 使用 ARM/Bicep 語法檢查
az bicep lint --file infra/main.bicep

# 驗證 Bicep 語法
az bicep build --file infra/main.bicep
```

### 3. 測試整合
```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      # Unit tests
      npm run test:unit
      
      # Security scanning
      npm audit
      
      # Code quality checks
      npm run lint
      npm run type-check
      
  postdeploy:
    shell: sh
    run: |
      # Integration tests
      npm run test:integration
      
      # Performance tests
      npm run test:performance
      
      # Smoke tests
      npm run test:smoke
```

### 4. 文件與日誌
```bash
# 文件化部署程序
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## 後續步驟

- [資源佈建](provisioning.md) - 深入瞭解基礎架構管理
- [部署前規劃](../chapter-06-pre-deployment/capacity-planning.md) - 制定部署策略
- [常見問題](../chapter-07-troubleshooting/common-issues.md) - 解決部署問題
- [最佳實務](../chapter-07-troubleshooting/debugging.md) - 生產就緒部署策略

## 🎯 實作部署練習

### 練習 1：增量部署工作流程（20 分鐘）
<strong>目標</strong>：掌握完整部署與增量部署的差異

```bash
# 初始部署
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# 記錄初始部署時間
echo "Full deployment: $(date)" > deployment-log.txt

# 進行程式碼變更
echo "// Updated $(date)" >> src/api/src/server.js

# 僅部署程式碼（快速）
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# 比較時間
cat deployment-log.txt

# 清理
azd down --force --purge
```

**成功標準：**
- [ ] 完整部署需時 5-15 分鐘
- [ ] 僅程式碼部署需時 2-5 分鐘
- [ ] 程式碼變更反映於部署應用程式
- [ ] 執行 `azd deploy` 後基礎架構無變動

<strong>學習成效</strong>：`azd deploy` 對程式碼變更比 `azd up` 快 50-70%

### 練習 2：自訂部署掛鉤（30 分鐘）
<strong>目標</strong>：實作部署前後自動化

```bash
# 建立預部署驗證腳本
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# 檢查測試是否通過
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# 檢查是否有未提交的變更
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# 建立部署後冒煙測試
cat > scripts/post-deploy-test.sh << 'EOF'
#!/bin/bash
echo "💨 Running smoke tests..."

WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')

if curl -f "$WEB_URL/health"; then
    echo "✅ Health check passed!"
else
    echo "❌ Health check failed!"
    exit 1
fi

echo "✅ Smoke tests completed!"
EOF

chmod +x scripts/post-deploy-test.sh

# 將 hooks 新增至 azure.yaml
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# 使用 hooks 測試部署
azd deploy
```

**成功標準：**
- [ ] 部署前腳本於部署前執行
- [ ] 測試失敗時中止部署
- [ ] 部署後煙霧測試驗證健康狀態
- [ ] 掛鉤以正確順序執行

### 練習 3：多環境部署策略（45 分鐘）
<strong>目標</strong>：實作分階段部署工作流程（開發 → 測試 → 生產）

```bash
# 建立部署腳本
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# 第一步驟：部署到開發環境
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# 第二步驟：部署到預備環境
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# 第三步驟：正式環境人工核准
echo "
✅ Dev and staging deployments successful!"
read -p "Deploy to production? (yes/no): " confirm

if [[ $confirm == "yes" ]]; then
    echo "
🎉 Step 3: Deploying to production..."
    azd env select production
    azd up --no-prompt
    
    echo "Running production smoke tests..."
    curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health
    
    echo "
✅ Production deployment completed!"
else
    echo "❌ Production deployment cancelled"
fi
EOF

chmod +x deploy-staged.sh

# 建立環境
azd env new dev
azd env new staging
azd env new production

# 執行分階段部署
./deploy-staged.sh
```

**成功標準：**
- [ ] 開發環境成功部署
- [ ] 測試環境成功部署
- [ ] 生產環境需人工核准
- [ ] 所有環境有正常的健康檢查
- [ ] 可於需要時回滾

### 練習 4：回滾策略（25 分鐘）
<strong>目標</strong>：實作並測試使用 Git 的部署回滾

```bash
# 部署 v1
azd env set APP_VERSION "1.0.0"
azd up

# 保存 v1 提交雜湊值
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# 部署帶有重大更改的 v2
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# 偵測失敗並回滾
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # 使用 git 回滾
    git revert HEAD --no-edit
    
    # 回滾環境
    azd env set APP_VERSION "1.0.0"
    
    # 重新部署 v1
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**成功標準：**
- [ ] 能偵測到部署失敗
- [ ] 回滾腳本會自動執行
- [ ] 應用程式恢復運作狀態
- [ ] 回滾後通過健康檢查

## 📊 部署指標追蹤

### 追蹤您的部署效能

```bash
# 建立部署指標腳本
cat > track-deployment.sh << 'EOF'
#!/bin/bash
START_TIME=$(date +%s)

azd deploy "$@"

END_TIME=$(date +%s)
DURATION=$((END_TIME - START_TIME))

echo "
📊 Deployment Metrics:"
echo "Duration: ${DURATION}s"
echo "Timestamp: $(date)"
echo "Environment: $(azd env get-value AZURE_ENV_NAME)"
echo "Services: $(azd show --output json | jq -r '.services | keys | join(", ")')"

# 記錄到檔案
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env get-value AZURE_ENV_NAME)" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# 使用它
./track-deployment.sh
```

**分析您的指標：**
```bash
# 查看部署歷史記錄
cat deployment-metrics.csv

# 計算平均部署時間
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## 額外資源

- [Azure Developer CLI 部署參考文件](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service 部署](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps 部署](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions 部署](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

<strong>導航</strong>
- <strong>上一課</strong>：[您的第一個專案](../chapter-01-foundation/first-project.md)
- <strong>下一課</strong>：[資源佈建](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：  
本文件係使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們致力於準確性，但請注意自動翻譯可能包含錯誤或不精確之處。原始文件的母語版本應被視為權威來源。如涉及重要資訊，建議採用專業人工翻譯。我們不對因使用此翻譯而產生的任何誤解或曲解負責。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->