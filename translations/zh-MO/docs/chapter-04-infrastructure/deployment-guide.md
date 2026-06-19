# 部署指南 - 精通 AZD 部署

**章節導覽：**
- **📚 課程首頁**: [AZD 入門](../../README.md)
- **📖 目前章節**: 第 4 章 - 基礎架構即程式碼與部署
- **⬅️ 上一章**: [第 3 章：組態](../chapter-03-configuration/configuration.md)
- **➡️ 下一章**: [資源佈建](provisioning.md)
- **🧩 本章亦包含**: [撰寫自訂範本](custom-templates.md)
- **🚀 下一章**: [第 5 章：多代理 AI 解決方案](../../examples/retail-scenario.md)

## 介紹

本綜合指南涵蓋使用 Azure Developer CLI 部署應用程式所需知道的一切，從基本的一鍵部署到具有自訂 hooks、多環境與 CI/CD 整合的進階生產情境。透過實作範例與最佳實務，掌握完整部署生命週期。

## 學習目標

完成本指南後，你將能夠：
- 精通所有 Azure Developer CLI 的部署命令與工作流程
- 了解從佈建到監控的完整部署生命週期
- 實作用於部署前後自動化的自訂部署 hooks
- 為多個環境設定環境專屬參數
- 設定包括藍綠與金絲雀在內的進階部署策略
- 將 azd 部署整合到 CI/CD 管道與 DevOps 工作流程

## 學習成果

完成後，你將能：
- 獨立執行與故障排除所有 azd 部署工作流程
- 以 hooks 設計並實作自訂部署自動化
- 設定具生產就緒性的部署，包含適當的安全性與監控
- 管理複雜的多環境部署情境
- 優化部署效能並實作回滾策略
- 將 azd 部署整合到企業級 DevOps 實務中

## 部署概覽

Azure Developer CLI 提供以下幾個部署命令：
- `azd up` - 完整工作流程（佈建 + 部署）
- `azd provision` - 只建立/更新 Azure 資源
- `azd deploy` - 只部署應用程式程式碼
- `azd package` - 建置並打包應用程式

## 基本部署工作流程

### Complete Deployment (azd up)
這是新專案最常見的工作流程：
```bash
# 從零開始部署所有項目
azd up

# 使用指定環境部署
azd up --environment production

# 使用自訂參數部署
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Infrastructure-Only Deployment
當你只需更新 Azure 資源時：
```bash
# 部署/更新基礎設施
azd provision

# 以模擬執行（dry-run）方式部署以預覽變更
azd provision --preview

# 部署特定服務
azd provision --service database
```

### Code-Only Deployment
用於快速更新應用程式：
```bash
# 部署所有服務
azd deploy

# 預期輸出：
# 正在部署服務 (azd deploy)
# - web: 正在部署... 完成
# - api: 正在部署... 完成
# 成功：你的部署已在 2 分鐘 15 秒內完成

# 部署特定服務
azd deploy --service web
azd deploy --service api

# 使用自訂建置參數部署
azd deploy --service api --build-arg NODE_ENV=production

# 驗證部署
azd show --output json | jq '.services'
```

### ✅ 部署驗證

在任何部署後，驗證是否成功：

```bash
# 檢查所有服務是否正在運行
azd show

# 測試健康檢查端點
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# 監控錯誤（預設會在瀏覽器中打開）
azd monitor --logs
```

**成功準則：**
- ✅ 所有服務顯示「Running」狀態
- ✅ 健康檢查端點回傳 HTTP 200
- ✅ 過去 5 分鐘內沒有錯誤日誌
- ✅ 應用程式對測試請求有回應

## 🏗️ 了解部署流程

### 不熟悉 hooks？從這裡開始

一個 **hook** 是 azd 在部署流程中某個特定時刻會自動執行的命令—在佈建之前或之後，以及在部署程式碼之前或之後。它們讓你自動化總是伴隨部署發生的小工作：初始化資料庫、執行遷移、建置資產，或對上線應用做煙霧測試。

| Hook | 執行時機… | 常見用途 |
|------|-------|------------|
| `preprovision` | 在建立資源之前 | 驗證先決條件，登入註冊表 |
| `postprovision` | 在資源建立後 | 設定資源，設定資料庫 |
| `predeploy` | 在程式碼部署前 | 建置前端資產，執行單元測試 |
| `postdeploy` | 在程式碼上線後 | 執行資料庫遷移，對端點做煙霧測試 |

Hooks 存放在你的 `azure.yaml`。以下是最小的範例—它只會在部署後列印一則訊息：

```yaml
# azure.yaml
hooks:
  postdeploy:
    shell: sh
    run: echo "Deployment finished! 🎉"
```

就是這樣—下次你執行 `azd up` 時，訊息會自動列印。你也可以單獨執行某個 hook，而不需要完整部署，這對測試很有幫助：

```bash
azd hooks run postdeploy
```

下面各階段示範了實際會用到的 hooks（遷移、測試、驗證）。

### 階段 1：佈建前 Hooks
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
- 讀取基礎架構範本 (Bicep/Terraform)
- 建立或更新 Azure 資源
- 設定網路與安全性
- 設定監控與日誌

### 階段 3：佈建後 Hooks
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
- 建立部署產物
- 針對目標平台打包（容器、ZIP 檔案等）

### 階段 5：部署前 Hooks
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
- 將打包好的應用部署到 Azure 服務
- 更新組態設定
- 啟動/重新啟動服務

### 階段 7：部署後 Hooks
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

### 處理 Hook 錯誤

預設情況下，**如果某個 hook 命令以非零代碼結束，azd 會停止整個操作。** 這通常是你想要的——失敗的遷移應該中止部署，而不是發佈壞掉的應用程式。但這也表示 hooks 需要小心撰寫。

**1. 讓失敗明顯且是預期的。** 當最後一個命令回傳非零退出代碼時，hook 就會失敗。在 shell 腳本中加入 `set -e`，讓 hook 在第一個失敗的命令即停止，而不是默默繼續：

```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      set -e                      # stop on the first error
      npm run test:unit           # if tests fail, the deploy halts here
      npm run db:migrate
```

**2. 允許 hook 失敗但不停止 azd。** 對於非關鍵步驟（例如可選的快取預熱、盡力而為的通知），設定 `continueOnError: true`。azd 會記錄失敗但繼續執行：

```yaml
hooks:
  postdeploy:
    shell: sh
    continueOnError: true         # a failure here won't fail 'azd up'
    run: curl -f https://${WEB_URL}/warmup || echo "Warm-up skipped"
```

**3. 在完整執行前先孤立測試 hooks。** 你不必執行 `azd up` 來除錯 hook—可以單獨執行它並快速反覆測試：

```bash
azd hooks run predeploy          # 只執行 predeploy 鉤子
azd hooks run postdeploy --service api
```

**4. 注意作業系統專屬的 shell。** 使用 `shell: pwsh` 的 hook 需要在執行該 hook 的機器（包含 CI 代理）上安裝 PowerShell。為了最大相容性，使用 `shell: sh`，或提供 `windows` 與 `posix` 的變體：

```yaml
hooks:
  postprovision:
    posix:
      shell: sh
      run: ./scripts/setup.sh
    windows:
      shell: pwsh
      run: ./scripts/setup.ps1
```

> **除錯提示：** 使用 `--debug` 執行任何 azd 命令，可看到精確的 hook 命令列與完整輸出—當 hook 在本機能運作但在 CI 失敗時非常有用。

## 🎛️ 部署設定

### 服務專屬部署設定
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

### 環境專屬設定
```bash
# 開發環境
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# 預發環境
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

## 🔧 進階部署情境

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

### 階段式部署
```bash
#!/bin/bash
# deploy-staged.sh

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

### 容器應用部署
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

### 服務專屬部署
```bash
# 部署指定服務以加快迭代速度
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
# 對於只有程式碼的變更，請使用 azd deploy（不要使用 azd up）
# 這會跳過基礎設施佈署，速度會快得多
azd deploy

# 部署特定服務以加快迭代速度
azd deploy --service api
```

## 🔍 部署監控

### 即時部署監控
```bash
# 即時監控應用程式
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

# 檢查應用程式的健康狀態
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

### 機密管理
```bash
# 安全地儲存機密
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# 在 azure.yaml 中引用機密
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

### 身分與存取管理
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
# AZD 沒有內建回滾。建議的方法：

# Option 1: 從 Git 重新部署（建議）
git revert HEAD  # 還原有問題的提交
git push
azd deploy

# Option 2: 重新部署特定的提交
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### 基礎架構回滾
```bash
# 在套用前預覽基礎架構變更
azd provision --preview

# 若要回滾基礎架構，請使用版本控制：
git revert HEAD  # 回滾基礎架構變更
azd provision    # 套用先前的基礎架構狀態
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
# 檢視目前部署狀態
azd show

# 使用 Application Insights 監控應用程式
azd monitor --overview

# 檢視即時指標
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

## 🎯 最佳實務

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
# 在部署前預覽基礎設施變更
azd provision --preview

# 使用 ARM/Bicep 程式碼檢查
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
# 記錄部署程序
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## 下一步

- [資源佈建](provisioning.md) - 深入探討基礎架構管理
- [部署前規劃](../chapter-06-pre-deployment/capacity-planning.md) - 規劃你的部署策略
- [常見問題](../chapter-07-troubleshooting/common-issues.md) - 解決部署問題
- [最佳實務](../chapter-07-troubleshooting/debugging.md) - 生產就緒的部署策略

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

# 進行程式碼更改
echo "// Updated $(date)" >> src/api/src/server.js

# 僅部署程式碼（快速）
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# 比較時間
cat deployment-log.txt

# 清理
azd down --force --purge
```

**成功準則：**
- [ ] 完整部署耗時 5-15 分鐘
- [ ] 只部署程式碼耗時 2-5 分鐘
- [ ] 程式碼變更反映在已部署的應用中
- [ ] 執行 `azd deploy` 後基礎架構不變

<strong>學習成果</strong>：對於程式碼變更，`azd deploy` 比 `azd up` 快 50-70%

### 練習 2：自訂部署 Hooks（30 分鐘）
<strong>目標</strong>：實作部署前後自動化

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

# 檢查是否有未提交的更改
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# 建立部署後的煙霧測試
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

# 將 hooks 新增到 azure.yaml
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

**成功準則：**
- [ ] 部署前腳本在部署前執行
- [ ] 若測試失敗則中止部署
- [ ] 部署後的煙霧測試驗證健康狀態
- [ ] Hooks 依正確順序執行

### 練習 3：多環境部署策略（45 分鐘）
<strong>目標</strong>：實作分階段部署工作流程（dev → staging → production）

```bash
# 建立部署腳本
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# 步驟 1：部署到開發環境
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# 步驟 2：部署到預備環境
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# 步驟 3：生產環境需要人工批准
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

**成功準則：**
- [ ] Dev 環境部署成功
- [ ] Staging 環境部署成功
- [ ] 正式環境需要人工核准
- [ ] 所有環境都有運作中的健康檢查
- [ ] 必要時可回滾

### 練習 4：回滾策略（25 分鐘）
<strong>目標</strong>：使用 Git 實作並測試部署回滾

```bash
# 部署 v1
azd env set APP_VERSION "1.0.0"
azd up

# 儲存 v1 的提交哈希值
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# 部署具有破壞性變更的 v2
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

**成功準則：**
- [ ] 能偵測部署失敗
- [ ] 回滾腳本會自動執行
- [ ] 應用程式回復到可運作狀態
- [ ] 回滾後健康檢查通過

## 📊 部署指標追蹤

### 追蹤你的部署效能

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

**分析你的指標：**
```bash
# 檢視部署歷史
cat deployment-metrics.csv

# 計算平均部署時間
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## 附加資源

- [Azure Developer CLI 部署參考](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service 部署](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps 部署](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions 部署](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

<strong>導覽</strong>
- <strong>上一課程</strong>: [你的第一個專案](../chapter-01-foundation/first-project.md)
- <strong>下一課程</strong>: [資源佈建](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們力求準確，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議尋求專業人工翻譯。我們不對因使用本翻譯而引起的任何誤解或曲解承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->