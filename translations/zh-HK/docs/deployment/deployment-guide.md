# 部署指南 - 精通 AZD 部署

**章節導航：**
- **📚 課程主頁**: [AZD 初學者指南](../../README.md)
- **📖 當前章節**: 第四章 - 基礎設施即代碼與部署
- **⬅️ 上一章**: [第三章：配置](../getting-started/configuration.md)
- **➡️ 下一步**: [資源配置](provisioning.md)
- **🚀 下一章**: [第五章：多代理 AI 解決方案](../../examples/retail-scenario.md)

## 簡介

這份全面的指南涵蓋了使用 Azure Developer CLI 部署應用程式所需的一切，從基本的單指令部署到包含自定義掛鉤、多環境及 CI/CD 整合的高級生產場景。透過實用範例和最佳實踐，掌握完整的部署生命週期。

## 學習目標

完成本指南後，您將能夠：
- 精通所有 Azure Developer CLI 部署指令及工作流程
- 理解從資源配置到監控的完整部署生命週期
- 實現自定義部署掛鉤以進行部署前後的自動化
- 配置多環境並使用環境特定參數
- 設置高級部署策略，包括藍綠部署和金絲雀部署
- 將 azd 部署整合到 CI/CD 管道和 DevOps 工作流程中

## 學習成果

完成後，您將能夠：
- 獨立執行並排除所有 azd 部署工作流程的故障
- 設計並實現使用掛鉤的自定義部署自動化
- 配置具備安全性和監控的生產就緒部署
- 管理複雜的多環境部署場景
- 優化部署效能並實現回滾策略
- 將 azd 部署整合到企業 DevOps 實踐中

## 部署概述

Azure Developer CLI 提供多種部署指令：
- `azd up` - 完整工作流程（配置 + 部署）
- `azd provision` - 僅創建/更新 Azure 資源
- `azd deploy` - 僅部署應用程式代碼
- `azd package` - 構建並打包應用程式

## 基本部署工作流程

### 完整部署（azd up）
新項目最常用的工作流程：
```bash
# 從頭開始部署所有內容
azd up

# 使用特定環境進行部署
azd up --environment production

# 使用自定義參數進行部署
azd up --parameter location=westus2 --parameter sku=P1v2
```

### 僅配置基礎設施
當您只需更新 Azure 資源時：
```bash
# 提供/更新基礎設施
azd provision

# 使用乾跑模式提供以預覽更改
azd provision --preview

# 提供特定服務
azd provision --service database
```

### 僅代碼部署
快速更新應用程式時：
```bash
# 部署所有服務
azd deploy

# 預期輸出：
# 正在部署服務 (azd deploy)
# - web: 正在部署... 完成
# - api: 正在部署... 完成
# 成功：您的部署在 2 分 15 秒內完成

# 部署特定服務
azd deploy --service web
azd deploy --service api

# 使用自定義構建參數進行部署
azd deploy --service api --build-arg NODE_ENV=production

# 驗證部署
azd show --output json | jq '.services'
```

### ✅ 部署驗證

每次部署後，驗證成功：

```bash
# 檢查所有服務是否正在運行
azd show

# 測試健康端點
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# 檢查日誌是否有錯誤
azd logs --service api --since 5m | grep -i error
```

**成功標準：**
- ✅ 所有服務顯示「運行中」狀態
- ✅ 健康檢查端點返回 HTTP 200
- ✅ 最近 5 分鐘內無錯誤日誌
- ✅ 應用程式對測試請求有回應

## 🏗️ 理解部署過程

### 階段 1：配置前掛鉤
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

### 階段 2：基礎設施配置
- 讀取基礎設施模板（Bicep/Terraform）
- 創建或更新 Azure 資源
- 配置網絡和安全性
- 設置監控和日誌記錄

### 階段 3：配置後掛鉤
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
- 構建應用程式代碼
- 創建部署工件
- 為目標平台打包（容器、ZIP 文件等）

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
- 將打包的應用程式部署到 Azure 服務
- 更新配置設置
- 啟動/重啟服務

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

## 🎛️ 部署配置

### 特定服務的部署設置
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

### 特定環境的配置
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

## 🔧 高級部署場景

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

# 將流量切換至藍色（手動更新 DNS/負載平衡器）
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
# 部署已分階段的腳本.sh

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

## ⚡ 性能優化

### 並行部署
```bash
# 配置平行部署
azd config set deploy.parallelism 5

# 平行部署服務
azd deploy --parallel
```

### 構建緩存
```yaml
# azure.yaml - Enable build caching
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    buildCache:
      enabled: true
      paths:
        - node_modules
        - .next/cache
```

### 增量部署
```bash
# 只部署已更改的服務
azd deploy --incremental

# 使用更改檢測進行部署
azd deploy --detect-changes
```

## 🔍 部署監控

### 實時部署監控
```bash
# 監察部署進度
azd deploy --follow

# 查看部署日誌
azd logs --follow --service api

# 檢查部署狀態
azd show --service api
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

# 檢查應用程式健康狀況
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

## 🔐 安全考量

### 機密管理
```bash
# 安全地存儲秘密
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# 在 azure.yaml 中引用秘密
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

### 網絡安全
```yaml
# azure.yaml - Configure network security
infra:
  parameters:
    enablePrivateEndpoints: true
    allowedIPs:
      - "203.0.113.0/24"  # Office IP range
      - "198.51.100.0/24" # VPN IP range
```

### 身份和訪問管理
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
# 回退至之前的部署
azd deploy --rollback

# 回退特定服務
azd deploy --service api --rollback

# 回退至特定版本
azd deploy --service api --version v1.2.3
```

### 基礎設施回滾
```bash
# 回退基礎設施更改
azd provision --rollback

# 預覽回退更改
azd provision --rollback --preview
```

### 數據庫遷移回滾
```bash
#!/bin/bash
# scripts/回滾數據庫.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 部署指標

### 跟蹤部署性能
```bash
# 啟用部署指標
azd config set telemetry.deployment.enabled true

# 查看部署歷史
azd history

# 獲取部署統計數據
azd metrics --type deployment
```

### 自定義指標收集
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

### 2. 基礎設施驗證
```bash
# 部署前進行驗證
azd provision --preview
azd provision --what-if

# 使用 ARM/Bicep 語法檢查
az bicep lint --file infra/main.bicep
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

### 4. 文檔和日誌記錄
```bash
# 記錄部署程序
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## 下一步

- [資源配置](provisioning.md) - 深入了解基礎設施管理
- [部署前規劃](../pre-deployment/capacity-planning.md) - 規劃您的部署策略
- [常見問題](../troubleshooting/common-issues.md) - 解決部署問題
- [最佳實踐](../troubleshooting/debugging.md) - 生產就緒的部署策略

## 🎯 實踐部署練習

### 練習 1：增量部署工作流程（20 分鐘）
**目標**：掌握完整部署與增量部署的區別

```bash
# 初始部署
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# 記錄初始部署時間
echo "Full deployment: $(date)" > deployment-log.txt

# 進行代碼更改
echo "// Updated $(date)" >> src/api/src/server.js

# 只部署代碼（快速）
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# 比較時間
cat deployment-log.txt

# 清理
azd down --force --purge
```

**成功標準：**
- [ ] 完整部署需時 5-15 分鐘
- [ ] 僅代碼部署需時 2-5 分鐘
- [ ] 代碼更改反映在已部署的應用程式中
- [ ] 基礎設施在 `azd deploy` 後保持不變

**學習成果**：對於代碼更改，`azd deploy` 比 `azd up` 快 50-70%

### 練習 2：自定義部署掛鉤（30 分鐘）
**目標**：實現部署前後的自動化

```bash
# 建立部署前驗證腳本
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# 檢查測試是否通過
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# 檢查未提交的更改
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# 建立部署後煙霧測試
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

# 添加掛鉤到azure.yaml
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# 使用掛鉤測試部署
azd deploy
```

**成功標準：**
- [ ] 部署前腳本在部署前執行
- [ ] 測試失敗時部署中止
- [ ] 部署後煙霧測試驗證健康狀態
- [ ] 掛鉤按正確順序執行

### 練習 3：多環境部署策略（45 分鐘）
**目標**：實現分階段部署工作流程（開發 → 測試 → 生產）

```bash
# 建立部署腳本
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# 第一步：部署到開發環境
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# 第二步：部署到測試環境
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# 第三步：手動批准部署到生產環境
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
- [ ] 開發環境部署成功
- [ ] 測試環境部署成功
- [ ] 生產環境需手動批准
- [ ] 所有環境均通過健康檢查
- [ ] 可在需要時回滾

### 練習 4：回滾策略（25 分鐘）
**目標**：實現並測試部署回滾

```bash
# 部署 v1
azd env set APP_VERSION "1.0.0"
azd up

# 儲存 v1 配置
cp -r .azure/production .azure/production-v1-backup

# 部署 v2 並包含重大更改
echo "throw new Error('Intentional break')" >> src/api/src/server.js
azd env set APP_VERSION "2.0.0"
azd deploy

# 偵測故障
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # 回滾代碼
    git checkout src/api/src/server.js
    
    # 回滾環境
    azd env set APP_VERSION "1.0.0"
    
    # 重新部署 v1
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**成功標準：**
- [ ] 能檢測部署失敗
- [ ] 回滾腳本自動執行
- [ ] 應用程式恢復到工作狀態
- [ ] 回滾後健康檢查通過

## 📊 部署指標跟蹤

### 跟蹤您的部署性能

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
echo "Environment: $(azd env show --output json | jq -r '.name')"
echo "Services: $(azd show --output json | jq -r '.services | keys | join(", ")')"

# 記錄到檔案
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env show --output json | jq -r '.name')" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# 使用它
./track-deployment.sh
```

**分析您的指標：**
```bash
# 查看部署歷史
cat deployment-metrics.csv

# 計算平均部署時間
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## 其他資源

- [Azure Developer CLI 部署參考](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service 部署](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure 容器應用程式部署](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions 部署](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**導航**
- **上一課**: [您的第一個項目](../getting-started/first-project.md)
- **下一課**: [資源配置](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：  
此文件已使用人工智能翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們致力於提供準確的翻譯，但請注意，自動翻譯可能包含錯誤或不準確之處。原始語言的文件應被視為權威來源。對於重要資訊，建議使用專業人工翻譯。我們對因使用此翻譯而引起的任何誤解或誤釋不承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->