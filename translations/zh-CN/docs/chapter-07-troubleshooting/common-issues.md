# 常见问题与解决方案

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: 第7章 - 故障排查与调试
- **⬅️ Previous Chapter**: [第6章：部署前检查](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ Next**: [Debugging Guide](debugging.md)
- **🚀 Next Chapter**: [第8章：生产与企业模式](../chapter-08-production/production-ai-practices.md)

## 介绍

本综合故障排查指南涵盖使用 Azure Developer CLI 时最常遇到的问题。学习诊断、排查并解决与身份验证、部署、基础设施预配和应用配置相关的常见问题。每个问题都包含详细的症状、根本原因和逐步解决步骤。

## 学习目标

完成本指南后，您将能够：
- 掌握 Azure Developer CLI 问题的诊断技术
- 了解常见的身份验证和权限问题及其解决方法
- 解决部署失败、基础设施预配错误和配置问题
- 实施主动监控和调试策略
- 对复杂问题应用系统化的故障排查方法
- 配置适当的日志记录和监控以防止未来问题

## 学习成果

完成后，您将能够：
- 使用内置诊断工具诊断 Azure Developer CLI 问题
- 独立解决身份验证、订阅和权限相关问题
- 有效排查部署失败和基础设施预配错误
- 调试应用配置问题和与环境相关的问题
- 实施监控和告警以主动识别潜在问题
- 应用日志记录、调试和问题解决工作流的最佳实践

## 快速诊断

在深入具体问题之前，运行以下命令以收集诊断信息：

```bash
# 检查 azd 版本和运行状况
azd version
azd config list

# 验证 Azure 身份凭证
az account show
az account list

# 检查当前环境
azd env show
azd env get-values

# 启用调试日志记录
export AZD_DEBUG=true
azd <command> --debug
```

## 认证问题

### 问题: "Failed to get access token"
**症状:**
- `azd up` 因身份验证错误失败
- 命令返回 "unauthorized" 或 "access denied"

**解决方案:**
```bash
# 1. 使用 Azure CLI 重新进行身份验证
az login
az account show

# 2. 清除缓存的凭据
az account clear
az login

# 3. 使用设备代码流（适用于无头系统）
az login --use-device-code

# 4. 设置指定订阅
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### 问题: 部署期间出现 "Insufficient privileges"
**症状:**
- 部署因权限错误失败
- 无法创建某些 Azure 资源

**解决方案:**
```bash
# 1. 检查您的 Azure 角色分配
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. 确保您拥有所需角色
# - Contributor（用于创建资源）
# - User Access Administrator（用于角色分配）

# 3. 联系您的 Azure 管理员以获取适当的权限
```

### 问题: 多租户身份验证问题
**解决方案:**
```bash
# 1. 使用特定租户登录
az login --tenant "your-tenant-id"

# 2. 在配置中设置租户
azd config set auth.tenantId "your-tenant-id"

# 3. 切换租户时清除租户缓存
az account clear
```

## 🏗️ 基础设施预配错误

### 问题: 资源名称冲突
**症状:**
- 出现 "The resource name already exists" 错误
- 部署在创建资源时失败

**解决方案:**
```bash
# 1. 使用带令牌的唯一资源名称
# 在你的 Bicep 模板中：
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. 更改环境名称
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. 清理现有资源
azd down --force --purge
```

### 问题: 位置/区域不可用
**症状:**
- 出现 "The location 'xyz' is not available for resource type"
- 某些 SKU 在所选区域不可用

**解决方案:**
```bash
# 1. 检查资源类型的可用位置
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. 使用常见的可用区域
azd config set defaults.location eastus2
# 或
azd env set AZURE_LOCATION eastus2

# 3. 按区域检查服务可用性
# 访问: https://azure.microsoft.com/global-infrastructure/services/
```

### 问题: 配额超出错误
**症状:**
- 出现 "Quota exceeded for resource type"
- 出现 "Maximum number of resources reached"

**解决方案:**
```bash
# 1. 检查当前配额使用情况
az vm list-usage --location eastus2 -o table

# 2. 通过 Azure 门户请求增加配额
# 转到：订阅 > 使用 + 配额

# 3. 在开发环境中使用较小的 SKU
# 在 main.parameters.json:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. 清理未使用的资源
az resource list --query "[?contains(name, 'unused')]" -o table
```

### 问题: Bicep 模板错误
**症状:**
- 模板验证失败
- Bicep 文件语法错误

**解决方案:**
```bash
# 1. 验证 Bicep 语法
az bicep build --file infra/main.bicep

# 2. 使用 Bicep 代码静态检查器
az bicep lint --file infra/main.bicep

# 3. 检查参数文件语法
cat infra/main.parameters.json | jq '.'

# 4. 预览部署更改
azd provision --preview
```

## 🚀 部署失败

### 问题: 构建失败
**症状:**
- 应用在部署期间构建失败
- 包安装错误

**解决方案:**
```bash
# 1. 使用调试标志检查构建输出
azd deploy --service web --debug

# 2. 查看已部署服务状态
azd show

# 3. 在本地测试构建
cd src/web
npm install
npm run build

# 3. 检查 Node.js/Python 版本兼容性
node --version  # 应与 azure.yaml 设置相匹配
python --version

# 4. 清除构建缓存
rm -rf node_modules package-lock.json
npm install

# 5. 如果使用容器，检查 Dockerfile
docker build -t test-image .
docker run --rm test-image
```

### 问题: 容器部署失败
**症状:**
- 容器应用无法启动
- 拉取镜像错误

**解决方案:**
```bash
# 1. 在本地测试 Docker 构建
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. 使用 Azure CLI 检查容器日志
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. 通过 azd 监控应用程序
azd monitor --logs

# 3. 验证容器注册表访问权限
az acr login --name myregistry

# 4. 检查容器应用配置
az containerapp show --name my-app --resource-group my-rg
```

### 问题: 数据库连接失败
**症状:**
- 应用无法连接到数据库
- 连接超时错误

**解决方案:**
```bash
# 1. 检查数据库防火墙规则
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. 从应用测试连通性
# 临时添加到你的应用：
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. 验证连接字符串格式
azd env get-values | grep DATABASE

# 4. 检查数据库服务器状态
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 配置问题

### 问题: 环境变量不起作用
**症状:**
- 应用无法读取配置值
- 环境变量显示为空

**解决方案:**
```bash
# 1. 验证环境变量是否已设置
azd env get-values
azd env get DATABASE_URL

# 2. 检查 azure.yaml 中的变量名称
cat azure.yaml | grep -A 5 env:

# 3. 重新启动应用程序
azd deploy --service web

# 4. 检查应用服务配置
az webapp config appsettings list --name myapp --resource-group myrg
```

### 问题: SSL/TLS 证书问题
**症状:**
- HTTPS 无法正常工作
- 证书验证错误

**解决方案:**
```bash
# 1. 检查 SSL 证书状态
az webapp config ssl list --resource-group myrg

# 2. 仅启用 HTTPS
az webapp update --name myapp --resource-group myrg --https-only true

# 3. 添加自定义域名 (如有需要)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### 问题: CORS 配置问题
**症状:**
- 前端无法调用 API
- 跨域请求被阻止

**解决方案:**
```bash
# 1. 为 App Service 配置 CORS
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. 更新 API 以处理 CORS
# 在 Express.js 中：
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. 检查是否在正确的 URL 上运行
azd show
```

## 🌍 环境管理问题

### 问题: 环境切换问题
**症状:**
- 使用了错误的环境
- 配置未正确切换

**解决方案:**
```bash
# 1. 列出所有环境
azd env list

# 2. 显式选择环境
azd env select production

# 3. 验证当前环境
azd env show

# 4. 如果损坏则创建新环境
azd env new production-new
azd env select production-new
```

### 问题: 环境损坏
**症状:**
- 环境显示为无效状态
- 资源与配置不匹配

**解决方案:**
```bash
# 1. 刷新环境状态
azd env refresh

# 2. 重置环境配置
azd env new production-reset
# 复制所需的环境变量
azd env set DATABASE_URL "your-value"

# 3. 导入现有资源（如果可能）
# 手动使用资源 ID 更新 .azure/production/config.json
```

## 🔍 性能问题

### 问题: 部署时间过长
**症状:**
- 部署耗时过长
- 部署过程中超时

**解决方案:**
```bash
# 1. 部署特定服务以加快迭代
azd deploy --service web
azd deploy --service api

# 2. 在基础设施未更改时使用仅代码部署
azd deploy  # 比 azd up 更快

# 3. 优化构建流程
# 在 package.json 中：
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. 检查资源位置（使用同一区域）
azd config set defaults.location eastus2
```

### 问题: 应用性能问题
**症状:**
- 响应时间慢
- 资源使用率高

**解决方案:**
```bash
# 1. 扩容资源
# 在 main.parameters.json 中更新 SKU:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. 启用 Application Insights 监控
azd monitor --overview

# 3. 在 Azure 中检查应用程序日志
az webapp log tail --name myapp --resource-group myrg
# 或者对于 Container Apps:
az containerapp logs show --name myapp --resource-group myrg --follow

# 4. 实现缓存
# 向您的基础设施添加 Redis 缓存
```

## 🛠️ 故障排查工具和命令

### 调试命令
```bash
# 全面调试
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# 检查 azd 版本
azd version

# 查看当前配置
azd config list

# 测试连通性
curl -v https://myapp.azurewebsites.net/health
```

### 日志分析
```bash
# 通过 Azure CLI 的应用程序日志
az webapp log tail --name myapp --resource-group myrg

# 使用 azd 监控应用程序
azd monitor --logs
azd monitor --live

# Azure 资源日志
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# 容器日志（适用于 Container Apps）
az containerapp logs show --name myapp --resource-group myrg --follow
```

### 资源调查
```bash
# 列出所有资源
az resource list --resource-group myrg -o table

# 检查资源状态
az webapp show --name myapp --resource-group myrg --query state

# 网络诊断
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 获取更多帮助

### 何时升级
- 尝试所有解决方案后身份验证问题仍然存在
- 与 Azure 服务相关的基础设施问题
- 计费或订阅相关问题
- 安全问题或事件

### 支持渠道
```bash
# 1. 检查 Azure 服务运行状况
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. 创建 Azure 支持工单
# 前往: https://portal.azure.com -> 帮助与支持

# 3. 社区资源
# - Stack Overflow: azure-developer-cli 标签
# - GitHub 问题: https://github.com/Azure/azure-dev/issues
# - Microsoft 问答: https://learn.microsoft.com/en-us/answers/
```

### 需要收集的信息
在联系支持之前，收集以下信息：
- `azd version` 输出
- `azd config list` 输出
- `azd show` 输出（当前部署状态）
- 错误消息（完整文本）
- 重现问题的步骤
- 环境详细信息（`azd env show`）
- 问题开始的时间线

### 日志收集脚本
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

## 📊 问题预防

### 部署前检查清单
```bash
# 1. 验证身份
az account show

# 2. 检查配额和限制
az vm list-usage --location eastus2

# 3. 验证模板
az bicep build --file infra/main.bicep

# 4. 先在本地测试
npm run build
npm run test

# 5. 使用模拟部署
azd provision --preview
```

### 监控设置
```bash
# 启用 Application Insights
# 添加到 main.bicep:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}

# 设置警报
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/sites/myapp \
  --condition "avg Percentage CPU > 80"
```

### 定期维护
```bash
# 每周健康检查
./scripts/health-check.sh

# 每月成本审查
az consumption usage list --billing-period-name 202401

# 每季度安全审查
az security assessment list --resource-group myrg
```

## 相关资源

- [Debugging Guide](debugging.md) - 高级调试技术
- [Provisioning Resources](../chapter-04-infrastructure/provisioning.md) - 基础设施故障排查
- [Capacity Planning](../chapter-06-pre-deployment/capacity-planning.md) - 资源规划指南
- [SKU Selection](../chapter-06-pre-deployment/sku-selection.md) - 服务层级建议

---

**提示**：将本指南加入书签，并在遇到问题时参考。大多数问题以前都遇到过并有既定解决方案！

---

**导航**
- **Previous Lesson**: [Provisioning Resources](../chapter-04-infrastructure/provisioning.md)
- **Next Lesson**: [Debugging Guide](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免责声明：
本文件已使用 AI 翻译服务 [Co-op Translator](https://github.com/Azure/co-op-translator) 进行翻译。尽管我们力求准确，但请注意自动翻译可能包含错误或不准确之处。原始文件的原文应被视为权威来源。对于关键信息，建议使用专业人工翻译。对于因使用本翻译而产生的任何误解或误释，我们概不负责。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->