# AZD 部署調試指南

**章節導航：**
- **📚 課程主頁**: [AZD 初學者指南](../../README.md)
- **📖 當前章節**: 第七章 - 故障排除與調試
- **⬅️ 上一章**: [常見問題](common-issues.md)
- **➡️ 下一章**: [AI 特定故障排除](ai-troubleshooting.md)
- **🚀 下一章節**: [第八章：生產與企業模式](../microsoft-foundry/production-ai-practices.md)

## 簡介

本指南提供進階的調試策略、工具和技術，用於診斷和解決 Azure Developer CLI 部署中的複雜問題。學習系統化的故障排除方法、日誌分析技術、性能分析以及高級診斷工具，幫助您高效解決部署和運行時的問題。

## 學習目標

完成本指南後，您將能夠：
- 掌握 Azure Developer CLI 問題的系統化調試方法
- 理解高級日誌配置和日誌分析技術
- 實施性能分析和監控策略
- 使用 Azure 診斷工具和服務解決複雜問題
- 應用網絡調試和安全故障排除技術
- 配置全面的監控和警報以主動檢測問題

## 學習成果

完成後，您將能夠：
- 使用 TRIAGE 方法系統化地調試複雜的部署問題
- 配置並分析全面的日誌和追蹤信息
- 有效使用 Azure Monitor、Application Insights 和診斷工具
- 獨立調試網絡連接、身份驗證和權限問題
- 實施性能監控和優化策略
- 創建自定義調試腳本和自動化解決重複性問題

## 調試方法

### TRIAGE 方法
- **T**ime: 問題何時開始？
- **R**eproduce: 是否能穩定重現問題？
- **I**solate: 哪個組件出現故障？
- **A**nalyze: 日誌中顯示了什麼？
- **G**ather: 收集所有相關信息
- **E**scalate: 何時需要尋求額外幫助

## 啟用調試模式

### 環境變數
```bash
# 啟用全面的調試
export AZD_DEBUG=true
export AZD_LOG_LEVEL=debug
export AZURE_CORE_DIAGNOSTICS_DEBUG=true

# Azure CLI 調試
export AZURE_CLI_DIAGNOSTICS=true

# 禁用遙測以獲得更清晰的輸出
export AZD_DISABLE_TELEMETRY=true
```

### 調試配置
```bash
# 全局設置調試配置
azd config set debug.enabled true
azd config set debug.logLevel debug
azd config set debug.verboseOutput true

# 啟用追蹤日誌
azd config set trace.enabled true
azd config set trace.outputPath ./debug-traces
```

## 📊 日誌分析技術

### 理解日誌級別
```
TRACE   - Most detailed, includes internal function calls
DEBUG   - Detailed diagnostic information
INFO    - General operational messages
WARN    - Warning conditions that should be noted
ERROR   - Error conditions that need attention
FATAL   - Critical errors that cause application termination
```

### 結構化日誌分析
```bash
# 按級別篩選日誌
azd logs --level error --since 1h

# 按服務篩選
azd logs --service api --level debug

# 導出日誌進行分析
azd logs --output json > deployment-logs.json

# 使用 jq 解析 JSON 日誌
cat deployment-logs.json | jq '.[] | select(.level == "ERROR")'
```

### 日誌關聯分析
```bash
#!/bin/bash
# correlate-logs.sh - 相關服務之間的日誌

TRACE_ID=$1
if [ -z "$TRACE_ID" ]; then
    echo "Usage: $0 <trace-id>"
    exit 1
fi

echo "Correlating logs for trace ID: $TRACE_ID"

# 搜索所有服務
for service in web api worker; do
    echo "=== $service logs ==="
    azd logs --service $service | grep "$TRACE_ID"
done

# 搜索 Azure 日誌
az monitor activity-log list --correlation-id "$TRACE_ID"
```

## 🛠️ 高級調試工具

### Azure 資源圖查詢
```bash
# 根據標籤查詢資源
az graph query -q "Resources | where tags['azd-env-name'] == 'production' | project name, type, location"

# 查找失敗的部署
az graph query -q "ResourceContainers | where type == 'microsoft.resources/resourcegroups' | extend deploymentStatus = properties.provisioningState | where deploymentStatus != 'Succeeded'"

# 檢查資源健康狀況
az graph query -q "HealthResources | where properties.targetResourceId contains 'myapp' | project properties.targetResourceId, properties.currentHealthStatus"
```

### 網絡調試
```bash
# 測試服務之間的連接
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

# 使用
test_connectivity "/subscriptions/.../myapp-web" "myapp-api.azurewebsites.net" 443
```

### 容器調試
```bash
# 調試容器應用程式問題
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

### 數據庫連接調試
```bash
# 調試數據庫連接
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

## 🔬 性能調試

### 應用性能監控
```bash
# 啟用應用程式洞察調試
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

# 自訂性能監控
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

### 資源使用分析
```bash
# 監控資源使用
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

## 🧪 測試與驗證

### 集成測試調試
```bash
#!/bin/bash
# debug-integration-tests.sh

set -e

echo "Running integration tests with debugging..."

# 設置調試環境
export NODE_ENV=test
export DEBUG=*
export LOG_LEVEL=debug

# 獲取服務端點
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

echo "Testing endpoints:"
echo "Web: $WEB_URL"
echo "API: $API_URL"

# 測試健康端點
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

# 執行自定義集成測試
npm run test:integration
```

### 負載測試調試
```bash
# 簡單負載測試以識別性能瓶頸
load_test() {
    local url=$1
    local concurrent=${2:-10}
    local requests=${3:-100}
    
    echo "Load testing $url with $concurrent concurrent connections, $requests total requests"
    
    # 使用 Apache Bench（安裝：apt-get install apache2-utils）
    ab -n "$requests" -c "$concurrent" -v 2 "$url" > load-test-results.txt
    
    # 提取關鍵指標
    echo "=== Load Test Results ==="
    grep -E "(Time taken|Requests per second|Time per request)" load-test-results.txt
    
    # 檢查失敗情況
    grep -E "(Failed requests|Non-2xx responses)" load-test-results.txt
}
```

## 🔧 基礎設施調試

### Bicep 模板調試
```bash
# 驗證 Bicep 模板並提供詳細輸出
validate_bicep() {
    local template_file=$1
    
    echo "Validating Bicep template: $template_file"
    
    # 語法驗證
    az bicep build --file "$template_file" --stdout > /dev/null
    
    # Lint 驗證
    az bicep lint --file "$template_file"
    
    # 假設部署
    az deployment group what-if \
        --resource-group "myapp-dev-rg" \
        --template-file "$template_file" \
        --parameters @main.parameters.json
}

# 調試模板部署
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

### 資源狀態分析
```bash
# 分析資源狀態是否有不一致
analyze_resources() {
    local resource_group=$1
    
    echo "=== Resource Analysis for $resource_group ==="
    
    # 列出所有資源及其狀態
    az resource list --resource-group "$resource_group" \
        --query "[].{name:name,type:type,provisioningState:properties.provisioningState,location:location}" \
        --output table
    
    # 檢查失敗的資源
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

## 🔒 安全調試

### 身份驗證流程調試
```bash
# 調試 Azure 身份驗證
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

# 調試 Key Vault 訪問
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

### 網絡安全調試
```bash
# 調試網絡安全組
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

## 📱 應用特定調試

### Node.js 應用調試
```javascript
// debug-middleware.js - Express 調試中介軟件
const debug = require('debug')('app:debug');

module.exports = (req, res, next) => {
    const start = Date.now();
    
    // 記錄請求詳情
    debug(`${req.method} ${req.url}`, {
        headers: req.headers,
        query: req.query,
        body: req.body,
        userAgent: req.get('User-Agent'),
        ip: req.ip
    });
    
    // 覆蓋 res.json 以記錄回應
    const originalJson = res.json;
    res.json = function(data) {
        const duration = Date.now() - start;
        debug(`Response ${res.statusCode} in ${duration}ms`, data);
        return originalJson.call(this, data);
    };
    
    next();
};
```

### 數據庫查詢調試
```javascript
// database-debug.js - 數據庫調試工具
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

## 🚨 緊急調試程序

### 生產問題響應
```bash
#!/bin/bash
# emergency-debug.sh - 緊急生產調試

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

# 收集關鍵信息
echo "=== 1. System Status ==="
azd show --output json > emergency-status.json
cat emergency-status.json | jq '.services[].endpoint'

echo "=== 2. Application Health ==="
for endpoint in $(cat emergency-status.json | jq -r '.services[].endpoint'); do
    echo "Testing $endpoint/health"
    curl -f "$endpoint/health" || echo "❌ Health check failed for $endpoint"
done

echo "=== 3. Recent Errors ==="
azd logs --level error --since 30m > emergency-errors.log
echo "Error count: $(wc -l < emergency-errors.log)"

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

### 回滾程序
```bash
# 快速回滾腳本
quick_rollback() {
    local environment=$1
    local backup_timestamp=$2
    
    echo "🔄 INITIATING ROLLBACK for $environment to $backup_timestamp"
    
    # 切換環境
    azd env select "$environment"
    
    # 回滾應用程式
    azd deploy --rollback --timestamp "$backup_timestamp"
    
    # 驗證回滾
    echo "Verifying rollback..."
    azd show
    
    # 測試關鍵端點
    WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
    curl -f "$WEB_URL/health" || echo "❌ Rollback verification failed"
    
    echo "✅ Rollback completed"
}
```

## 📊 調試儀表板

### 自定義監控儀表板
```bash
# 建立應用程式洞察查詢以進行除錯
create_debug_queries() {
    local app_insights_name=$1
    
    # 查詢錯誤
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "exceptions | where timestamp > ago(1h) | summarize count() by problemId, outerMessage"
    
    # 查詢性能問題
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "requests | where timestamp > ago(1h) and duration > 5000 | project timestamp, name, duration, resultCode"
    
    # 查詢依賴失敗
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "dependencies | where timestamp > ago(1h) and success == false | project timestamp, name, target, resultCode"
}
```

### 日誌聚合
```bash
# 從多個來源匯總日誌
aggregate_logs() {
    local output_file="aggregated-logs-$(date +%Y%m%d_%H%M%S).json"
    
    echo "Aggregating logs to $output_file"
    
    {
        echo '{"source": "azd", "logs": ['
        azd logs --output json --since 1h | sed '$ ! s/$/,/'
        echo ']}'
        
        echo ',{"source": "azure", "logs": ['
        az monitor activity-log list --start-time "$(date -d '1 hour ago' -Iseconds)" --output json | sed '$ ! s/$/,/'
        echo ']}'
    } > "$output_file"
    
    echo "Logs aggregated in $output_file"
}
```

## 🔗 高級資源

### 自定義調試腳本
創建一個 `scripts/debug/` 目錄，包含：
- `health-check.sh` - 全面的健康檢查
- `performance-test.sh` - 自動化性能測試
- `log-analyzer.py` - 高級日誌解析與分析
- `resource-validator.sh` - 基礎設施驗證

### 監控集成
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

## 最佳實踐

1. **在非生產環境中始終啟用調試日誌**
2. **為問題創建可重現的測試案例**
3. **為您的團隊記錄調試程序**
4. **自動化健康檢查和監控**
5. **隨應用變更更新調試工具**
6. **在非事故時間練習調試程序**

## 下一步

- [容量規劃](../pre-deployment/capacity-planning.md) - 規劃資源需求
- [SKU 選擇](../pre-deployment/sku-selection.md) - 選擇合適的服務層級
- [預檢查](../pre-deployment/preflight-checks.md) - 部署前驗證
- [備忘單](../../resources/cheat-sheet.md) - 快速參考命令

---

**記住**: 良好的調試需要系統化、徹底和耐心。這些工具和技術將幫助您更快、更有效地診斷問題。

---

**導航**
- **上一課**: [常見問題](common-issues.md)

- **下一課**: [容量規劃](../pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：  
本文件已使用人工智能翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。儘管我們努力確保翻譯的準確性，但請注意，自動翻譯可能包含錯誤或不準確之處。應以原始語言的文件作為權威來源。對於重要信息，建議使用專業人工翻譯。我們對因使用此翻譯而引起的任何誤解或誤釋不承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->