# Debugging Guide for AZD Deployments

**Chapter Navigation:**
- **📚 Course Home**: [AZD 新手入門](../../README.md)
- **📖 Current Chapter**: 第7章 - 疑難排解與偵錯
- **⬅️ Previous**: [常見問題](common-issues.md)
- **➡️ Next**: [AI 專屬疑難排解](ai-troubleshooting.md)
- **🚀 Next Chapter**: [第8章：生產與企業模式](../chapter-08-production/production-ai-practices.md)

## Introduction

本綜合指南提供進階的除錯策略、工具與技術，用以診斷和解決 Azure Developer CLI 部署中複雜的問題。學習系統化的疑難排解方法、日誌分析技巧、效能分析與進階診斷工具，以更有效率地解決部署與執行時問題。

## Learning Goals

完成本指南後，您將能夠：
- 精通 Azure Developer CLI 問題的系統化除錯方法
- 理解進階的日誌設定與日誌分析技巧
- 實作效能分析與監控策略
- 使用 Azure 診斷工具與服務解決複雜問題
- 應用網絡除錯與安全性故障排查技巧
- 設定完整的監控與警示以主動偵測問題

## Learning Outcomes

完成後，您將能夠：
- 套用 TRIAGE 方法系統性地除錯複雜部署問題
- 設定並分析完整的日誌與追蹤資訊
- 有效使用 Azure Monitor、Application Insights 與診斷工具
- 獨立排查網絡連線、驗證與權限問題
- 實作效能監控與優化策略
- 為重複性問題建立自訂除錯腳本與自動化

## Debugging Methodology

### The TRIAGE Approach
- **T**ime: 問題何時開始發生？
- **R**eproduce: 是否能穩定重現？
- **I**solate: 哪個元件失敗了？
- **A**nalyze: 日誌告訴了我們什麼？
- **G**ather: 收集所有相關資訊
- **E**scalate: 什麼情況下需要尋求額外協助

## Enabling Debug Mode

### Environment Variables
```bash
# 啟用全面偵錯
export AZD_DEBUG=true
export AZD_LOG_LEVEL=debug
export AZURE_CORE_DIAGNOSTICS_DEBUG=true

# Azure CLI 偵錯
export AZURE_CLI_DIAGNOSTICS=true

# 停用遙測以獲得更乾淨的輸出
export AZD_DISABLE_TELEMETRY=true
```

### Debug Configuration
```bash
# 在全域設定偵錯配置
azd config set debug.enabled true
azd config set debug.logLevel debug
azd config set debug.verboseOutput true

# 啟用追蹤日誌記錄
azd config set trace.enabled true
azd config set trace.outputPath ./debug-traces
```

## 📊 Log Analysis Techniques

### Understanding Log Levels
```
TRACE   - Most detailed, includes internal function calls
DEBUG   - Detailed diagnostic information
INFO    - General operational messages
WARN    - Warning conditions that should be noted
ERROR   - Error conditions that need attention
FATAL   - Critical errors that cause application termination
```

### Structured Log Analysis
```bash
# 使用 Azure Monitor（透過 azd monitor）檢視日誌
azd monitor --logs

# 即時檢視應用程式日誌
azd monitor --live

# 如要詳細分析日誌，請使用 Azure CLI 與你的 App Service 或 Container App：
# App Service 日誌
az webapp log tail --name <app-name> --resource-group <rg-name>

# Container App 日誌
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# 匯出 Application Insights 日誌以作分析
az monitor app-insights query \
    --app <app-insights-name> \
    --analytics-query "traces | where timestamp > ago(1h) | where severityLevel >= 3"
```

### Log Correlation
```bash
#!/bin/bash
# correlate-logs.sh - 使用 Azure Monitor 將不同服務的日誌相關聯

TRACE_ID=$1
APP_INSIGHTS_NAME=$2

if [ -z "$TRACE_ID" ] || [ -z "$APP_INSIGHTS_NAME" ]; then
    echo "Usage: $0 <trace-id> <app-insights-name>"
    exit 1
fi

echo "Correlating logs for trace ID: $TRACE_ID"

# 在 Application Insights 中搜尋相關聯的日誌
az monitor app-insights query \
    --app "$APP_INSIGHTS_NAME" \
    --analytics-query "union traces, exceptions, requests, dependencies | where operation_Id == '$TRACE_ID' | order by timestamp asc"

# 搜尋 Azure 活動日誌
az monitor activity-log list --correlation-id "$TRACE_ID"
```

## 🛠️ Advanced Debugging Tools

### Azure Resource Graph Queries
```bash
# 按標籤查詢資源
az graph query -q "Resources | where tags['azd-env-name'] == 'production' | project name, type, location"

# 尋找失敗的部署
az graph query -q "ResourceContainers | where type == 'microsoft.resources/resourcegroups' | extend deploymentStatus = properties.provisioningState | where deploymentStatus != 'Succeeded'"

# 檢查資源健康狀態
az graph query -q "HealthResources | where properties.targetResourceId contains 'myapp' | project properties.targetResourceId, properties.currentHealthStatus"
```

### Network Debugging
```bash
# 測試服務之間的連線
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

# 使用方法
test_connectivity "/subscriptions/.../myapp-web" "myapp-api.azurewebsites.net" 443
```

### Container Debugging
```bash
# 除錯容器應用程式問題
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

### Database Connection Debugging
```bash
# 偵錯資料庫連線
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

## 🔬 Performance Debugging

### Application Performance Monitoring
```bash
# 啟用 Application Insights 偵錯
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

# 自訂效能監控
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

### Resource Utilization Analysis
```bash
# 監察資源使用情況
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

## 🧪 Testing and Validation

### Integration Test Debugging
```bash
#!/bin/bash
# debug-integration-tests.sh

set -e

echo "Running integration tests with debugging..."

# 設定偵錯環境
export NODE_ENV=test
export DEBUG=*
export LOG_LEVEL=debug

# 取得服務端點
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

echo "Testing endpoints:"
echo "Web: $WEB_URL"
echo "API: $API_URL"

# 測試健康檢查端點
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

# 執行測試
test_health "Web" "$WEB_URL"
test_health "API" "$API_URL"

# 執行自訂整合測試
npm run test:integration
```

### Load Testing for Debugging
```bash
# 簡單的負載測試，用以識別效能瓶頸
load_test() {
    local url=$1
    local concurrent=${2:-10}
    local requests=${3:-100}
    
    echo "Load testing $url with $concurrent concurrent connections, $requests total requests"
    
    # 使用 Apache Bench (安裝：apt-get install apache2-utils)
    ab -n "$requests" -c "$concurrent" -v 2 "$url" > load-test-results.txt
    
    # 擷取關鍵指標
    echo "=== Load Test Results ==="
    grep -E "(Time taken|Requests per second|Time per request)" load-test-results.txt
    
    # 檢查是否有失敗
    grep -E "(Failed requests|Non-2xx responses)" load-test-results.txt
}
```

## 🔧 Infrastructure Debugging

### Bicep Template Debugging
```bash
# 以詳細輸出驗證 Bicep 範本
validate_bicep() {
    local template_file=$1
    
    echo "Validating Bicep template: $template_file"
    
    # 語法驗證
    az bicep build --file "$template_file" --stdout > /dev/null
    
    # Lint 檢查
    az bicep lint --file "$template_file"
    
    # What-if 部署預覽
    az deployment group what-if \
        --resource-group "myapp-dev-rg" \
        --template-file "$template_file" \
        --parameters @main.parameters.json
}

# 偵錯範本部署
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

### Resource State Analysis
```bash
# 分析資源狀態以找出不一致之處
analyze_resources() {
    local resource_group=$1
    
    echo "=== Resource Analysis for $resource_group ==="
    
    # 列出所有資源及其狀態
    az resource list --resource-group "$resource_group" \
        --query "[].{name:name,type:type,provisioningState:properties.provisioningState,location:location}" \
        --output table
    
    # 檢查是否有失敗的資源
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

## 🔒 Security Debugging

### Authentication Flow Debugging
```bash
# 除錯 Azure 身份驗證
debug_auth() {
    echo "=== Current Authentication Status ==="
    az account show --query "{user:user.name,tenant:tenantId,subscription:name}"
    
    echo "=== Token Information ==="
    token=$(az account get-access-token --query accessToken -o tsv)
    
    # 解碼 JWT 令牌（需要 jq 和 base64）
    echo "$token" | cut -d'.' -f2 | base64 -d | jq '.'
    
    echo "=== Role Assignments ==="
    user_id=$(az account show --query user.name -o tsv)
    az role assignment list --assignee "$user_id" --query "[].{role:roleDefinitionName,scope:scope}"
}

# 除錯 Key Vault 存取
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

### Network Security Debugging
```bash
# 除錯網絡安全群組
debug_network_security() {
    local resource_group=$1
    
    echo "=== Network Security Groups ==="
    az network nsg list --resource-group "$resource_group" --query "[].{name:name,location:location}"
    
    # 檢查安全規則
    for nsg in $(az network nsg list --resource-group "$resource_group" --query "[].name" -o tsv); do
        echo "=== Rules for $nsg ==="
        az network nsg rule list --nsg-name "$nsg" --resource-group "$resource_group" \
            --query "[].{name:name,priority:priority,direction:direction,access:access,protocol:protocol,sourcePortRange:sourcePortRange,destinationPortRange:destinationPortRange}"
    done
}
```

## 📱 Application-Specific Debugging

### Node.js Application Debugging
```javascript
// debug-middleware.js - Express 偵錯中介軟體
const debug = require('debug')('app:debug');

module.exports = (req, res, next) => {
    const start = Date.now();
    
    // 記錄請求詳細資料
    debug(`${req.method} ${req.url}`, {
        headers: req.headers,
        query: req.query,
        body: req.body,
        userAgent: req.get('User-Agent'),
        ip: req.ip
    });
    
    // 覆寫 res.json 以記錄回應
    const originalJson = res.json;
    res.json = function(data) {
        const duration = Date.now() - start;
        debug(`Response ${res.statusCode} in ${duration}ms`, data);
        return originalJson.call(this, data);
    };
    
    next();
};
```

### Database Query Debugging
```javascript
// database-debug.js - 資料庫除錯工具
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

## 🚨 Emergency Debugging Procedures

### Production Issue Response
```bash
#!/bin/bash
# emergency-debug.sh - 緊急生產環境除錯

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

# 切換到正確的環境
azd env select "$ENVIRONMENT"

# 收集關鍵資訊
echo "=== 1. System Status ==="
azd show --output json > emergency-status.json
cat emergency-status.json | jq '.services[].endpoint'

echo "=== 2. Application Health ==="
for endpoint in $(cat emergency-status.json | jq -r '.services[].endpoint'); do
    echo "Testing $endpoint/health"
    curl -f "$endpoint/health" || echo "❌ Health check failed for $endpoint"
done

echo "=== 3. Recent Errors ==="
# 使用 Azure Monitor 查看錯誤日誌
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

### Rollback Procedures
```bash
# 快速回滾腳本
quick_rollback() {
    local environment=$1
    local previous_commit=$2
    
    echo "🔄 INITIATING ROLLBACK for $environment"
    
    # 切換環境
    azd env select "$environment"
    
    # 使用 Git 回滾（AZD 沒有內建回滾功能）
    git checkout "$previous_commit"
    azd deploy
    
    # 驗證回滾
    echo "Verifying rollback..."
    azd show
    
    # 測試關鍵端點
    WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
    curl -f "$WEB_URL/health" || echo "❌ Rollback verification failed"
    
    echo "✅ Rollback completed"
}
```

## 📊 Debugging Dashboards

### Custom Monitoring Dashboard
```bash
# 建立 Application Insights 查詢以作偵錯
create_debug_queries() {
    local app_insights_name=$1
    
    # 查詢錯誤
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "exceptions | where timestamp > ago(1h) | summarize count() by problemId, outerMessage"
    
    # 查詢效能問題
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "requests | where timestamp > ago(1h) and duration > 5000 | project timestamp, name, duration, resultCode"
    
    # 查詢依賴失敗
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "dependencies | where timestamp > ago(1h) and success == false | project timestamp, name, target, resultCode"
}
```

### Log Aggregation
```bash
# 彙總來自多個 Azure 來源的日誌
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

## 🔗 Advanced Resources

### Custom Debug Scripts
Create a `scripts/debug/` directory with:
- `health-check.sh` - Comprehensive health checking
- `performance-test.sh` - Automated performance testing
- `log-analyzer.py` - Advanced log parsing and analysis
- `resource-validator.sh` - Infrastructure validation

### Monitoring Integration
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

## Best Practices

1. **Always enable debug logging** in non-production environments
2. **Create reproducible test cases** for issues
3. **Document debugging procedures** for your team
4. **Automate health checks** and monitoring
5. **Keep debug tools updated** with your application changes
6. **Practice debugging procedures** during non-incident times

## Next Steps

- [Capacity Planning](../chapter-06-pre-deployment/capacity-planning.md) - 規劃資源需求
- [SKU Selection](../chapter-06-pre-deployment/sku-selection.md) - 選擇適當的服務層級
- [Preflight Checks](../chapter-06-pre-deployment/preflight-checks.md) - 部署前驗證
- [Cheat Sheet](../../resources/cheat-sheet.md) - 快速參考指令

---

**Remember**: 良好的除錯來自系統性、徹底與耐心。這些工具與技術將幫助您更快速、更有效地診斷問題。

---

**Navigation**
- **Previous Lesson**: [常見問題](common-issues.md)

- **Next Lesson**: [Capacity Planning](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件經由 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻譯。雖然我們已盡力確保準確性，但自動翻譯可能仍含有錯誤或不準確之處。原文應以原始語言版本為準。如內容涉及重要資訊，建議採用專業人工翻譯。我們對因使用本翻譯而引致的任何誤解或誤釋概不負責。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->