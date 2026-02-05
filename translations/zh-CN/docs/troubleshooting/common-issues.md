# 常见问题及解决方案

**章节导航：**
- **📚 课程主页**：[AZD 初学者指南](../../README.md)
- **📖 当前章节**：第7章 - 故障排除与调试
- **⬅️ 上一章节**：[第6章：部署前检查](../pre-deployment/preflight-checks.md)
- **➡️ 下一步**：[调试指南](debugging.md)
- **🚀 下一章节**：[第8章：生产与企业模式](../microsoft-foundry/production-ai-practices.md)

## 简介

本全面故障排除指南涵盖使用 Azure Developer CLI 时最常遇到的问题。学习如何诊断、排查和解决身份验证、部署、基础设施配置以及应用程序配置中的常见问题。每个问题都包括详细的症状、根本原因以及逐步解决方案。

## 学习目标

完成本指南后，您将能够：
- 掌握 Azure Developer CLI 问题的诊断技巧
- 了解常见的身份验证和权限问题及其解决方法
- 解决部署失败、基础设施配置错误和配置问题
- 实施主动监控和调试策略
- 应用系统化的故障排除方法解决复杂问题
- 配置正确的日志记录和监控以防止未来问题

## 学习成果

完成后，您将能够：
- 使用内置诊断工具诊断 Azure Developer CLI 问题
- 独立解决身份验证、订阅和权限相关问题
- 有效排查部署失败和基础设施配置错误
- 调试应用程序配置问题及环境特定问题
- 实施监控和警报以主动识别潜在问题
- 应用日志记录、调试和问题解决工作流的最佳实践

## 快速诊断

在深入具体问题之前，运行以下命令以收集诊断信息：

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

## 身份验证问题

### 问题："无法获取访问令牌"
**症状：**
- `azd up` 因身份验证错误失败
- 命令返回“未授权”或“访问被拒绝”

**解决方案：**
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

### 问题：部署时“权限不足”
**症状：**
- 部署因权限错误失败
- 无法创建某些 Azure 资源

**解决方案：**
```bash
# 1. Check your Azure role assignments
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Ensure you have required roles
# - Contributor (for resource creation)
# - User Access Administrator (for role assignments)

# 3. Contact your Azure administrator for proper permissions
```

### 问题：多租户身份验证问题
**解决方案：**
```bash
# 1. Login with specific tenant
az login --tenant "your-tenant-id"

# 2. Set tenant in configuration
azd config set auth.tenantId "your-tenant-id"

# 3. Clear tenant cache if switching tenants
az account clear
```

## 🏗️ 基础设施配置错误

### 问题：资源名称冲突
**症状：**
- 出现“资源名称已存在”错误
- 部署在创建资源时失败

**解决方案：**
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

### 问题：位置/区域不可用
**症状：**
- 出现“位置‘xyz’不可用于资源类型”错误
- 选定区域内某些 SKU 不可用

**解决方案：**
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

### 问题：配额超限错误
**症状：**
- 出现“资源类型配额超限”错误
- 达到资源最大数量限制

**解决方案：**
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

### 问题：Bicep 模板错误
**症状：**
- 模板验证失败
- Bicep 文件中存在语法错误

**解决方案：**
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

## 🚀 部署失败

### 问题：构建失败
**症状：**
- 应用程序在部署期间无法构建
- 包安装错误

**解决方案：**
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

### 问题：容器部署失败
**症状：**
- 容器应用无法启动
- 镜像拉取错误

**解决方案：**
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

### 问题：数据库连接失败
**症状：**
- 应用程序无法连接到数据库
- 连接超时错误

**解决方案：**
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

## 🔧 配置问题

### 问题：环境变量不起作用
**症状：**
- 应用无法读取配置值
- 环境变量显示为空

**解决方案：**
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

### 问题：SSL/TLS 证书问题
**症状：**
- HTTPS 无法正常工作
- 证书验证错误

**解决方案：**
```bash
# 1. Check SSL certificate status
az webapp config ssl list --resource-group myrg

# 2. Enable HTTPS only
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Add custom domain (if needed)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### 问题：CORS 配置问题
**症状：**
- 前端无法调用 API
- 跨域请求被阻止

**解决方案：**
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

## 🌍 环境管理问题

### 问题：环境切换问题
**症状：**
- 使用了错误的环境
- 配置未正确切换

**解决方案：**
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

### 问题：环境损坏
**症状：**
- 环境显示无效状态
- 资源与配置不匹配

**解决方案：**
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

## 🔍 性能问题

### 问题：部署时间过长
**症状：**
- 部署耗时过长
- 部署期间出现超时

**解决方案：**
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

### 问题：应用程序性能问题
**症状：**
- 响应时间过慢
- 资源使用率高

**解决方案：**
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

## 🛠️ 故障排除工具和命令

### 调试命令
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

### 日志分析
```bash
# Application logs
azd logs --service web --follow
azd logs --service api --since 1h

# Azure resource logs
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Container logs (for Container Apps)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### 资源调查
```bash
# List all resources
az resource list --resource-group myrg -o table

# Check resource status
az webapp show --name myapp --resource-group myrg --query state

# Network diagnostics
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 获取额外帮助

### 何时升级问题
- 尝试所有解决方案后身份验证问题仍然存在
- Azure 服务的基础设施问题
- 计费或订阅相关问题
- 安全问题或事件

### 支持渠道
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

### 收集的信息
在联系支持之前，请收集以下信息：
- `azd version` 输出
- `azd info` 输出
- 错误消息（完整文本）
- 重现问题的步骤
- 环境详情（`azd env show`）
- 问题开始的时间线

### 日志收集脚本
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

## 📊 问题预防

### 部署前检查清单
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

### 监控设置
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

### 定期维护
```bash
# Weekly health checks
./scripts/health-check.sh

# Monthly cost review
az consumption usage list --billing-period-name 202401

# Quarterly security review
az security assessment list --resource-group myrg
```

## 相关资源

- [调试指南](debugging.md) - 高级调试技术
- [资源配置](../deployment/provisioning.md) - 基础设施故障排除
- [容量规划](../pre-deployment/capacity-planning.md) - 资源规划指导
- [SKU 选择](../pre-deployment/sku-selection.md) - 服务层推荐

---

**提示**：将本指南收藏，遇到问题时随时参考。大多数问题都曾出现过，并有现成的解决方案！

---

**导航**
- **上一课**：[资源配置](../deployment/provisioning.md)
- **下一课**：[调试指南](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免责声明**：  
本文档使用AI翻译服务[Co-op Translator](https://github.com/Azure/co-op-translator)进行翻译。尽管我们努力确保翻译的准确性，但请注意，自动翻译可能包含错误或不准确之处。原始语言的文档应被视为权威来源。对于重要信息，建议使用专业人工翻译。我们不对因使用此翻译而产生的任何误解或误读承担责任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->