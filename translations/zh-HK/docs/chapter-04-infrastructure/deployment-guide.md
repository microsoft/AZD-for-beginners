# 部署指南 - 精通 AZD 部署

**章節導覽：**
- **📚 課程首頁**: [AZD 入門](../../README.md)
- **📖 目前章節**: 第四章 - 基礎建設即程式碼與部署
- **⬅️ 上一章**: [第三章：設定](../chapter-03-configuration/configuration.md)
- **➡️ 下一章**: [資源佈建](provisioning.md)
- **🧩 本章其他內容**: [撰寫自訂範本](custom-templates.md)
- **🚀 下一章節**: [第五章：多代理 AI 解決方案](../../examples/retail-scenario.md)

## 介紹

本綜合指南涵蓋了使用 Azure Developer CLI 部署應用程式所需了解的所有內容，從基本的一鍵部署到具有自訂鉤子、多環境及 CI/CD 整合的高級生產場景。透過實作範例與最佳實務，掌握完整的部署生命週期。

## 學習目標

完成本指南後，您將能夠：
- 精通所有 Azure Developer CLI 部署指令與工作流程
- 了解從佈建到監控的完整部署生命週期
- 實作自訂部署鉤子以自動化前後部署作業
- 配置多個環境，使用環境特定參數
- 建立先進部署策略，包括藍綠部署與金絲雀部署
- 將 azd 部署整合到 CI/CD 管道與 DevOps 流程中

## 學習成果

完成後，您將能夠：
- 獨立執行及排解所有 azd 部署工作流程
- 設計並實作自訂部署自動化鉤子
- 配置具備適當安全性與監控的生產部署
- 管理複雜多環境的部署場景
- 優化部署效能及實作回滾策略
- 將 azd 部署整合到企業級 DevOps 作業中

## 部署概覽

Azure Developer CLI 提供多種部署指令：
- `azd up` - 完整工作流程（佈建 + 部署）
- `azd provision` - 僅建立/更新 Azure 資源
- `azd deploy` - 僅部署程式碼
- `azd package` - 建置並封裝應用程式

## 基本部署工作流程

### 完整部署（azd up）
新專案最常用工作流程：
```bash
# 從零開始部署所有東西
azd up

# 使用特定環境部署
azd up --environment production

# 使用自訂參數部署
azd up --parameter location=westus2 --parameter sku=P1v2
```

### 只佈建基礎設施
只需更新 Azure 資源時：
```bash
# 提供/更新基礎設施
azd provision

# 使用 dry-run 預覽更改
azd provision --preview

# 提供特定服務
azd provision --service database
```

### 僅程式碼部署
快速更新應用程式時：
```bash
# 部署所有服務
azd deploy

# 預期輸出：
# 正在部署服務 (azd deploy)
# - web：部署中... 完成
# - api：部署中... 完成
# 成功：您的部署於 2 分 15 秒內完成

# 部署特定服務
azd deploy --service web
azd deploy --service api

# 使用自訂編譯參數部署
azd deploy --service api --build-arg NODE_ENV=production

# 驗證部署
azd show --output json | jq '.services'
```

### ✅ 部署驗證

每次部署後，驗證成功：

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

**成功標準：**
- ✅ 所有服務顯示「運行中」狀態
- ✅ 健康端點回應 HTTP 200
- ✅ 過去 5 分鐘無錯誤日誌
- ✅ 應用程式能回應測試請求

## 🏗️ 了解部署流程

### 新手鉤子入門

<strong>鉤子</strong> 是 azd 在部署過程中特定時刻自動執行的指令—在佈建前後、部署程式碼前後，都可以設定。它們可協助自動化部署週邊的小工作：例如種子資料庫、執行遷移、建置資產或對線上應用做冒煙測試。

| 鉤子       | 執行時機              | 常見用途                 |
|------------|-----------------------|--------------------------|
| `preprovision`  | 資源建立前             | 驗證前置條件、登入註冊表    |
| `postprovision` | 資源建立後             | 設定資源、配置資料庫        |
| `predeploy`     | 程式碼部署前           | 建置前端資產、執行單元測試  |
| `postdeploy`    | 程式碼上線後           | 執行 DB 遷移、冒煙測試端點  |

鉤子設定在您的 `azure.yaml`。以下是最小範例，只在部署後印出訊息：

```yaml
# azure.yaml
hooks:
  postdeploy:
    shell: sh
    run: echo "Deployment finished! 🎉"
```

如此一來，下次執行 `azd up` 時，訊息會自動印出。您也可以單獨執行鉤子，不用整個部署，方便測試：

```bash
azd hooks run postdeploy
```

以下階段示意真實的鉤子操作（遷移、測試、驗證）示例。

### 階段 1：佈建前鉤子
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

### 階段 2：基礎設施佈建
- 讀取基礎設施範本（Bicep/Terraform）
- 建立或更新 Azure 資源
- 配置網路與安全性
- 設定監控與日誌紀錄

### 階段 3：佈建後鉤子
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

### 階段 4：應用程式封裝
- 建置應用程式程式碼
- 建立部署工件
- 針對目標平台封裝（容器、ZIP 檔等）

### 階段 5：部署前鉤子
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
- 將封裝應用部署到 Azure 服務
- 更新組態設定
- 啟動/重啟服務

### 階段 7：部署後鉤子
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

### 鉤子錯誤處理

預設情況下，<strong>如果鉤子指令以非零代碼結束，azd 將停止整個流程。</strong>通常這是期待行為—遷移失敗應該停止部署，而不是部署壞掉的應用程式。但這表示鉤子要精心撰寫。

**1. 讓失敗明顯且有意義。** 鉤子最後一個指令回傳非零代碼即為失敗。在 shell 腳本中，加入 `set -e`，讓出錯後立刻停止鉤子，不要悄悄繼續執行：

```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      set -e                      # stop on the first error
      npm run test:unit           # if tests fail, the deploy halts here
      npm run db:migrate
```

**2. 允許鉤子失敗但不停止 azd。** 對於非關鍵步驟（非必要的快取預熱、盡力而為的通知），可設置 `continueOnError: true`。此時 azd 會記錄失敗但繼續執行：

```yaml
hooks:
  postdeploy:
    shell: sh
    continueOnError: true         # a failure here won't fail 'azd up'
    run: curl -f https://${WEB_URL}/warmup || echo "Warm-up skipped"
```

**3. 在完整執行前獨立測試鉤子。** 不必跑 `azd up` 來除錯，可單獨執行鉤子迅速迭代：

```bash
azd hooks run predeploy          # 僅執行 predeploy 鉤子
azd hooks run postdeploy --service api
```

**4. 注意作業系統特定的 shell。** 使用 `shell: pwsh` 的鉤子，需要執行機器（包括 CI 代理）安裝 PowerShell。使用 `shell: sh` 以達到最佳跨平台相容性，或同時提供 `windows` 與 `posix` 版本：

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

> **除錯小技巧：** 執行任何 azd 指令時加 `--debug`，可看到鉤子指令行與完整輸出，當鉤子在本機能執行但在 CI 失敗時非常有用。

## 🎛️ 部署設定

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

### 環境特定組態
```bash
# 開發環境
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# 預備環境
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

## 🔧 進階部署場景

### 多服務應用
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

### 逐步部署
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

### Container App 部署
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

## ⚡ 效能提升

### 服務特定部署
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
# 使用 azd deploy（不是 azd up）進行純代碼更改
# 這會跳過基礎設施配置，速度更快
azd deploy

# 部署特定服務以實現最快迭代
azd deploy --service api
```

## 🔍 部署監控

### 即時部署監控
```bash
# 實時監控應用程式
azd monitor --live

# 查看應用程式日誌
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

### 秘密管理
```bash
# 安全地儲存秘密資訊
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# 在 azure.yaml 中引用秘密資訊
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
# AZD 冇內置回滾功能。建議方法：

# 選項 1：從 Git 重新部署（建議）
git revert HEAD  # 還原有問題嘅提交
git push
azd deploy

# 選項 2：重新部署特定嘅提交
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### 基礎設施回滾
```bash
# 套用前預覽基礎建設變更
azd provision --preview

# 如需基礎建設回退，請使用版本控制：
git revert HEAD  # 還原基礎建設變更
azd provision    # 套用先前的基礎建設狀態
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
# 檢視當前部署狀態
azd show

# 使用 Application Insights 監控應用程式
azd monitor --overview

# 檢視即時度量指標
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

### 2. 基礎設施驗證
```bash
# 部署前預覽基礎設施變更
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
# 紀錄部署程序
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## 下一步

- [資源佈建](provisioning.md) - 深入基礎設施管理
- [部署前規劃](../chapter-06-pre-deployment/capacity-planning.md) - 規劃您的部署策略
- [常見問題](../chapter-07-troubleshooting/common-issues.md) - 解決部署問題
- [最佳實務](../chapter-07-troubleshooting/debugging.md) - 生產環境部署策略

## 🎯 實務部署練習

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

**成功標準：**
- [ ] 完整部署耗時 5-15 分鐘
- [ ] 僅程式碼部署耗時 2-5 分鐘
- [ ] 程式碼修改反映在部署後的應用程式
- [ ] `azd deploy` 後，基礎設施未改變

<strong>學習成果</strong>：`azd deploy` 程式碼變更比 `azd up` 快 50-70%

### 練習 2：自訂部署鉤子（30 分鐘）
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

# 檢查未提交的更改
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

# 將掛鉤加入 azure.yaml
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# 用掛鉤測試部署
azd deploy
```

**成功標準：**
- [ ] 部署前腳本執行成功
- [ ] 測試失敗中止部署
- [ ] 部署後的冒煙測試驗證健康狀況
- [ ] 鉤子按正確順序執行

### 練習 3：多環境部署策略（45 分鐘）
<strong>目標</strong>：實作分階段部署工作流程（開發 → 預備 → 生產）

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

# 第二步：部署到預備環境
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# 第三步：生產環境手動批准
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
- [ ] 預備環境部署成功
- [ ] 生產環境需手動核准
- [ ] 所有環境都有運作中的健康檢查
- [ ] 需要時能回滾

### 練習 4：回滾策略（25 分鐘）
<strong>目標</strong>：使用 Git 實作並測試部署回滾

```bash
# 部署 v1
azd env set APP_VERSION "1.0.0"
azd up

# 保存 v1 提交哈希值
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# 部署包含破壞性更改的 v2
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# 檢測失敗並回滾
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
- [ ] 能偵測部署失敗
- [ ] 回滾腳本自動執行
- [ ] 應用程式恢復正常運作狀態
- [ ] 回滾後健康檢查通過

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

- [Azure Developer CLI 部署參考](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service 部署](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps 部署](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions 部署](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

<strong>導覽</strong>
- <strong>上一課</strong>: [您的第一個專案](../chapter-01-foundation/first-project.md)
- <strong>下一課</strong>: [資源佈建](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件由 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻譯而成。雖然我們致力於確保準確性，但請注意，機器自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議進行專業人工翻譯。我們不對因使用本翻譯而產生的任何誤解或誤釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->