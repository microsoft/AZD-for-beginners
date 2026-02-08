# AZD 部署调试指南

**章节导航:**
- **📚 课程 主页**: [AZD 入门](../../README.md)
- **📖 当前章节**: 第7章 - 故障排查与调试
- **⬅️ 上一个**: [常见问题](common-issues.md)
- **➡️ 下一个**: [AI 专用 故障排查](ai-troubleshooting.md)
- **🚀 下一章**: [第8章：生产与企业模式](../chapter-08-production/production-ai-practices.md)

## 介绍

本综合指南提供针对 Azure Developer CLI 部署的高级调试策略、工具和技术，用于诊断和解决复杂问题。学习系统化的故障排查方法、日志分析技术、性能分析和高级诊断工具，以高效解决部署和运行时问题。

## 学习目标

完成本指南后，您将能够：
- 掌握针对 Azure Developer CLI 问题的系统化调试方法
- 理解高级日志配置和日志分析技术
- 实施性能分析和监控策略
- 使用 Azure 的诊断工具和服务来解决复杂问题
- 应用网络调试和安全故障排查技术
- 配置全面的监控和告警以实现主动问题检测

## 学习成果

完成后，您将能够：
- 应用 TRIAGE 方法论系统性地调试复杂的部署问题
- 配置并分析全面的日志和跟踪信息
- 有效使用 Azure Monitor、Application Insights 和诊断工具
- 独立调试网络连接、身份验证和权限问题
- 实施性能监控和优化策略
- 为重复出现的问题创建自定义调试脚本和自动化

## 调试方法论

### TRIAGE 方法
- **T**ime: 问题是什么时候开始的？
- **R**eproduce: 是否可以稳定重现？
- **I**solate: 是哪个组件失败？
- **A**nalyze: 日志显示了什么？
- **G**ather: 收集所有相关信息
- **E**scalate: 何时寻求额外帮助

## 启用调试模式

### 环境变量
```bash
# 启用全面调试
export AZD_DEBUG=true
export AZD_LOG_LEVEL=debug
export AZURE_CORE_DIAGNOSTICS_DEBUG=true

# Azure CLI 调试
export AZURE_CLI_DIAGNOSTICS=true

# 禁用遥测以获得更简洁的输出
export AZD_DISABLE_TELEMETRY=true
```

### 调试配置
```bash
# 全局设置调试配置
azd config set debug.enabled true
azd config set debug.logLevel debug
azd config set debug.verboseOutput true

# 启用跟踪日志记录
azd config set trace.enabled true
azd config set trace.outputPath ./debug-traces
```

## 📊 日志分析技术

### 理解日志级别
```
TRACE   - Most detailed, includes internal function calls
DEBUG   - Detailed diagnostic information
INFO    - General operational messages
WARN    - Warning conditions that should be noted
ERROR   - Error conditions that need attention
FATAL   - Critical errors that cause application termination
```

### 结构化日志分析
```bash
# 使用 Azure Monitor 查看日志（通过 azd monitor）
azd monitor --logs

# 实时查看应用程序日志
azd monitor --live

# 要进行详细的日志分析，请使用 Azure CLI 与您的 App Service 或 Container App：
# App Service 日志
az webapp log tail --name <app-name> --resource-group <rg-name>

# Container App 日志
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# 导出 Application Insights 日志以便分析
az monitor app-insights query \
    --app <app-insights-name> \
    --analytics-query "traces | where timestamp > ago(1h) | where severityLevel >= 3"
```

### 日志关联
```bash
#!/bin/bash
# correlate-logs.sh - 使用 Azure Monitor 在各服务之间关联日志

TRACE_ID=$1
APP_INSIGHTS_NAME=$2

if [ -z "$TRACE_ID" ] || [ -z "$APP_INSIGHTS_NAME" ]; then
    echo "Usage: $0 <trace-id> <app-insights-name>"
    exit 1
fi

echo "Correlating logs for trace ID: $TRACE_ID"

# 在 Application Insights 中搜索关联的日志
az monitor app-insights query \
    --app "$APP_INSIGHTS_NAME" \
    --analytics-query "union traces, exceptions, requests, dependencies | where operation_Id == '$TRACE_ID' | order by timestamp asc"

# 搜索 Azure 活动日志
az monitor activity-log list --correlation-id "$TRACE_ID"
```

## 🛠️ 高级调试工具

### Azure 资源图查询
```bash
# 按标签查询资源
az graph query -q "Resources | where tags['azd-env-name'] == 'production' | project name, type, location"

# 查找失败的部署
az graph query -q "ResourceContainers | where type == 'microsoft.resources/resourcegroups' | extend deploymentStatus = properties.provisioningState | where deploymentStatus != 'Succeeded'"

# 检查资源健康状况
az graph query -q "HealthResources | where properties.targetResourceId contains 'myapp' | project properties.targetResourceId, properties.currentHealthStatus"
```

### 网络调试
```bash
# 测试服务之间的连通性
test_connectivity() {
    local source=$1
    local dest=$2
    local port=$3
    
    echo "Testing connectivity from $source to $dest:$port"
    
    az network watcher test-connectivity \
        --source-resource "$source" \
        --dest-address "$dest" \
        --dest-port "$port" \
        --output table
}

# 用法
test_connectivity "/subscriptions/.../myapp-web" "myapp-api.azurewebsites.net" 443
```

### 容器调试
```bash
# 调试容器应用问题
debug_container() {
    local app_name=$1
    local resource_group=$2
    
    echo "=== Container App Status ==="
    az containerapp show --name "$app_name" --resource-group "$resource_group" \
        --query "properties.{provisioningState:provisioningState,runningState:runningState}"
    
    echo "=== Container App Revisions ==="
    az containerapp revision list --name "$app_name" --resource-group "$resource_group" \
        --query "[].{name:name,active:properties.active,createdTime:properties.createdTime}"
    
    echo "=== Container Logs ==="
    az containerapp logs show --name "$app_name" --resource-group "$resource_group" --follow
}
```

### 数据库连接调试
```bash
# 调试数据库连接
debug_database() {
    local db_server=$1
    local db_name=$2
    
    echo "=== Database Server Status ==="
    az postgres flexible-server show --name "$db_server" --resource-group "$resource_group" \
        --query "{state:state,version:version,location:location}"
    
    echo "=== Firewall Rules ==="
    az postgres flexible-server firewall-rule list --name "$db_server" --resource-group "$resource_group"
    
    echo "=== Connection Test ==="
    timeout 10 bash -c "</dev/tcp/$db_server.postgres.database.azure.com/5432" && echo "Port 5432 is open" || echo "Port 5432 is closed"
}
```

## 🔬 性能调试

### 应用性能监控
```bash
# 启用 Application Insights 调试
export APPLICATIONINSIGHTS_CONFIGURATION_CONTENT='{
  "role": {
    "name": "myapp-debug"
  },
  "sampling": {
    "percentage": 100
  },
  "instrumentation": {
    "logging": {
      "level": "DEBUG"
    }
  }
}'

# 自定义性能监控
monitor_performance() {
    local endpoint=$1
    local duration=${2:-60}
    
    echo "Monitoring $endpoint for $duration seconds..."
    
    for i in $(seq 1 $duration); do
        response_time=$(curl -o /dev/null -s -w "%{time_total}" "$endpoint")
        status_code=$(curl -o /dev/null -s -w "%{http_code}" "$endpoint")
        
        echo "$(date '+%Y-%m-%d %H:%M:%S') - Status: $status_code, Response Time: ${response_time}s"
        sleep 1
    done
}
```

### 资源利用率分析
```bash
# 监控资源使用情况
monitor_resources() {
    local resource_group=$1
    
    echo "=== CPU Usage ==="
    az monitor metrics list \
        --resource-group "$resource_group" \
        --resource-type "Microsoft.Web/sites" \
        --metric "CpuPercentage" \
        --interval PT1M \
        --aggregation Average
    
    echo "=== Memory Usage ==="
    az monitor metrics list \
        --resource-group "$resource_group" \
        --resource-type "Microsoft.Web/sites" \
        --metric "MemoryPercentage" \
        --interval PT1M \
        --aggregation Average
}
```

## 🧪 测试与验证

### 集成测试调试
```bash
#!/bin/bash
# debug-integration-tests.sh

set -e

echo "Running integration tests with debugging..."

# 设置调试环境
export NODE_ENV=test
export DEBUG=*
export LOG_LEVEL=debug

# 获取服务端点
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

echo "Testing endpoints:"
echo "Web: $WEB_URL"
echo "API: $API_URL"

# 测试健康端点
test_health() {
    local service=$1
    local url=$2
    
    echo "Testing $service health..."
    
    response=$(curl -s -o /dev/null -w "%{http_code},%{time_total}" "$url/health")
    status_code=$(echo $response | cut -d',' -f1)
    response_time=$(echo $response | cut -d',' -f2)
    
    if [ "$status_code" = "200" ]; then
        echo "✅ $service is healthy (${response_time}s)"
    else
        echo "❌ $service health check failed ($status_code)"
        return 1
    fi
}

# 运行测试
test_health "Web" "$WEB_URL"
test_health "API" "$API_URL"

# 运行自定义集成测试
npm run test:integration
```

### 用于调试的负载测试
```bash
# 简单的负载测试以识别性能瓶颈
load_test() {
    local url=$1
    local concurrent=${2:-10}
    local requests=${3:-100}
    
    echo "Load testing $url with $concurrent concurrent connections, $requests total requests"
    
    # 使用 Apache Bench (安装：apt-get install apache2-utils)
    ab -n "$requests" -c "$concurrent" -v 2 "$url" > load-test-results.txt
    
    # 提取关键指标
    echo "=== Load Test Results ==="
    grep -E "(Time taken|Requests per second|Time per request)" load-test-results.txt
    
    # 检查是否有失败
    grep -E "(Failed requests|Non-2xx responses)" load-test-results.txt
}
```

## 🔧 基础设施调试

### Bicep 模板调试
```bash
# 使用详细输出验证 Bicep 模板
validate_bicep() {
    local template_file=$1
    
    echo "Validating Bicep template: $template_file"
    
    # 语法验证
    az bicep build --file "$template_file" --stdout > /dev/null
    
    # Lint 验证
    az bicep lint --file "$template_file"
    
    # 模拟部署
    az deployment group what-if \
        --resource-group "myapp-dev-rg" \
        --template-file "$template_file" \
        --parameters @main.parameters.json
}

# 调试模板部署
debug_deployment() {
    local deployment_name=$1
    local resource_group=$2
    
    echo "=== Deployment Status ==="
    az deployment group show \
        --name "$deployment_name" \
        --resource-group "$resource_group" \
        --query "properties.{provisioningState:provisioningState,timestamp:timestamp}"
    
    echo "=== Deployment Operations ==="
    az deployment operation group list \
        --name "$deployment_name" \
        --resource-group "$resource_group" \
        --query "[].{operationId:operationId,provisioningState:properties.provisioningState,resourceType:properties.targetResource.resourceType,error:properties.statusMessage.error}"
}
```

### 资源状态分析
```bash
# 分析资源状态以查找不一致
analyze_resources() {
    local resource_group=$1
    
    echo "=== Resource Analysis for $resource_group ==="
    
    # 列出所有资源及其状态
    az resource list --resource-group "$resource_group" \
        --query "[].{name:name,type:type,provisioningState:properties.provisioningState,location:location}" \
        --output table
    
    # 检查失败的资源
    failed_resources=$(az resource list --resource-group "$resource_group" \
        --query "[?properties.provisioningState != 'Succeeded'].{name:name,state:properties.provisioningState}" \
        --output tsv)
    
    if [ -n "$failed_resources" ]; then
        echo "❌ Failed resources found:"
        echo "$failed_resources"
    else
        echo "✅ All resources provisioned successfully"
    fi
}
```

## 🔒 安全调试

### 身份验证流程调试
```bash
# 调试 Azure 身份验证
debug_auth() {
    echo "=== Current Authentication Status ==="
    az account show --query "{user:user.name,tenant:tenantId,subscription:name}"
    
    echo "=== Token Information ==="
    token=$(az account get-access-token --query accessToken -o tsv)
    
    # 解码 JWT 令牌（需要 jq 和 base64）
    echo "$token" | cut -d'.' -f2 | base64 -d | jq '.'
    
    echo "=== Role Assignments ==="
    user_id=$(az account show --query user.name -o tsv)
    az role assignment list --assignee "$user_id" --query "[].{role:roleDefinitionName,scope:scope}"
}

# 调试对 Key Vault 的访问
debug_keyvault() {
    local vault_name=$1
    
    echo "=== Key Vault Access Policies ==="
    az keyvault show --name "$vault_name" --query "properties.accessPolicies[].{objectId:objectId,permissions:permissions}"
    
    echo "=== RBAC Assignments ==="
    vault_id=$(az keyvault show --name "$vault_name" --query id -o tsv)
    az role assignment list --scope "$vault_id"
    
    echo "=== Test Secret Access ==="
    az keyvault secret list --vault-name "$vault_name" --query "[].name" || echo "❌ Cannot access secrets"
}
```

### 网络安全调试
```bash
# 调试网络安全组
debug_network_security() {
    local resource_group=$1
    
    echo "=== Network Security Groups ==="
    az network nsg list --resource-group "$resource_group" --query "[].{name:name,location:location}"
    
    # 检查安全规则
    for nsg in $(az network nsg list --resource-group "$resource_group" --query "[].name" -o tsv); do
        echo "=== Rules for $nsg ==="
        az network nsg rule list --nsg-name "$nsg" --resource-group "$resource_group" \
            --query "[].{name:name,priority:priority,direction:direction,access:access,protocol:protocol,sourcePortRange:sourcePortRange,destinationPortRange:destinationPortRange}"
    done
}
```

## 📱 应用特定调试

### Node.js 应用调试
```javascript
// debug-middleware.js - Express 调试中间件
const debug = require('debug')('app:debug');

module.exports = (req, res, next) => {
    const start = Date.now();
    
    // 记录请求详情
    debug(`${req.method} ${req.url}`, {
        headers: req.headers,
        query: req.query,
        body: req.body,
        userAgent: req.get('User-Agent'),
        ip: req.ip
    });
    
    // 重写 res.json 以记录响应
    const originalJson = res.json;
    res.json = function(data) {
        const duration = Date.now() - start;
        debug(`Response ${res.statusCode} in ${duration}ms`, data);
        return originalJson.call(this, data);
    };
    
    next();
};
```

### 数据库查询调试
```javascript
// database-debug.js - 数据库调试工具
const { Pool } = require('pg');
const debug = require('debug')('app:db');

class DebuggingPool extends Pool {
    async query(text, params) {
        const start = Date.now();
        debug('Executing query:', { text, params });
        
        try {
            const result = await super.query(text, params);
            const duration = Date.now() - start;
            debug(`Query completed in ${duration}ms`, {
                rowCount: result.rowCount,
                command: result.command
            });
            return result;
        } catch (error) {
            const duration = Date.now() - start;
            debug(`Query failed after ${duration}ms:`, error.message);
            throw error;
        }
    }
}

module.exports = DebuggingPool;
```

## 🚨 紧急调试流程

### 生产问题响应
```bash
#!/bin/bash
# emergency-debug.sh - 生产环境紧急调试

set -e

RESOURCE_GROUP=$1
ENVIRONMENT=$2

if [ -z "$RESOURCE_GROUP" ] || [ -z "$ENVIRONMENT" ]; then
    echo "Usage: $0 <resource-group> <environment>"
    exit 1
fi

echo "🚨 EMERGENCY DEBUGGING STARTED: $(date)"
echo "Resource Group: $RESOURCE_GROUP"
echo "Environment: $ENVIRONMENT"

# 切换到正确的环境
azd env select "$ENVIRONMENT"

# 收集关键信息
echo "=== 1. System Status ==="
azd show --output json > emergency-status.json
cat emergency-status.json | jq '.services[].endpoint'

echo "=== 2. Application Health ==="
for endpoint in $(cat emergency-status.json | jq -r '.services[].endpoint'); do
    echo "Testing $endpoint/health"
    curl -f "$endpoint/health" || echo "❌ Health check failed for $endpoint"
done

echo "=== 3. Recent Errors ==="
# 使用 Azure Monitor 获取错误日志
azd monitor --logs
echo "Check Application Insights for detailed error analysis"

echo "=== 4. Resource Status ==="
az resource list --resource-group "$RESOURCE_GROUP" \
    --query "[?properties.provisioningState != 'Succeeded']" > failed-resources.json

if [ -s failed-resources.json ]; then
    echo "❌ Failed resources found!"
    cat failed-resources.json
else
    echo "✅ All resources are healthy"
fi

echo "=== 5. Recent Deployments ==="
az deployment group list --resource-group "$RESOURCE_GROUP" \
    --query "[?properties.timestamp >= '$(date -d '1 hour ago' -Iseconds)']" \
    > recent-deployments.json

echo "Emergency debugging completed: $(date)"
echo "Files generated:"
echo "  - emergency-status.json"
echo "  - emergency-errors.log"
echo "  - failed-resources.json"
echo "  - recent-deployments.json"
```

### 回滚流程
```bash
# 快速回滚脚本
quick_rollback() {
    local environment=$1
    local previous_commit=$2
    
    echo "🔄 INITIATING ROLLBACK for $environment"
    
    # 切换环境
    azd env select "$environment"
    
    # 使用 Git 回滚 (AZD 没有内置回滚)
    git checkout "$previous_commit"
    azd deploy
    
    # 验证回滚
    echo "Verifying rollback..."
    azd show
    
    # 测试关键端点
    WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
    curl -f "$WEB_URL/health" || echo "❌ Rollback verification failed"
    
    echo "✅ Rollback completed"
}
```

## 📊 调试仪表板

### 自定义监控仪表板
```bash
# 为调试创建 Application Insights 查询
create_debug_queries() {
    local app_insights_name=$1
    
    # 查询错误
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "exceptions | where timestamp > ago(1h) | summarize count() by problemId, outerMessage"
    
    # 查询性能问题
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "requests | where timestamp > ago(1h) and duration > 5000 | project timestamp, name, duration, resultCode"
    
    # 查询依赖项失败
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "dependencies | where timestamp > ago(1h) and success == false | project timestamp, name, target, resultCode"
}
```

### 日志聚合
```bash
# 聚合来自多个 Azure 源的日志
aggregate_logs() {
    local output_file="aggregated-logs-$(date +%Y%m%d_%H%M%S).json"
    local app_insights_name=$1
    
    echo "Aggregating logs to $output_file"
    
    {
        echo '{"source": "azure-activity", "logs": '
        az monitor activity-log list --start-time "$(date -d '1 hour ago' -Iseconds)" --output json
        echo '}'
        
        if [ -n "$app_insights_name" ]; then
            echo ',{"source": "app-insights", "logs": '
            az monitor app-insights query --app "$app_insights_name" \
                --analytics-query "union traces, exceptions | where timestamp > ago(1h)" --output json
            echo '}'
        fi
    } > "$output_file"
    
    echo "Logs aggregated in $output_file"
}
```

## 🔗 高级资源

### 自定义调试脚本
创建一个 `scripts/debug/` 目录，包含：
- `health-check.sh` - 综合健康检查
- `performance-test.sh` - 自动化性能测试
- `log-analyzer.py` - 高级日志解析和分析
- `resource-validator.sh` - 基础设施验证

### 监控集成
```yaml
# azure.yaml - Add debugging hooks
hooks:
  postdeploy:
    shell: sh
    run: |
      echo "Running post-deployment debugging..."
      ./scripts/debug/health-check.sh
      ./scripts/debug/performance-test.sh
      
      if [ "$?" -ne 0 ]; then
        echo "❌ Post-deployment checks failed"
        exit 1
      fi
```

## 最佳实践

1. **始终启用调试日志** 在非生产环境中
2. **为问题创建可重现的测试用例**
3. **为团队记录调试流程**
4. **自动化健康检查** 和监控
5. **保持调试工具更新** 以适应应用更改
6. **演练调试流程** 在非事故时间

## 后续步骤

- [容量规划](../chapter-06-pre-deployment/capacity-planning.md) - 规划资源需求
- [SKU 选择](../chapter-06-pre-deployment/sku-selection.md) - 选择合适的服务层级
- [预部署检查](../chapter-06-pre-deployment/preflight-checks.md) - 部署前验证
- [速查表](../../resources/cheat-sheet.md) - 快速参考命令

---

**记住**：良好的调试需要系统性、彻底性和耐心。这些工具和技术将帮助您更快、更有效地诊断问题。

---

**导航**
- **上一课**: [常见问题](common-issues.md)

- **下一课**: [容量规划](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免责声明：
本文件已使用 AI 翻译服务 [Co-op Translator](https://github.com/Azure/co-op-translator) 进行翻译。虽然我们力求准确，但请注意，自动翻译可能包含错误或不准确之处。原始语言的文档应被视为具有权威性的来源。对于重要信息，建议使用专业人工翻译。因使用本翻译而产生的任何误解或曲解，我们不承担责任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->