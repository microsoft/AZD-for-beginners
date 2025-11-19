<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6ae5503cd909d625f01efa4d9e99799e",
  "translation_date": "2025-11-19T13:28:07+00:00",
  "source_file": "docs/deployment/deployment-guide.md",
  "language_code": "zh"
}
-->
# 部署指南 - 精通 AZD 部署

**章节导航：**
- **📚 课程主页**：[AZD 初学者指南](../../README.md)
- **📖 当前章节**：第4章 - 基础设施即代码与部署
- **⬅️ 上一章**：[第3章：配置](../getting-started/configuration.md)
- **➡️ 下一步**：[资源预配](provisioning.md)
- **🚀 下一章**：[第5章：多代理 AI 解决方案](../../examples/retail-scenario.md)

## 简介

这份全面的指南涵盖了使用 Azure Developer CLI 部署应用程序的所有内容，从基本的单命令部署到具有自定义钩子、多环境和 CI/CD 集成的高级生产场景。通过实践示例和最佳实践，掌握完整的部署生命周期。

## 学习目标

完成本指南后，您将能够：
- 精通所有 Azure Developer CLI 部署命令和工作流程
- 了解从资源预配到监控的完整部署生命周期
- 实现自定义部署钩子，用于部署前后自动化
- 配置具有环境特定参数的多环境部署
- 设置高级部署策略，包括蓝绿部署和金丝雀部署
- 将 azd 部署与 CI/CD 管道和 DevOps 工作流集成

## 学习成果

完成后，您将能够：
- 独立执行和排查所有 azd 部署工作流程
- 设计并实现使用钩子的自定义部署自动化
- 配置具有适当安全性和监控的生产级部署
- 管理复杂的多环境部署场景
- 优化部署性能并实施回滚策略
- 将 azd 部署集成到企业 DevOps 实践中

## 部署概述

Azure Developer CLI 提供了多个部署命令：
- `azd up` - 完整工作流程（预配 + 部署）
- `azd provision` - 仅创建/更新 Azure 资源
- `azd deploy` - 仅部署应用程序代码
- `azd package` - 构建和打包应用程序

## 基本部署工作流程

### 完整部署（azd up）
新项目最常用的工作流程：
```bash
# 从头开始部署所有内容
azd up

# 使用特定环境进行部署
azd up --environment production

# 使用自定义参数进行部署
azd up --parameter location=westus2 --parameter sku=P1v2
```

### 仅基础设施部署
当您只需要更新 Azure 资源时：
```bash
# 提供/更新基础设施
azd provision

# 使用干运行预览更改
azd provision --preview

# 提供特定服务
azd provision --service database
```

### 仅代码部署
用于快速更新应用程序：
```bash
# 部署所有服务
azd deploy

# 预期输出:
# 正在部署服务 (azd deploy)
# - web: 部署中... 完成
# - api: 部署中... 完成
# 成功: 您的部署在2分15秒内完成

# 部署特定服务
azd deploy --service web
azd deploy --service api

# 使用自定义构建参数进行部署
azd deploy --service api --build-arg NODE_ENV=production

# 验证部署
azd show --output json | jq '.services'
```

### ✅ 部署验证

每次部署后，验证成功：

```bash
# 检查所有服务是否正在运行
azd show

# 测试健康端点
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# 检查日志中的错误
azd logs --service api --since 5m | grep -i error
```

**成功标准：**
- ✅ 所有服务显示“运行中”状态
- ✅ 健康检查端点返回 HTTP 200
- ✅ 最近5分钟内无错误日志
- ✅ 应用程序响应测试请求

## 🏗️ 理解部署过程

### 阶段1：预预配钩子
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

### 阶段2：基础设施预配
- 读取基础设施模板（Bicep/Terraform）
- 创建或更新 Azure 资源
- 配置网络和安全性
- 设置监控和日志记录

### 阶段3：后预配钩子
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

### 阶段4：应用程序打包
- 构建应用程序代码
- 创建部署工件
- 为目标平台打包（容器、ZIP 文件等）

### 阶段5：预部署钩子
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

### 阶段6：应用程序部署
- 将打包的应用程序部署到 Azure 服务
- 更新配置设置
- 启动/重启服务

### 阶段7：后部署钩子
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

### 服务特定的部署设置
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

### 环境特定的配置
```bash
# 开发环境
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# 测试环境
azd env new staging
azd env set NODE_ENV staging
azd env set DEBUG false
azd env set LOG_LEVEL info

# 生产环境
azd env new production
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL error
```

## 🔧 高级部署场景

### 多服务应用程序
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

### 蓝绿部署
```bash
# 创建蓝色环境
azd env new production-blue
azd up --environment production-blue

# 测试蓝色环境
./scripts/test-environment.sh production-blue

# 将流量切换到蓝色（手动更新DNS/负载均衡器）
./scripts/switch-traffic.sh production-blue

# 清理绿色环境
azd env select production-green
azd down --force
```

### 金丝雀部署
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

### 分阶段部署
```bash
#!/bin/bash
# 部署分阶段脚本.sh

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

### 容器应用程序部署
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

### 多阶段 Dockerfile 优化
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

## ⚡ 性能优化

### 并行部署
```bash
# 配置并行部署
azd config set deploy.parallelism 5

# 并行部署服务
azd deploy --parallel
```

### 构建缓存
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
# 仅部署已更改的服务
azd deploy --incremental

# 使用变更检测进行部署
azd deploy --detect-changes
```

## 🔍 部署监控

### 实时部署监控
```bash
# 监控部署进度
azd deploy --follow

# 查看部署日志
azd logs --follow --service api

# 检查部署状态
azd show --service api
```

### 健康检查
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

### 部署后验证
```bash
#!/bin/bash
# scripts/validate-deployment.sh

echo "Validating deployment..."

# 检查应用程序健康状况
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

## 🔐 安全注意事项

### 密钥管理
```bash
# 安全存储机密
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# 在azure.yaml中引用机密
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

### 网络安全
```yaml
# azure.yaml - Configure network security
infra:
  parameters:
    enablePrivateEndpoints: true
    allowedIPs:
      - "203.0.113.0/24"  # Office IP range
      - "198.51.100.0/24" # VPN IP range
```

### 身份和访问管理
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

## 🚨 回滚策略

### 快速回滚
```bash
# 回滚到之前的部署
azd deploy --rollback

# 回滚特定服务
azd deploy --service api --rollback

# 回滚到特定版本
azd deploy --service api --version v1.2.3
```

### 基础设施回滚
```bash
# 回滚基础设施更改
azd provision --rollback

# 预览回滚更改
azd provision --rollback --preview
```

### 数据库迁移回滚
```bash
#!/bin/bash
# scripts/回滚数据库.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 部署指标

### 跟踪部署性能
```bash
# 启用部署指标
azd config set telemetry.deployment.enabled true

# 查看部署历史
azd history

# 获取部署统计数据
azd metrics --type deployment
```

### 自定义指标收集
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

## 🎯 最佳实践

### 1. 环境一致性
```bash
# 使用一致的命名
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# 保持环境一致性
./scripts/sync-environments.sh
```

### 2. 基础设施验证
```bash
# 部署前验证
azd provision --preview
azd provision --what-if

# 使用ARM/Bicep代码检查
az bicep lint --file infra/main.bicep
```

### 3. 测试集成
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

### 4. 文档和日志记录
```bash
# 记录部署流程
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## 下一步

- [资源预配](provisioning.md) - 深入了解基础设施管理
- [部署前规划](../pre-deployment/capacity-planning.md) - 规划您的部署策略
- [常见问题](../troubleshooting/common-issues.md) - 解决部署问题
- [最佳实践](../troubleshooting/debugging.md) - 生产级部署策略

## 🎯 实践部署练习

### 练习1：增量部署工作流程（20分钟）
**目标**：掌握完整部署与增量部署的区别

```bash
# 初始部署
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# 记录初始部署时间
echo "Full deployment: $(date)" > deployment-log.txt

# 进行代码更改
echo "// Updated $(date)" >> src/api/src/server.js

# 仅部署代码（快速）
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# 比较时间
cat deployment-log.txt

# 清理
azd down --force --purge
```

**成功标准：**
- [ ] 完整部署耗时5-15分钟
- [ ] 仅代码部署耗时2-5分钟
- [ ] 代码更改反映在已部署的应用程序中
- [ ] 基础设施在 `azd deploy` 后保持不变

**学习成果**：对于代码更改，`azd deploy` 比 `azd up` 快50-70%

### 练习2：自定义部署钩子（30分钟）
**目标**：实现部署前后自动化

```bash
# 创建预部署验证脚本
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# 检查测试是否通过
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# 检查未提交的更改
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# 创建部署后冒烟测试
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

# 将钩子添加到azure.yaml
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# 使用钩子测试部署
azd deploy
```

**成功标准：**
- [ ] 部署前脚本在部署前运行
- [ ] 如果测试失败，部署中止
- [ ] 部署后烟雾测试验证健康状态
- [ ] 钩子按正确顺序执行

### 练习3：多环境部署策略（45分钟）
**目标**：实现分阶段部署工作流程（开发 → 测试 → 生产）

```bash
# 创建部署脚本
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# 第一步：部署到开发环境
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# 第二步：部署到预生产环境
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# 第三步：手动批准生产环境部署
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

# 创建环境
azd env new dev
azd env new staging
azd env new production

# 运行分阶段部署
./deploy-staged.sh
```

**成功标准：**
- [ ] 开发环境部署成功
- [ ] 测试环境部署成功
- [ ] 生产环境需要手动批准
- [ ] 所有环境均通过健康检查
- [ ] 可在需要时回滚

### 练习4：回滚策略（25分钟）
**目标**：实现并测试部署回滚

```bash
# 部署 v1
azd env set APP_VERSION "1.0.0"
azd up

# 保存 v1 配置
cp -r .azure/production .azure/production-v1-backup

# 部署带有重大更改的 v2
echo "throw new Error('Intentional break')" >> src/api/src/server.js
azd env set APP_VERSION "2.0.0"
azd deploy

# 检测故障
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # 回滚代码
    git checkout src/api/src/server.js
    
    # 回滚环境
    azd env set APP_VERSION "1.0.0"
    
    # 重新部署 v1
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**成功标准：**
- [ ] 能检测到部署失败
- [ ] 回滚脚本自动执行
- [ ] 应用程序恢复到工作状态
- [ ] 回滚后健康检查通过

## 📊 部署指标跟踪

### 跟踪您的部署性能

```bash
# 创建部署指标脚本
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

# 记录到文件
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env show --output json | jq -r '.name')" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# 使用它
./track-deployment.sh
```

**分析您的指标：**
```bash
# 查看部署历史
cat deployment-metrics.csv

# 计算平均部署时间
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## 其他资源

- [Azure Developer CLI 部署参考](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure 应用服务部署](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure 容器应用部署](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions 部署](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**导航**
- **上一课**：[您的第一个项目](../getting-started/first-project.md)
- **下一课**：[资源预配](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免责声明**：  
本文档使用AI翻译服务[Co-op Translator](https://github.com/Azure/co-op-translator)进行翻译。尽管我们努力确保翻译的准确性，但请注意，自动翻译可能包含错误或不准确之处。原始语言的文档应被视为权威来源。对于重要信息，建议使用专业人工翻译。我们对因使用此翻译而产生的任何误解或误读不承担责任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->